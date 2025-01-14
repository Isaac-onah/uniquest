import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uniquest/controllers/signup_controller.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/policyprivate.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(children: [
      SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(
              activeColor: TColors.primary,
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value))),
      const SizedBox(width: TSizes.spaceBtwItems / 2),
      Expanded(
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),

          TextSpan(
            text: '${TTexts.privacyPolicy} ',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Add your terms of use link navigation logic here
                showDialog(
                    context: context,
                    // configuration: FadeScaleTransitionConfiguration(),
                    builder: (context) {
                      return policyDialog(
                        mdFileName: 'privacy.md',
                      );});
              },
          ), // TextSpan

          TextSpan(text: 'and ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: TTexts.termsOfUse,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Add your terms of use link navigation logic here
                // Add your terms of use link navigation logic here
                showDialog(
                    context: context,
                    // configuration: FadeScaleTransitionConfiguration(),
                    builder: (context) {
                      return policyDialog(
                        mdFileName: 'terms.md',
                      );});
              },
          ), // TextSpan
        ]
                // Text.rich

                ) // Row

            ),
      ),
    ]);
  }
}
