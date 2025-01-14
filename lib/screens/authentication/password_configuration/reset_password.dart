import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uniquest/controllers/forget_password_controller.dart';
import 'package:uniquest/screens/authentication/login/loginscreen.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/image_strings.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/constants/text_strings.dart';
import 'package:uniquest/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon:const Icon(CupertinoIcons.clear))
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),child: Column(
          children: [
        ///images
            Image(image: AssetImage(TImages.onboardingImage1), width: THelperFunctions.screenWidth() * 0.6,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            ///Title and subtitle
            Text(email, style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            ///buttons
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: ()=>Get.offAll(()=> const loginScreen()), child: const Text(TTexts.done))),
            const SizedBox(height: TSizes.spaceBtwItems,),
            SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: ButtonStyle(
                      splashFactory: InkRipple.splashFactory, // You can use different splash effects
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return TColors.primary.withOpacity(0.3); // Customize the splash color
                          }
                          return null; // Defer to the default splash color
                        },
                      ),
                    ),
                    onPressed: ()=> ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(TTexts.resendEmail, style: TextStyle(color: TColors.primary, fontWeight: FontWeight.w600),))),
          ],
        ),),
      ) ,
    );
  }
}
