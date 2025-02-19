import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uniquest/controllers/user_controller.dart';
import 'package:uniquest/data/repositories/user_repository.dart';
import 'package:uniquest/main.dart';
import 'package:uniquest/screens/navigationscreens/navigation_menu.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profileScreen.dart';
import 'package:uniquest/utils/constants/image_strings.dart';
import 'package:uniquest/utils/helpers/network_manager.dart';
import 'package:uniquest/utils/popups/full_screen_loader.dart';
import 'package:uniquest/utils/popups/loader.dart';

class UpdateDetailsController extends GetxController {
  static UpdateDetailsController get instance => Get.find();

  ///variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final avatarUrl = RxnString();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserDetailsFormKey = GlobalKey<FormState>();

  final isUpLoading = false.obs;
  final isUpdating = false.obs;

  @override
  void onInit() {
    initializeDetails();
    super.onInit();
  }


  /// Fetch user record
  Future<void> initializeDetails() async {
    firstName.text = userController.userInfo.value.firstName;
    lastName.text = userController.userInfo.value.lastName;
    phoneNumber.text = userController.userInfo.value.phoneNumber;
  }

  /// Save user Record from any Registration Provider
    Future<void> updateUserDetails() async {
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
        if (!updateUserDetailsFormKey.currentState!.validate()) {
          //remove Loader
          TFullScreenLoader.stopLoading();
          return;
        }


        /// Update user's infomation in the Firebase
        Map<String, dynamic> details = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim(), 'PhoneNumber': phoneNumber.text.trim()};
        await userRepository.updateSingleField(details);


        ///update the Rx User value
        userController.userInfo.value.firstName = firstName.text.trim();
        userController.userInfo.value.lastName = lastName.text.trim();
        userController.userInfo.value.phoneNumber = phoneNumber.text.trim();

        //remove Loader
        TFullScreenLoader.stopLoading();

        ///show success Message
        TLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Account Details has been updated.');

        ///Move to verify Email screen
        Get.to(() => const ProfileScreen());
      } catch (e) {
  //remove Loader
        TFullScreenLoader.stopLoading();

        ///show generic error to user
        TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      }
    }

  Future<void> updateProfile() async {
    if (isUpdating.value) return;
    isUpdating.value = true;

    try {
      final user = supabase.auth.currentUser;
      if (user == null) throw Exception("User not logged in");

      final updates = {
        'id': 2,
        'first_name': firstName.text.trim(),
        'last_name': lastName.text.trim(),
        'phone_number': phoneNumber.text.trim(),
        'updated_at': DateTime.now().toIso8601String(),
      };

      await supabase.from('profile').upsert(updates);
      userController.onInit();
      Get.back();
      Get.snackbar("Success", "Profile updated successfully", snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isUpdating.value = false;
    }
  }

  Future<void> uploadAvatar() async {


    try {
      final picker = ImagePicker();
      final imageFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 300,
        maxHeight: 300,
      );

      if (imageFile == null) return;

      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = fileName;

      if (isUpLoading.value) return;
      isUpLoading.value = true;

      await supabase.storage.from('avatars').uploadBinary(
        filePath,
        bytes,
        fileOptions: FileOptions(contentType: imageFile.mimeType),
      );

      final imageUrlResponse = await supabase.storage
          .from('profilepictures')
          .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);

      avatarUrl.value = imageUrlResponse;

      // Update profile with avatar URL
      final userId = supabase.auth.currentUser!.id;
      await supabase.from('users').upsert({
        'id': userId,
        'avatar_url': imageUrlResponse,
      });

      Get.snackbar("Success", "Avatar updated successfully", snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isUpLoading.value = false;
    }
  }
  }
