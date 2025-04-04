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
      isSigningUp.value = true;

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isSigningUp.value = false;
        Get.snackbar("No Internet", "Please check your internet connection");
        return;
      }

      // Form validation
      if (!signupFormKey.currentState!.validate()) {
        isSigningUp.value = false;
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        isSigningUp.value = false;
        Get.snackbar("Policy Required", "Please accept the privacy policy");
        return;
      }

      // Create user in Auth
      final authResponse = await authService.signUpWithEmailPassword(
          email.text.trim(),
          password.text.trim()
      );

      if (authResponse.user == null) {
        throw Exception("User creation failed");
      }
      // Save user data
      final newUser = UserModel(
        id: authResponse.user!.id, // Use the auth UID
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      await userRepository.saveUserRecord(newUser);

      isSigningUp.value = false;
      Get.snackbar("Success", "Account created! Please verify your email");
      Get.offAll(() => loginScreen());

    } catch (e) {
      isSigningUp.value = false;
      Get.snackbar("Error", e.toString());
      print("Signup error: ${e.toString()}");
    }
  }




}
