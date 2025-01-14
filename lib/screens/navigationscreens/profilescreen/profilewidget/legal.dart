import 'package:flutter/material.dart';
import 'package:uniquest/Commons/widgets/appbar/appbar.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/more_list_option.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/policyprivate.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class UserLegal extends StatelessWidget {
  const UserLegal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Legal', style:  Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child:Column(
              children: [
                TMoreoptionList(
                  iconData: Iconsax.security_user,
                  title: 'Privacy Policy',
                  onpressed: () {
                    // Add your terms of use link navigation logic here
                    showDialog(
                        context: context,
                        // configuration: FadeScaleTransitionConfiguration(),
                        builder: (context) {
                          return policyDialog(
                            mdFileName: 'privacy.md',
                          );});
                  },
                ),
                TMoreoptionList(
                  iconData: Iconsax.document_text,
                  title: 'Terms of Services',
                  onpressed:() {
                    // Add your terms of use link navigation logic here
                    showDialog(
                        context: context,
                        // configuration: FadeScaleTransitionConfiguration(),
                        builder: (context) {
                          return policyDialog(
                            mdFileName: 'terms.md',
                          );});
                  },
                ),
              ],
            )

        ),
      ),
    );
  }
}
