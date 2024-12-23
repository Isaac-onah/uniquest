import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uniquest/data/model/usermodel.dart';
import 'package:uniquest/data/repositories/authentication_repository.dart';
import 'package:uniquest/utils/exceptions/firebase_exceptions.dart';
import 'package:uniquest/utils/exceptions/format_exceptions.dart';
import 'package:uniquest/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance=>Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to firestore
 Future<void> saveUserRecord(UserModel user) async{
   try{
     await _db.collection("Users").doc(user.id).set(user.toJson());
   }on FirebaseException catch (e){
     throw TFirebaseException(e.code).message;
   } on FormatException catch(_){
     throw const TFormatException();
   } on PlatformException catch (e){
     throw TPlatformException(e.code).message;
   }catch(e){
     throw 'Somrthing went wrong. Please try again';
   }

}

/// Funcion to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async{
    try{
      final userId = AuthenticationRepository.instance.authUser?.uid;
      print('Fetching details for user ID: $userId'); // Debug print

      final documentSnapshot = await _db.collection("Users").doc(userId).get();
      print(documentSnapshot.exists);
      print(documentSnapshot);
      if (documentSnapshot.exists) {
        print('object');
        final user = UserModel.fromSnapshot(documentSnapshot);
        print(user);
        print('Fetched user details: ${user.toJson()}'); // Debug print
        return user;
      } else {
        print('No user found with ID: $userId'); // Debug print
        return UserModel.empty();
      }
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch(e){
      print('ht$e');
      throw 'Somrthing went wrong. Please try again';
    }

  }
/// Function to update user data in Firestore
  Future<void> updateUserDetails(UserModel updateUser) async{
    try{
      await _db.collection("Users").doc(updateUser.id).update(updateUser.toJson());
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Somrthing went wrong. Please try again';
    }

  }
/// Update any field in specific User Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async{
    try{
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Somrthing went wrong. Please try again';
    }

  }
/// Function to remove user data from Firestore
  Future<void> removerUserData(String userId) async{
    try{
      await _db.collection("Users").doc(userId).delete();
    }on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Somrthing went wrong. Please try again';
    }

  }


/// Upload any Image
Future<String> uploadingImage(String path, XFile image) async{
  try{
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  }on FirebaseException catch (e){
    throw TFirebaseException(e.code).message;
  } on FormatException catch(_){
    throw const TFormatException();
  } on PlatformException catch (e){
    throw TPlatformException(e.code).message;
  }catch(e){
    throw 'Somrthing went wrong. Please try again';
  }
}
}