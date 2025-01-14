
import 'package:flutter/material.dart';
import 'package:uniquest/data/model/usermodel.dart';
import 'package:uniquest/data/repositories/authentication_repository.dart';
import 'package:uniquest/data/repositories/user_repository.dart';
import 'package:uniquest/screens/authentication/login/loginscreen.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/re_authenticate_user_login_form.dart';
import 'package:uniquest/utils/constants/image_strings.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/helpers/network_manager.dart';
import 'package:uniquest/utils/popups/full_screen_loader.dart';
import 'package:uniquest/utils/popups/loader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> userInfo = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  RxBool refreshData = true.obs;
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final amount = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> fundFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {

  }

  /// Save user Record from any Registration Provider


  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This is not reversible and all of your data will be removed permanently',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }



  /// Delete user Account
  void deleteUserAccount() async {

  }

  /// --RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {

  }

  ///upload Profile Image
  uploadUserProfilePicture() async {

  }



}
