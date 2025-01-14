import 'package:flutter/material.dart';
import 'package:uniquest/screens/authentication/login/loginscreen.dart';
import 'package:uniquest/screens/authentication/signup/signupcomponent/signup_form.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class  SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding:EdgeInsets.all(TSizes.defaultSpace,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: TSizes.appBarHeight*2,
              ),
              ///title and welcome statement
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height:  TSizes.sm,),
              Row(
                children: [
                  Text(TTexts.signupSubTitle, style: Theme.of(context).textTheme.bodyMedium,),
                  const SizedBox(width:  TSizes.sm,),
                  TextButton(style:TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, minimumSize: Size.zero, padding: EdgeInsets.zero, foregroundColor: TColors.primary), onPressed: ()=>Get.to(()=> const loginScreen()), child: Text(TTexts.loginTitle, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: TColors.primary),)),
                ],
              ),
              ///Form
              TSignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}
