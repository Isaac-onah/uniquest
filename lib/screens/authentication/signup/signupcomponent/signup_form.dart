import 'package:flutter/material.dart';
import 'package:uniquest/controllers/signup_controller.dart';
import 'package:uniquest/screens/authentication/signup/signupcomponent/lterms_condition_checkbox.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/constants/text_strings.dart';
import 'package:uniquest/utils/helpers/helper_functions.dart';
import 'package:uniquest/utils/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());

    return Form(
        key: controller.signupFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwSections,
          ),
          child: Column(
            children: [
              ///Email
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  ///firstName
                  Expanded(
                    child: TextFormField(
                      expands: false,
                      controller: controller.firstName,
                      validator: (value) =>
                          TValidator.validateEmptyText('First Name', value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: TTexts.firstNome,
                        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),

                  ///Last Name
                  Expanded(
                    child: TextFormField(
                      expands: false,
                      controller: controller.lastName,
                      validator: (value) => TValidator.validateEmptyText('Last Name', value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: TTexts.lastName,
                        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              ///PhoneNumber
              TextFormField(
                controller: controller.phoneNumber,
                keyboardType: TextInputType.phone,
                validator: (value) => TValidator.validatePhoneNumber(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.call),
                  labelText: TTexts.phoneNo,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              ///password
              Obx (()=>TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) => TValidator.validatePassword(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                ),
              )),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              ///confirm password
              TextFormField(
                controller: controller.confirmpassword,
                obscureText: controller.hidePassword.value,
                validator: (value) => TValidator.validatePasswordConfirmation(value, controller.password.text),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TTexts.confirmpassword,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              /// Terms&Conditions Checkbox
              TTermsAndConditionCheckbox(dark: dark),

              /// Sign Up Button
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Sign In Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.signup(),
                      child: const Text(TTexts.LoginSurTitle)))
            ],
          ),
        ));
  }
}
