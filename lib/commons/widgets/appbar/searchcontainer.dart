import 'package:flutter/material.dart';
import 'package:uniquest/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uniquest/utils/constants/color.dart';


class TSearchContainer extends StatelessWidget {
  TSearchContainer({
    super.key, required this.searchController, this.icon = Iconsax.search_normal, this.showBackground = true, this.showBorder = true, this.onChanged, required this.text,
  });
  TextEditingController searchController;
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: text,
        border: InputBorder.none,
        prefixIcon: Icon(icon, color: dark ? TColors.lightGrey : TColors.darkGrey)
      ),
      onChanged: onChanged,
    );
  }
}
