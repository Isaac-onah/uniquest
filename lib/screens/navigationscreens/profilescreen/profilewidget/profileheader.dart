import 'package:flutter/material.dart';
import 'package:uniquest/controllers/user_controller.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/faq.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/getHelp.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/legal.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/more_list_option.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProfileHeader extends StatelessWidget {
  const TProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Container(
      child: Column(
        children: [
          /// -- More Details
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.spaceBtwItems/1.2,
                horizontal: TSizes.spaceBtwItems),
            child: Row(
              children: [Text('Settings',style: Theme.of(context).textTheme.titleLarge,)],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Column(
              children: [
                TMoreoptionList(
                  iconData: Iconsax.message_question,
                  title: 'FAQs',
                  onpressed: ()=>Get.to(()=> const FaqPage()),
                ),
                TMoreoptionList(
                  iconData: Iconsax.medal_star,
                  title: 'Legal',
                  onpressed:  ()=>Get.to(()=> const UserLegal()),
                ),
                TMoreoptionList(
                  iconData: Iconsax.info_circle,
                  title: 'Get Help',
                  onpressed:  ()=>Get.to(()=> const getHelp()),
                ),
                TMoreoptionList(
                  iconData: Iconsax.logout,
                  title: 'Sign Out',
                  onpressed: ()=>controller.authService.signOut(),
                ),
                TMoreoptionList(
                  iconData: Iconsax.profile_delete,
                  title: 'Delete Account',
                  iconstate: false,
                  onpressed: ()=> controller.deleteAccountWarningPopup(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
