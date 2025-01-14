import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uniquest/data/model/usermodel.dart';
import 'package:uniquest/data/repositories/authentication_repository.dart';
import 'package:uniquest/utils/exceptions/firebase_exceptions.dart';
import 'package:uniquest/utils/exceptions/format_exceptions.dart';
import 'package:uniquest/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance=>Get.find();



  /// Function to save user data to firestore
 Future<void> saveUserRecord(UserModel user) async{

}

/// Funcion to fetch user details based on user ID
  Future<void> fetchUserDetails() async{


  }
/// Function to update user data in Firestore
  Future<void> updateUserDetails(UserModel updateUser) async{


  }
/// Update any field in specific User Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async{



  }
/// Function to remove user data from Firestore
  Future<void> removerUserData(String userId) async{


  }


/// Upload any Image
Future<void> uploadingImage(String path, XFile image) async{

}
}