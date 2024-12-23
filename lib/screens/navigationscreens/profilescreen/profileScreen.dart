import 'package:flutter/material.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/profilePicture.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/profileheader.dart';
import 'package:uniquest/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              /// -- User Profile Picture
              userProfilePicture(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              ///Header  -- appbar
              TProfileHeader(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

