import 'package:flutter/material.dart';
import 'package:uniquest/controllers/forget_password_controller.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/constants/text_strings.dart';
import 'package:uniquest/utils/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body:Padding(padding: EdgeInsets.all(TSizes.defaultSpace),child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
///headings
          Text(TTexts.forgetPassword, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Text(TTexts.forgetPasswordSub, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
          const SizedBox(height: TSizes.spaceBtwSections * 2,),

          ///Text field
          Form(
            key: controller.forgetPasswordFormKey,
            child: TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
                floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections,),

          ///submit Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail(), child: const Text(TTexts.resetPassword)))
        ],
      ),) ,
    );
  }
}
