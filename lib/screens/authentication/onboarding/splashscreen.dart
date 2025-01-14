import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uniquest/screens/authentication/login/loginscreen.dart';
import 'package:uniquest/screens/authentication/signup/signup.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.53,
                width: size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: TColors.subprimary,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/image.png",
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.6,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text("Discover your\nDream job Here",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 30)),
                    const SizedBox(height: 25),
                    Text(
                        "Explore all the most exiting jobs roles\nbased on your interest And study major",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall),
                    SizedBox(height: size.height * 0.07),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all( TSizes.xs,),
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: backgroundColor3.withOpacity(0.9),
                          border: Border.all(
                            color: Colors.white,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => Get.to(const loginScreen()),
                                child: Text("Sign In",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge!.copyWith(color: TColors.white)),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () => Get.to(const SignUpScreen()),
                                child: Text("Register",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge!.copyWith(color: TColors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
