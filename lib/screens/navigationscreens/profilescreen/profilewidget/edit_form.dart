import 'package:flutter/material.dart';
import 'package:uniquest/controllers/update_details_controller.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/constants/text_strings.dart';
import 'package:uniquest/utils/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TEditForm extends StatelessWidget {
  const TEditForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateDetailsController());
    return Form(
        key: controller.updateUserDetailsFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:  TSizes.spaceBtwSections,),
          child: Column(
            children: [
              /// First NAME
              TextFormField(
                controller: controller.firstName,
                cursorColor: TColors.primary,
                validator: (value) => TValidator.validateEmptyText('First Name',value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: TTexts.firstNome,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields,),
              /// Last Name
              TextFormField(
                controller: controller.lastName,
                cursorColor: TColors.primary,
                validator: (value) => TValidator.validateEmptyText('Last Name',value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: TTexts.lastName,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields,),
              ///Phone Number
              TextFormField(
                controller: controller.phoneNumber,
                cursorColor: TColors.primary,
                  keyboardType: TextInputType.phone,
                validator: (value) => TValidator.validatePhoneNumber(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.call),
                  labelText: TTexts.phoneNo,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections,),
              ///Sign In Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>controller.updateUserDetails(), child: const Text(TTexts.updateProfile,))),
            ],
          ),
        ));
  }
}
