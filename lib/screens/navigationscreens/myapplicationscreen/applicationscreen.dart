import 'package:flutter/material.dart';
import 'package:uniquest/screens/navigationscreens/homescreen/hoomewidget/homeheader.dart';
import 'package:uniquest/screens/navigationscreens/myapplicationscreen/applicationwidget/applicationcards.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';

class MyApplicationScreen extends StatelessWidget {
  const MyApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultScreenpadding),
          child: Column(
            children: [
              HomeHeader(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (Context, index){
                    return  ApplicationCard();
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}