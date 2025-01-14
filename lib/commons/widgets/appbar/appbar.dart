import 'package:flutter/material.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/device/device_utility.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingInPressed, this.showArrowColor = false});

  final Widget? title;
  final bool showBackArrow, showArrowColor;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingInPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Iconsax.arrow_left, color: showArrowColor ? Colors.white : null,))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingInPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  //TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
