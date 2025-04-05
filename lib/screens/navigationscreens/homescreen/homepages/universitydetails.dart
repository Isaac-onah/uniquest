import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uniquest/data/model/university.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';

class UniversityDetailPage extends StatelessWidget {
  final University university;

  UniversityDetailPage({required this.university});

  @override
  Widget build(BuildContext context) {
    // var departments = university.departments ?? [];
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
                university.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red,),
                  SizedBox(width: 4),
                  Text(
                    '${university.city}, ${university.country}',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Text(
                university.description,
                style: TextStyle(fontSize: 16, color: Colors.black87,),textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Admission Fee: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    '\$${university.country}',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Contact
              if (university.contact.isNotEmpty) ...[
                Text('Contact Info -',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 8),
                SizedBox(
                  height: 80, // adjust based on your card height
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // number of rows in your horizontal scroll
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      childAspectRatio: 0.3, // width / height of each card
                    ),
                    itemCount: university.contact.length,
                    itemBuilder: (context, index) {
                      final contact = university.contact[index];
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(contact.office, style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Iconsax.call,
                                  color: Colors.red,),
                                SizedBox(width: 5),
                                Text(contact.phone)
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Iconsax.message,
                                  color: Colors.red,),
                                SizedBox(width: 5),
                                Text(contact.email)
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
              // Campuses
              if (university.campus.isNotEmpty) ...[
                Text('Campus Info -',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: 8),
                SizedBox(
                  height: 80, // adjust based on your card height
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // number of rows in your horizontal scroll
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      childAspectRatio: 0.35, // width / height of each card
                    ),
                    itemCount: university.campus.length,
                    itemBuilder: (context, index) {
                      final campuses = university.campus[index];
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(campuses.name, style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Row(
                              children: [
                                getCityIcon(campuses.city,),
                                SizedBox(width: 5),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(campuses.address),
                                    SizedBox(width: 5),
                                    Text(campuses.city),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
              // Faculties
              if (university.faculties.isNotEmpty) ...[
                _buildSectionTitle('Faculties & Programs'),
                ...university.faculties.expand((faculty) => [
                  _buildFacultyCard(faculty),
                  ...faculty.departments.expand((dept) =>
                      dept.programs.map((program) => _buildProgramCard(program))
                  ),
                ]).toList(),
                const SizedBox(height: 20),
              ],


            ],
          ),
        ),
      ),
    );
  }
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
  Widget _buildContactCard(Contact contact) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.office, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
  Widget _buildFacultyCard(Faculty faculty) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(faculty.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (faculty.departments.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Text('Departments:', style: TextStyle(fontStyle: FontStyle.italic)),
              ...faculty.departments.map((dept) =>
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('- ${dept.name}'),
                  )).toList(),
            ],
          ],
        ),
      ),
    );
  }
  Widget _buildProgramCard(Program program) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(program.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(program.description),
              if (program.admissionRequirements.isNotEmpty) ...[
                const SizedBox(height: 8),
                const Text('Admission Requirements:', style: TextStyle(fontStyle: FontStyle.italic)),
                ...program.admissionRequirements.map((req) =>
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('- ${req.description}'),
                    )).toList(),
              ],
            ],
          ),
        ),
      ),
    );
  }
  Widget getCityIcon(String city) {
    switch (city.toLowerCase()) {
      case 'paris':
        return Image.asset('assets/eiffel-tower.png', width: 40,color: Colors.red,);
      case 'new york':
        return Image.asset('assets/statue-of-liberty.png', width: 40,color: Colors.red,);
      case 'london':
        return Image.asset('assets/big-ben.png', width: 40,color: Colors.red,);
      case 'berlin':
        return Image.asset('assets/brandenburg-gate.png', width: 40,color: Colors.red,);
      case 'cape town':
        return Image.asset('assets/table-mountain.png', width: 40,color: Colors.red,);
      case 'tokyo':
        return Image.asset('assets/tokyo-tower.png', width: 40,color: Colors.red,);
      case 'sydney':
        return Image.asset('assets/australia.png', width: 40,color: Colors.red,);
      case 'toronto':
        return Image.asset('assets/cn-tower.png', width: 40,color: Colors.red,);
      default:
        return const Icon(Icons.location_city, size: 40,color: Colors.red,);
    }
  }
}

