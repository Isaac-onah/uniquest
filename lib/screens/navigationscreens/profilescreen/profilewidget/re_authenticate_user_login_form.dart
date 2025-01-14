import 'package:flutter/material.dart';
import 'package:uniquest/controllers/user_controller.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/constants/text_strings.dart';
import 'package:uniquest/utils/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User'),),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child:Form(
          key: controller.reAuthFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///email
              TextFormField(
                controller: controller.verifyEmail,
                validator: (value) => TValidator.validateEmail(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields,),
              ///password
              Obx(
                    ()=> TextFormField(
                  controller: controller.verifyPassword,
                  obscureText: controller.hidePassword.value,
                  validator: (value) => TValidator.validateEmptyText('Password', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: TTexts.password,
                    floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                  ),
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections,),
              ///Sign In Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>controller.reAuthenticateEmailAndPasswordUser(), child: const Text(TTexts.delete,))),

            ],
          ),
        ),
        ),
      ),
    );
  }
}
