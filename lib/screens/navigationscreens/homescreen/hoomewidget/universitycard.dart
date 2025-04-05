import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uniquest/data/model/university.dart';
import 'package:uniquest/screens/navigationscreens/homescreen/homepages/universitydetails.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';

class UniversityCard extends StatelessWidget {
  final University university;

  UniversityCard({required this.university});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Get.to(UniversityDetailPage(university: university)),
      child: Container(
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1,color: TColors.grey)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top:Radius.circular(11)),
              child: Image.asset(
                'assets/unimalta.jpg', // Replace with your image URL
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Text(university.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                                Iconsax.cup,
                                color: Colors.red,
                                size: 20,
                              ),
                          const SizedBox(width: 8),
                          Text('${university.globalRanking.toString()}th',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(width: 28),
                      Row(
                        children: [
                          Icon(
                                Iconsax.buildings,
                                color: Colors.red,
                                size: 20,
                              ),
                          const SizedBox(width: 8),
                          Text(university.type,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height:4),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 18),
                      SizedBox(width: 4),
                      Text('${university.city}, ${university.country}',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Iconsax.global, color: Colors.grey, size: 18),
                      SizedBox(width: 4),
                      Text(university.website,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                 Row(
                    children: [
                      Icon(Icons.email, color: Colors.grey, size: 18),
                      SizedBox(width: 4),
                      Text(university.shortName,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DEADLINE: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(university.admissionDeadline.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}


