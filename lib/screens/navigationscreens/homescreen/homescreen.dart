import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uniquest/controllers/universitycontroller.dart';
import 'package:uniquest/screens/navigationscreens/homescreen/hoomewidget/homeheader.dart';
import 'package:uniquest/screens/navigationscreens/homescreen/hoomewidget/universitycard.dart';
import 'package:uniquest/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final UniversityController controller = Get.put(UniversityController());
    controller.onInit();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultScreenpadding),
          child: Column(
            children: [
             HomeHeader(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Expanded(
                child:  Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.universities.isEmpty) {
                    return Center(child: Text("No universities found"));
                  }
                  return ListView.builder(
                    itemCount: controller.universities.length,
                    itemBuilder: (context, index) {
                      final university = controller.universities[index];
                      return UniversityCard(university: university);
                    },
                  );
                }),
              )

            ],
          ),
        ),
      ),
    );
  }
}



