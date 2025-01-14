import 'package:flutter/material.dart';
import 'package:uniquest/Commons/styles/spacing_styles.dart';
import 'package:uniquest/Commons/widgets/appbar/appbar.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/edit_form.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarheight,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TEditForm(),
          ]),
        ),
      ),
    );
  }
}
