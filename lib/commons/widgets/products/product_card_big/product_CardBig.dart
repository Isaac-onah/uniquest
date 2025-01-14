// import 'package:flutter/material.dart';
// import 'package:uniquest/Commons/styles/shadow.dart';
// import 'package:uniquest/commons/widgets/favorite/favoriteIcon.dart';
// import 'package:uniquest/commons/widgets/products/rounde_container.dart';
// import 'package:uniquest/utils/constants/color.dart';
// import 'package:uniquest/utils/constants/enums.dart';
// import 'package:uniquest/utils/constants/sizes.dart';
// import 'package:uniquest/utils/formatter/formatter.dart';
// import 'package:uniquest/utils/helpers/helper_functions.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class TProductCardBig extends StatelessWidget {
//   const TProductCardBig({super.key, required this.foodItem, required this.branchdetails});
//
//   final FoodModel foodItem;
//   final branchModel branchdetails;
//
//   @override
//   Widget build(BuildContext context) {
//     final cartController = Get.put(CartController());
//     double parsedPrice = foodItem.foodPrice;
//     final dark = THelperFunctions.isDarkMode(context);
//     return GestureDetector(
//       onTap: () => Get.to(() => foodDetailScreen(
//             foodItem: foodItem, branchdetails: branchdetails,
//           )),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//             boxShadow: [TShadowStyle.bigProduct],
//             borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//             color: THelperFunctions.isDarkMode(context)
//                 ? TColors.darkerGrey
//                 : TColors.white),
//         child: Column(
//           children: [
//             /// Thumbnail. like button
//             TRoundedContainer(
//               height: 160,
//               backgroundColor: dark ? TColors.dark : TColors.light,
//               child:Stack(
//                 children: [
//                   TRoundedImageProduct(imageUrl: foodItem.profilePicture),
//
//                   ///favorite
//                   Positioned(
//                       top: 0,
//                       right: 0,
//                       child: FavouriteIcon(foodId: foodItem.foodId,))
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: TSizes.spaceBtwItems / 2,
//             ),
//
//             /// -- details
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           foodItem.foodName,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                         Text(
//                           foodItem.foodDescription,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           softWrap: false,
//                           style: Theme.of(context).textTheme.labelLarge,
//                         ),
//                         const SizedBox(
//                           height: TSizes.spaceBtwItems / 2,
//                         ),
//                         Text(
//                           TFormatter.formatCurrency(parsedPrice),
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           style: Theme.of(context).textTheme.labelMedium!.copyWith(color: TColors.primary, fontFamily:  GoogleFonts.mPlusRounded1c().fontFamily),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: TSizes.spaceBtwItems,
//                   ),
//                   InkWell(
//                     onTap: (){
//                       //if the product have variation then show the product Detail for variation selection
//                       //else add product to cart
//                       if(foodItem.foodType == FoodType.single.toString()){
//
//                         final cartItem = cartController.convertToCartItem(foodItem, 1, branchdetails.id);
//                         cartController.addOneToCart(cartItem, branchdetails.id);                      }else{
//                         Get.to(()=>foodDetailScreen(
//                           foodItem: foodItem, branchdetails: branchdetails,
//                         ));
//                       }
//                     },
//                     child: Obx(() {
//                       final productQuantityInCart = cartController.getProductQuantityInCart(foodItem.foodId);
//                       return Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: TSizes.sm, vertical: TSizes.sm),
//                         decoration: BoxDecoration(
//                           color: TColors.primary.withOpacity(0.3),
//                           borderRadius: BorderRadius.circular(
//                             TSizes.sm,
//                           ),
//                         ),
//                         child: productQuantityInCart > 0 ? Text(productQuantityInCart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary),):Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Center(
//                                 child: Text(
//                               'Add',
//                               textAlign: TextAlign.center,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyLarge!
//                                   .copyWith(color: TColors.primary),
//                             )),
//                             const Icon(
//                               Icons.add_rounded,
//                               size: 20,
//                               color: TColors.primary,
//                             ),
//                           ],
//                         ),
//                       );},
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: TSizes.spaceBtwItems / 2,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class TFavoriteCardBig extends StatelessWidget {
//   const TFavoriteCardBig({super.key, required this.foodItem});
//
//   final FoodModel foodItem;
//
//   @override
//   Widget build(BuildContext context) {
//     final cartController = Get.put(CartController());
//     double parsedPrice = foodItem.foodPrice;
//     final dark = THelperFunctions.isDarkMode(context);
//     return GestureDetector(
//       onTap:  () => Get.to(() => THomeAllRestaurants()),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//             boxShadow: [TShadowStyle.bigProduct],
//             borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//             color: THelperFunctions.isDarkMode(context)
//                 ? TColors.darkerGrey
//                 : TColors.white),
//         child: Column(
//           children: [
//             /// Thumbnail. like button
//             TRoundedContainer(
//               height: 160,
//               backgroundColor: dark ? TColors.dark : TColors.light,
//               child:Stack(
//                 children: [
//                   TRoundedImageProduct(imageUrl: foodItem.profilePicture),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: TSizes.spaceBtwItems / 2,
//             ),
//
//             /// -- details
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           foodItem.foodName,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                         Text(
//                           foodItem.foodDescription,
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           softWrap: false,
//                           style: Theme.of(context).textTheme.labelLarge,
//                         ),
//                         const SizedBox(
//                           height: TSizes.spaceBtwItems / 2,
//                         ),
//                         Text(
//                           TFormatter.formatCurrency(parsedPrice),
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           style: Theme.of(context).textTheme.labelMedium!.copyWith(color: TColors.primary, fontFamily:  GoogleFonts.mPlusRounded1c().fontFamily),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: TSizes.spaceBtwItems,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: TSizes.spaceBtwItems / 2,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
