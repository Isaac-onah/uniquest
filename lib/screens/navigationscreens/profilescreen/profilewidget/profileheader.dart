import 'package:flutter/material.dart';
import 'package:uniquest/controllers/user_controller.dart';
import 'package:uniquest/data/repositories/authentication_repository.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/edit_profile.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/faq.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/getHelp.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/legal.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/more_list_option.dart';
import 'package:uniquest/utils/constants/color.dart';
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
          /// -- Personal Profile
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.spaceBtwItems/1.2,
                horizontal: TSizes.spaceBtwItems),
            color: TColors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Personal Info'),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Column(
              children: [
                TMoreoptionList(
                  iconData: Iconsax.user,
                  title: 'Profile Details',
                  onpressed: ()=>Get.to(()=> const editProfile()),
                ),
                TMoreoptionListup(
                  iconData: Iconsax.link_square,
                  title: 'My Referral Code',
                  surfixIcon: Iconsax.copy,
                  subTitle: controller.userInfo.value.referral,
                ),
              ],
            ),
          ),

          /// -- More Details
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.spaceBtwItems/1.2,
                horizontal: TSizes.spaceBtwItems),
            color: TColors.grey,
            child: const Row(
              children: [Text('More')],
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
                  onpressed: ()=>AuthenticationRepository.instance.logout(),
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
