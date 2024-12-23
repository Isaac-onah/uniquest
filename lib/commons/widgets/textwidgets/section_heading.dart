import 'package:flutter/material.dart';
import 'package:uniquest/utils/constants/color.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({super.key, this.textColor, this.showActionButton = false, required this.title, this.buttonTitle = 'View All', this.onPressed});

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,),
        if(showActionButton)TextButton(onPressed: onPressed, child:Text(buttonTitle, style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.primary,)))
      ],
    );
  }

}


