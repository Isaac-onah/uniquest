import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uniquest/screens/navigationscreens/myapplicationscreen/applicationsub/trackapplication.dart';
import 'package:uniquest/utils/constants/color.dart';

class ApplicationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1,color: TColors.grey)
      ),
      width: 350,
      child: Column(
        children: [
          ListTile(
            onTap: (){
              Get.to(() =>ApplicationTrackingPage());
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/unimalta.jpg', // Replace with your image URL
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text(
              'University of Wolverhampton',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: const Text(
              'Application ID: 698094554317',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1, color: TColors.grey),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Confirmed',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const Text(
                  '17 Sep 2023  11:21 AM',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}