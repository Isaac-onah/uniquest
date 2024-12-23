import 'package:flutter/material.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Iconsax.notification_bing5,
              size: 30,
              color: darkMode ? TColors.primary : iconColor,
            )),
        Positioned(
            right: 10,
            top: 5,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: TColors.primary,
                  borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: TColors.white, //                   <--- border color
                  width: 2.0,
                ),),

            ))
      ],
    );
  }
}
