import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uniquest/Commons/styles/spacing_styles.dart';
import 'package:uniquest/Commons/widgets/appbar/appbar.dart';
import 'package:uniquest/controllers/update_details_controller.dart';
import 'package:uniquest/main.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/editprofile/avatar.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/editprofile/edit_form.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/constants/text_strings.dart';
import 'package:uniquest/utils/validator.dart';

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

