
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uniquest/data/repositories/auth_gate.dart';
import 'package:uniquest/screens/authentication/onboarding/splashscreen.dart';

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
          Get.offAll(AuthGate());
      } catch (e) {
        debugPrint('Error during screen redirect: $e');
        Get.offAll(() => const MySplashScreen());
      }
  }


  /* ---------------------------------------- ./end Federated identity & social sign in ------------------------------------ */
  Future<void> logout() async {

  }

}

