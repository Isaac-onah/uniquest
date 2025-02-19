
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uniquest/data/repositories/auth_service.dart';
import 'package:uniquest/screens/navigationscreens/navigation_menu.dart';
import 'package:uniquest/utils/helpers/network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  ///variables
  final isLoggingin  = false.obs;
  final rememberMe = true.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  ///get auth service
  final authService = AuthService();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// --Email and password SignIn
  Future<void> userLogin() async {
    isLoggingin.value = true;
    try {
      // check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoggingin.value = false;
        Get.snackbar("No Internet", "Please check your internet connection and try again.");
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        isLoggingin.value = false;
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      }

      await authService.signInWithEmailPassword(email.text.trim(), password.text.trim());

      isLoggingin.value = false;

      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoggingin.value = false;
    }
  }

}
