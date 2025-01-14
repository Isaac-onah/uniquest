import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:uniquest/data/model/usermodel.dart';
import 'package:uniquest/data/repositories/authentication_repository.dart';
import 'package:uniquest/data/repositories/user_repository.dart';
import 'package:uniquest/screens/authentication/signup/verify_email.dart';
import 'package:uniquest/utils/popups/loader.dart';
import 'package:uniquest/utils/constants/image_strings.dart';
import 'package:uniquest/utils/helpers/network_manager.dart';
import 'package:uniquest/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final _random = Random();
  final _alphanumericChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- SIGNUP
  Future<void> signup() async {
    try {
      ///start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information ...', TImages.decorAnimation);

      ///check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Form validation
      if (!signupFormKey.currentState!.validate()) {
        //remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      ///Privacy Policy Check
      if (!privacyPolicy.value) {
        //remove Loader
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use');
        return;
      }





      ///Save Authenticated user data in the firebase firestore




      //remove Loader
      TFullScreenLoader.stopLoading();

      ///show success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      ///Move to verify Email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
//remove Loader
      TFullScreenLoader.stopLoading();

      ///show generic error to user
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<String> generateUniqueReferralCode() async {
    String referralCode = '';
    bool isUnique = false;


    return referralCode;
  }
  String _generateRandomCode() {
    const length = 12;
    return List.generate(
        length,
            (index) =>
        _alphanumericChars[_random.nextInt(_alphanumericChars.length)])
        .join();
  }


}
