import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uniquest/data/model/chatmodel.dart';
import 'package:uniquest/screens/navigationscreens/chat/chatscreen.dart';
import 'package:uniquest/screens/navigationscreens/homescreen/homescreen.dart';
import 'package:uniquest/screens/navigationscreens/myapplicationscreen/applicationscreen.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilescreen.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=>NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1):TColors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(
              icon: Icon(Iconsax.home, color: controller.selectedIndex.value == 0 ? TColors.primary : null),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.document_text_1, color: controller.selectedIndex.value == 1 ? TColors.primary : null),
              label: 'Applications',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.messages_2, color: controller.selectedIndex.value == 2 ? TColors.primary : null),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user, color: controller.selectedIndex.value == 3 ? TColors.primary : null),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(()=>controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [HomeScreen(),const MyApplicationScreen(), Chatscreen(),const ProfileScreen()];
}