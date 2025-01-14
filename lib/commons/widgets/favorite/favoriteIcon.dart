//
// import 'package:flutter/material.dart';
// import 'package:uniquest/screens/navigationscreens/main_screen_controller/favouriteController.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
//
// class FavouriteIcon extends StatelessWidget {
//   const FavouriteIcon({super.key, required this.foodId});
//
//   final String foodId;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller  = Get.put(FavouritesController());
//     return Obx( ()=>   TCircularIcon(
//         icon: controller.isFavorite(foodId) ? Iconsax.heart5 : Iconsax.heart,
//         color:controller.isFavorite(foodId) ? Colors.red : null,
//       onPressed: ()=> controller.toggleFavoriteProduct(foodId),
//       ),
//     );
//   }
// }
