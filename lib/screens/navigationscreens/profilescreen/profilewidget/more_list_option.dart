import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TMoreoptionList extends StatelessWidget {
  const TMoreoptionList({
    super.key, required this.iconData, this.surfixIcon = Iconsax.arrow_right_3,  required this.title, this.iconstate = true, required this.onpressed,
  });

  final IconData iconData;
  final IconData surfixIcon;
  final String title;
  final bool iconstate;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          GestureDetector(
            onTap: onpressed,
            child: Padding(
              padding:const  EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems/2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(iconData,color:title == 'Delete Account'?TColors.error:null),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:title == 'Delete Account'?TColors.error:null),
                          ),
                        ],
                      ),
                    ),
                  ),

                 Icon(surfixIcon,color:title == 'Delete Account'?TColors.error:null)
                ],
              ),
            ),
          ),
          iconstate ?
          const Divider(
            height: 0,
            thickness: 0.5,
            color: TColors.grey,
          ) :const SizedBox()
        ],
      ),
    );
  }
}



class TMoreoptionListup extends StatelessWidget {
  const TMoreoptionListup({
    super.key, required this.iconData, this.surfixIcon = Iconsax.arrow_right_3, required this.title, this.iconstate = false, required this.subTitle, this.dividerstate = true,
  });

  final IconData iconData;
  final IconData surfixIcon;
  final String title;
  final String subTitle;
  final bool iconstate, dividerstate;

  ///---copy value
  void _copyToClipboard(String text) {
    FlutterClipboard.copy(text).then((result) {
      // You can show a Snackbar or any other UI feedback here
      print('Address copied to clipboard: $text');
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Padding(
            padding:const  EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems/6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(iconData),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,style: Theme.of(context).textTheme.bodyMedium!
                        ),
                        Text(
                          subTitle,
                          style: const TextStyle(
                              color: Color(0xFFA5ABB1),
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),

                      ],
                    ),
                  ),
                ),
                IconButton(onPressed: (){
                  _copyToClipboard(subTitle);
                }, icon: const Row(
                  children: [
                    Text('Copy', style: TextStyle(color: TColors.primary),),
                    Icon(Iconsax.copy,color: TColors.primary),
                  ],
                ),)
              ],
            ),
          ),
          dividerstate ?
          const Divider(
            height: 0,
            thickness: 0.5,
            color: TColors.grey,
          ) :const SizedBox()
        ],
      ),
    );
  }
}