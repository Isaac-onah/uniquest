
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();



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


  /// [EmailAuthentication] - REGISTRATION

  /// [EmailAuthentication] - FORGET PASSWORD



  /// [EmailVerification] - MAIL VERIFICATION

  /// [EmailVerification] - RE AUTHENTICATE USER


  /* ---------------------------------------- ./end Federated identity & social sign in ------------------------------------ */
  Future<void> logout() async {

  }

  /// DELETE USER - Remove user Auth and Firestore Account
  Future<void> deleteAccount() async {

  }
}

