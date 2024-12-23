import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uniquest/data/repositories/user_repository.dart';
import 'package:uniquest/screens/authentication/login/loginscreen.dart';
import 'package:uniquest/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:uniquest/utils/exceptions/firebase_exceptions.dart';
import 'package:uniquest/utils/exceptions/format_exceptions.dart';
import 'package:uniquest/utils/exceptions/platform_exceptions.dart';
import 'package:uniquest/utils/popups/full_screen_loader.dart';
import 'package:uniquest/utils/storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;
  final deviceStorage = GetStorage();

  @override
  void onReady() {

    //remove the native splash screen
    FlutterNativeSplash.remove();

    //Redirect to the appropriate screen
    screenRedirect();

  }

  Future<void> screenRedirect() async {
    try {

      String userAccessToken = deviceStorage.read('USERACCESS') ?? '';
      print(userAccessToken);
      if (userAccessToken.isNotEmpty) {
        ///initialize user specific Storage
        // await MyLocalStorage.init(user.uid);

        /// User document exists, proceed with login, navigate to the main navigation menu
        ///var result =  Get.offAll(() =>  const ServiceProviderScreen());
        // if (result != null) {
        //   result.then((value) => TFullScreenLoader.stopLoading());
        // }
      } else {
        // Get.offAll(() => const LoginScreen());
      }
    } catch (e) {
      debugPrint('Error during screen redirect: $e');
      /// Handle the error as needed
      // Get.offAll(() => const LoginScreen());
    }
  }

/* ------------------------------ Email and Password sign in ---------------------------------------*/

  /// [EmailAuthentication] - Sign In
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - REGISTRATION
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailVerification] - RE AUTHENTICATE USER
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      //Create Credentials
      AuthCredential credential =
      EmailAuthProvider.credential(email: email, password: password);

      // Reauthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /* ---------------------------------------- ./end Federated identity & social sign in ------------------------------------ */
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const loginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// DELETE USER - Remove user Auth and Firestore Account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removerUserData(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}

