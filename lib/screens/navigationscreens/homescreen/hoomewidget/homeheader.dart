import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uniquest/controllers/user_controller.dart';
import 'package:uniquest/utils/constants/color.dart';

class HomeHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userDetailscontroller = Get.put(UserController());
    userDetailscontroller.onInit();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                'assets/Leslie.jpg', // Replace with your image URL
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                      () => Row(
                    children: [
                      Text(userDetailscontroller.userInfo.value.fullName,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
                Text(
                  'New Jersey, USA',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(Iconsax.notification, color: TColors.primary),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Good Morning 👋',
          style: TextStyle(fontSize: 18, color: Colors.grey[800]),
        ),
        const SizedBox(height: 8),
        const Text(
          'Find Your Dream School Here',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        const Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'School Search...',
                  border: InputBorder.none,
                  suffixIcon: Icon(Iconsax.search_normal)
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

