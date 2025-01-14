import 'dart:async';

import 'package:uniquest/commons/widgets/success_screen/success_screen.dart';
import 'package:uniquest/data/repositories/authentication_repository.dart';
import 'package:uniquest/utils/constants/image_strings.dart';
import 'package:uniquest/utils/constants/text_strings.dart';
import 'package:uniquest/utils/popups/loader.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  ///send Email whenever Verify Screen appears abd set timer for auto redirect.
 @override
  void onInit(){
   sendEmailVerification();
   super.onInit();
 }

 ///send Email Verification link
 sendEmailVerification() async {
  try{
   TLoaders.successSnackBar(title: 'Email Sent', message: 'Please Check your inbox and verify your email.');
  }catch(e){
   TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
 }

 ///Timer to automatically redirect on Email Vrification
 setTimerForAutoRedirect(){
  Timer.periodic(const Duration(seconds: 1), (timer) async{

   if(true){
    timer.cancel();
    Get.off(()=>SuccessScreen(image: TImages.successfullyRegisterAnimation, title: TTexts.yourAccountCreated, subTitle: TTexts.yourAccountCreadtedSubTitle, onPressed: ()=>AuthenticationRepository.instance.screenRedirect()));
   }
  });
 }
 
 
 ///manually check if email verified
 checkEmailVerificationStatus() async{

}
}