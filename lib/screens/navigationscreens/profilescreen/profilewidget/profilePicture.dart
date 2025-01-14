import 'package:flutter/material.dart';
import 'package:uniquest/Commons/widgets/loaders/shimmer.dart';
import 'package:uniquest/controllers/user_controller.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/circular_image.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/image_strings.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class userProfilePicture extends StatelessWidget {
  const userProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Center(
      child: Column(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),),
            child: Stack(
              children: [
               Obx(() {
                 final networkImage = controller.userInfo.value.profilePicture;
                 final image = networkImage.isNotEmpty ? networkImage : TImages.profile;
                 return controller.imageUploading.value ? const TShimmerEffect(width: 120, height: 120, radius: 100,) : Center(child: TCircularImage(image: image, width:120, height: 120, isNetworkImage:networkImage.isNotEmpty));
               }),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                      onPressed: ()=> controller.uploadUserProfilePicture(),
                      icon: Container(
                    padding: const EdgeInsets.all(TSizes.xs),
                    decoration: const BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(100)),
                        color: TColors.white),
                    child: const Padding(
                      padding: EdgeInsets.all(TSizes.xs),
                      child: Icon(Iconsax.camera, color: TColors.primary,),
                    ),
                  )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                // if (controller.profileLoading.value) {
                //   //Display a shimmer loader while user profile is beign loaded
                //   return const TShimmerEffect(width: 80, height: 15);
                // }else {
                  return Text(controller.userInfo.value.fullName,
                      style: Theme.of(context).textTheme.headlineSmall!);
              //}
              }),            ],
          )
        ],
      ),
    );
  }
}