import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uniquest/data/model/content.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  late List<Widget> filteredExpansionTiles;

  @override
  void initState() {
    super.initState();
    // Initialize with all tiles
    filteredExpansionTiles = optionitems.map((item) {
      return buildExpansionTile(item);
    }).toList();
  }

  // Method to generate ExpansionTile dynamically
  Widget buildExpansionTile(faq item) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0x499C9B9B),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ExpansionTile(
              backgroundColor: Colors.transparent,
              iconColor: TColors.primary,
              leading: Icon(Iconsax.message_question),
              shape: Border(),
              title: Text(
                item.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.subtitle,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Method to filter ExpansionTiles based on search query
  void updateFilteredTiles(String query) {
    setState(() {
      if (query.isEmpty) {
        // Show all tiles if the query is empty
        filteredExpansionTiles = optionitems.map((item) {
          return buildExpansionTile(item);
        }).toList();
      } else {
        // Filter tiles based on the query
        filteredExpansionTiles = optionitems.where((item) {
          return item.title.toLowerCase().contains(query.toLowerCase());
        }).map((item) {
          return buildExpansionTile(item);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130.0,
            floating: false,
            pinned: true,
            title: Center(
              child: Text(
                'FAQS',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodySmall,
                  cursorColor: TColors.primary,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: BorderSide(
                        color: TColors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: TColors.primary,
                      ),
                    ),
                    hintText: 'FAQ Search...',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: updateFilteredTiles,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              filteredExpansionTiles,
            ),
          ),
        ],
      ),
    );
  }
}
