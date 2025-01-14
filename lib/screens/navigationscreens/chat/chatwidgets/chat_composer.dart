import 'package:flutter/material.dart';
import 'package:uniquest/utils/constants/color.dart';


Container buildChatComposer() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    height: 100,
    child: Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type your message ...',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 16,
        ),
        CircleAvatar(
          backgroundColor: TColors.primary,
          child: Icon(
            Icons.send,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
