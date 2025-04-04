import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uniquest/data/model/usermodel.dart';
import 'package:uniquest/main.dart';


class UserRepository extends GetxController{
  static UserRepository get instance=>Get.find();




  /// Function to save user data to Supabase
  Future<void> saveUserRecord(UserModel user) async {
    try {
      final userData = {
        'id':  user.id,
        'email': user.email,
        'first_name': user.firstName,
        'last_name': user.lastName,
        'phone_number': user.phoneNumber,
        'profile_picture': user.profilePicture,
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      };

      final response = await supabase
          .from('users')
          .insert(userData)
          .select()
          .single();
      // if (response.status != 201) {
      //   throw Exception(response.error?.message ?? 'Failed to save user record');
      // }
      print(response);
      print('User record saved successfully');
    } catch (e) {
      print('Error saving user record: $e');
      rethrow; // Rethrow to handle in the calling function
    }
  }


  /// Funcion to fetch user details based on user ID
  /// Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails(String userId) async {

    try {
      final response = await supabase.from('users').select().eq('email', userId).single();

      // Check if the response contains an error
      if (response.isEmpty) {
        throw Exception('Failed to fetch user details');
      }
      UserModel userdetails =  UserModel.fromJson(response);
    return userdetails;
    } catch (e) {
      print('Error fetching user details: $e');
      UserModel userdetails =  UserModel.empty();
      return userdetails;
    }
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