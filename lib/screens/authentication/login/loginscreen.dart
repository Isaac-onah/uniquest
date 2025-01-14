import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uniquest/controllers/login_controller.dart';
import 'package:uniquest/screens/authentication/password_configuration/forgot_password.dart';
import 'package:uniquest/screens/authentication/signup/signup.dart';
import 'package:uniquest/screens/navigationscreens/navigation_menu.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/constants/text_strings.dart';
import 'package:uniquest/utils/validator.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.spaceBtwSections,
          ),
          children: [
            SizedBox(height: size.height * 0.13),
            Text("Hello Again!",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 30)),
            const SizedBox(height: 15),
            Text(
              "Wellcome back vou've\nbeen missed!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: size.height * 0.05),
            // for username and password
            ///email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.alternate_email_outlined),
                labelText: TTexts.email,
                floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(
              height: TSizes.sm,
            ),

            ///password
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) =>
                    TValidator.validateEmptyText('Password', value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password_outlined),
                  labelText: TTexts.password,
                  floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(
                        controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                        color: controller.hidePassword.value
                            ? null
                            : TColors.primary,
                      )),
                ),
              ),
            ),
            const SizedBox(height: 10),
            /// Remember Me and Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember Me
                Row(
                  children: [
                    Obx(()=> Checkbox(activeColor:TColors.primary,value: controller.rememberMe.value, onChanged: (value)=> controller.rememberMe.value =!controller.rememberMe.value)),  const Text(TTexts.rememberMe),
                  ],
                ),
                /// Forgot Password
                TextButton(onPressed: ()=>Get.to(()=> const ForgotPassword()), child: const Text(TTexts.forgetPassword,style: TextStyle(color: TColors.primary),)),

              ],
            ),
            SizedBox(height: size.height * 0.04),
            Column(
              children: [
                // for sign in button
                ///Sign In Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.off(() => const NavigationMenu()),
                        child: const Text(
                          TTexts.signIn,
                        ))),
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: size.width * 0.2,
                      color: Colors.black12,
                    ),
                    const Text(
                      "  Or continue with   ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: TColors.textColor2,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      height: 2,
                      width: size.width * 0.2,
                      color: Colors.black12,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: socialIcon("assets/google.png")),
                  ],
                ),
                SizedBox(height: size.height * 0.07),
                Text.rich(
                  TextSpan(
                      text: "Not a member? ",
                      style: const TextStyle(
                        color: TColors.textColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: "Register now",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => const SignUpScreen());
                            },
                        )
                      ]),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  Container socialIcon(image) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Image.asset(
        image,
        height: 35,
      ),
    );
  }

  Container myTextField(String hint, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 22,
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 19,
            ),
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              color: color,
            )),
      ),
    );
  }
}
