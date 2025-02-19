import 'package:flutter/material.dart';
import 'package:uniquest/data/model/university.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';

class UniversityDetailPage extends StatelessWidget {
  final University university;

  UniversityDetailPage({required this.university});

  @override
  Widget build(BuildContext context) {
    var departments = university.departments ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('University Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:TSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // University Info Section
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/unimalta.jpg', // Replace with your image URL
                  height: 450,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                university.universityName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    '${university.city}, ${university.country}',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: List.generate(5, (index) {
                  return Icon(Icons.star, color: Colors.amber, size: 20);
                }),
              ),
              SizedBox(height: 16),
              Text(
                'Contact: ${university.email}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 16),
              Text(
                university.history,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Admission Fee: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    '\$${university.admissionFee}',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
              SizedBox(height: 32),

              // Department and Course List
              ListView.builder(
                itemCount: departments.length,
                shrinkWrap: true, // Makes the ListView take only as much space as needed
                physics: NeverScrollableScrollPhysics(), // Disables scrolling in the ListView
                itemBuilder: (context, departmentIndex) {
                  var department = departments[departmentIndex];
                  var courses = department.courses ?? [];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
                    ),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                      childrenPadding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                      backgroundColor: Colors.transparent,
                      iconColor: TColors.primary,
                      shape: const Border(),
                      title: Text(department.departmentName),
                      children: [
                        ListView.builder(
                          itemCount: courses.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(), // Prevents inner ListView from scrolling
                          itemBuilder: (context, courseIndex) {
                            final course = courses[courseIndex];
                            return ListTile(
                              title: Text(course.courseName),
                              subtitle: Text(
                                'Mode: ${course.mode} | Duration: ${course.duration} years',
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

