import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uniquest/Commons/widgets/loaders/shimmer.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage(
      {super.key,
      required this.image,
      this.isNetworkImage = false,
      this.overlayColor,
      this.backgroundColor,
      this.width = 56,
      this.height = 56,});


  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? (THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage ?
              CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: image,
                width: width,
                progressIndicatorBuilder: (context, url, downloadProgress) => TShimmerEffect(width: width, height: height),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ):

          Image(fit: BoxFit.cover, image:AssetImage(image),width: width,),

        ),
      ),
    );
  }
}
