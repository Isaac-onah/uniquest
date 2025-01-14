import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/helpers/helper_functions.dart';

class policyDialog extends StatelessWidget {
  policyDialog({
    Key? key,
    this.radius = 18,
    required this.mdFileName,
  })  : assert(mdFileName.contains('.md'), 'The file must contain the .md extension'),
        super(key: key);

  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Dialog(backgroundColor: TColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(Duration(milliseconds: 100)).then((value) {
                return rootBundle.loadString('assets/$mdFileName');
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    color: dark ? TColors.black : TColors.white,
                    padding: const EdgeInsets.all(16.0),
                    child: Markdown(
                      data: snapshot.data.toString(),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: TColors.primary,
                  ),
                );
              },
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, minimumSize: Size(88, 44),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius),bottomRight: Radius.circular(radius)),
              ),
              backgroundColor: TColors.primary,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
              ),
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              child: const Text(
                "CLOSE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}