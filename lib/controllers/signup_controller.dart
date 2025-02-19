import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:uniquest/data/model/usermodel.dart';
import 'package:uniquest/data/repositories/auth_service.dart';
import 'package:uniquest/data/repositories/user_repository.dart';
import 'package:uniquest/screens/authentication/login/loginscreen.dart';

import 'package:uniquest/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final isSigningUp  = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final userRepository = Get.put(UserRepository());


  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  ///get auth service
  final authService = AuthService();
  /// -- SIGNUP
  Future<void> signup() async {
    try {
      ///start loading
      isSigningUp.value = true;
      ///check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove Loader
        isSigningUp.value = false;
        return;
      }
      ///Form validation
      if (!signupFormKey.currentState!.validate()) {
        //remove Loader
        isSigningUp.value = false;
        return;
      }
      ///Privacy Policy Check
      if (!privacyPolicy.value) {
        //remove Loader
        isSigningUp.value = false;
        Get.snackbar("Accept Privacy Policy", "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use");
        return;
      }
      print("user.up");

      print(email.text.trim());
      print(password.text.trim());
      final res = await authService.signUpWithEmailPassword(email.text.trim(), password.text.trim());
      print(res);
      print("user.id");
      if(res.user != null ){
        ///Save Authenticated user data in the firebase firestore
        final newUser = UserModel(
            id:'',
            firstName: firstName.text.trim(),
            lastName: lastName.text.trim(),
            email: email.text.trim(),
            phoneNumber: phoneNumber.text.trim(),
            profilePicture: '');

        userRepository.saveUserRecord(newUser);
        isSigningUp.value = false;
        Get.snackbar("Congratulations", "Your account has been created! Verify email to continue");
        Get.offAll(loginScreen());
      }else{
        isSigningUp.value = false;
        ///show generic error to user
        Get.snackbar("Oh Snap", "Failed to create account");
      }
    } catch (e) {
//remove Loader

      isSigningUp.value = false;
print(e.toString());
      ///show generic error to user
      Get.snackbar("Oh Snap", e.toString());
    }
  }




}
