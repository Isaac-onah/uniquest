import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/profilePicture.dart';
import 'package:uniquest/screens/navigationscreens/profilescreen/profilewidget/profileheader.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.defaultScreenpadding, vertical: 50),
          children: [
            // COLUMN THAT WILL CONTAIN THE PROFILE
            userProfileHeader(),


            Row(
              children: [
                /// -- More Details
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwItems / 1.2,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Settings',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ),
                const Text(
                  "(1/5)",
                  style: TextStyle(
                    color: TColors.primary,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(children: [
              Container(
                width: MediaQuery.of(context).size.width / 5,
                height: 7,
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TColors.primary,
                ),
              ),
            ]),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final card = profileCompletionCards[index];
                  return SizedBox(
                    width: 170,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1, color: TColors.grey)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(11)),
                            child: Image.asset(
                              card.icon,
                              height: 80,
                              fit: BoxFit
                                  .cover, // Ensures the image is scaled properly.
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      card.title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Define button action here.
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(card.buttonText),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Padding(padding: EdgeInsets.only(right: 10)),
                itemCount: profileCompletionCards.length,
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            const TProfileHeader(),
          ],
        ),
      ),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final String icon;

  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "University of Malta",
    icon: "assets/unimalta.jpg",
    buttonText: "view",
  ),
  ProfileCompletionCard(
    title: "University of Malta",
    icon: "assets/unimalta.jpg",
    buttonText: "view",
  ),
  ProfileCompletionCard(
    title: "University of Malta",
    icon: "assets/unimalta.jpg",
    buttonText: "view",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;

  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "Activity",
  ),
  CustomListTile(
    icon: Icons.location_on_outlined,
    title: "Location",
  ),
  CustomListTile(
    title: "Notifications",
    icon: CupertinoIcons.bell,
  ),
  CustomListTile(
    title: "Logout",
    icon: CupertinoIcons.arrow_right_arrow_left,
  ),
];
