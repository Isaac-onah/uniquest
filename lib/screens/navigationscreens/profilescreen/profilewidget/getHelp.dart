import 'package:flutter/material.dart';
import 'package:uniquest/Commons/widgets/appbar/appbar.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/more_list_option.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class getHelp extends StatelessWidget {
  const getHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Get Help', style:  Theme.of(context).textTheme.headlineSmall,),),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child:Column(
              children: [
                TMoreoptionListup(
                  iconData: Iconsax.sms,
                  title: 'Email',
                  surfixIcon: Iconsax.copy,
                    subTitle: 'support@foodiiapp.com'
                ),
                TMoreoptionListup(
                  iconData: Iconsax.instagram,
                  title: 'Instagram',
                    surfixIcon: Iconsax.copy,
                    subTitle: 'Foodiiapp'
                ),
                TMoreoptionListup(
                  iconData: Iconsax.messages,
                  title: 'Whatsapp',
                    surfixIcon: Iconsax.copy,
                    subTitle: '0810 981 5231'
                ),
                TMoreoptionListup(
                    iconData:Iconsax.messages_3,  // Use Iconsax.facebook for the Facebook icon,
                    title: 'Facebook',
                    surfixIcon: Iconsax.copy,
                    subTitle: 'facebook.com/foodiiapp'
                ),
                TMoreoptionListup(
                    iconData: Iconsax.messages,
                    title: 'Call Line',
                    surfixIcon: Iconsax.copy,
                    subTitle: '0802 791 3453'
                ),
              ],
            )

        ),
      ),
    );
  }
}
