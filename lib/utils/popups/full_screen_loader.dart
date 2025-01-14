import 'package:flutter/material.dart';
import 'package:uniquest/commons/widgets/loaders/animation_loader.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

///A utility class for managing a full-screen loading dialog
class TFullScreenLoader {
  ///open a full-screen loading dialig with a given text and animation
  ///this method does not return anything
  ///
  /// parameters:
  /// ---text: The text to be displayed in the loading dialog
  /// ---animation: Tha Lottie animation to be shown
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
                child: Container(
              color: THelperFunctions.isDarkMode(Get.context!)
                  ? TColors.dark
                  : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  TAnimationLoaderWidget(text: text, animation: animation)
                ],
              ),
            )));
  }
  ///Stop the currently open loading dialog
///This method doesn't return anything
static  stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
}
}
