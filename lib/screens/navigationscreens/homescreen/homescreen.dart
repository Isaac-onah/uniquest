import 'package:flutter/material.dart';
import 'package:uniquest/screens/navigationscreens/homescreen/hoomewidget/homeheader.dart';
import 'package:uniquest/screens/navigationscreens/homescreen/hoomewidget/universitycard.dart';
import 'package:uniquest/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'assets/image1.jpg',
      'assets/image2.jpg',
      'assets/image3.jpg',
      'assets/image4.jpg',
    ];
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
                  itemCount: imageUrls.length,
                  itemBuilder: (Context, index){
                    return UniversityCard(imageUrl: imageUrls[index]);
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



