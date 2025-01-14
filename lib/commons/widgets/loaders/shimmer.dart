
import 'package:flutter/material.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class TShimmerEffect extends StatelessWidget{
  const TShimmerEffect({
    Key? key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.colors,
}) : super(key: key);

  final double width, height, radius;
  final Color? colors;

  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: colors ?? (dark ? TColors.darkerGrey : TColors.white),
            borderRadius: BorderRadius.circular(radius)
          ),
        ),);
  }

}