import 'package:firebase_auth/firebase_auth.dart';
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
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      userInfo.value = user;
    } catch (e) {
      userInfo(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      ///refresh user Record
      await fetchUserRecord();
      //if no record already stored
      if (userCredentials != null) {
        //convert Name to First and Last Name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');
        //map Data
        final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            referral:userInfo!.value.referral,
            userstatus: userInfo!.value.userstatus,
            usedreferral: userInfo!.value.usedreferral,
            wallet: userInfo!.value.wallet ?? 0.0,
            profilePicture: userCredentials.user!.photoURL ?? '');
        //save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }

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
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.decorAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // re Verify auth Email
        if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// --RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'Processing...', TImages.decorAnimation);

      // check Internaet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!reAuthFormKey.currentState!.validate()) {
        //remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const loginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  ///upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);

      if (image != null) {
        imageUploading.value = true;
        ///upload Image
        final imageUrl =
            await userRepository.uploadingImage('User/Images/Profile', image);

        ///update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);
        userInfo.value.profilePicture = imageUrl;
        TLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh!! Snap',
          message: 'Something went wrong');
    }
    finally{
      imageUploading.value = false;

    }
  }



}
