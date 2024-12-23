import 'package:flutter/material.dart';
import 'package:uniquest/Commons/styles/spacing_styles.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/constants/text_strings.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: TSpacingStyle.paddingWithAppBarheight *2,
        child: Column(
          children: [
            ///image
            Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.8),
            const SizedBox(height: TSizes.spaceBtwSections,),
            ///Title and subtitle
            Text(title, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(subTitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            ///buttons
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text(TTexts.tContinue))),
            const SizedBox(height: TSizes.spaceBtwItems,),
          ],
        ))
      ),
    );
  }
}
