import 'package:flutter/material.dart';
import 'package:uniquest/data/model/chatmodel.dart';
import 'package:uniquest/screens/navigationscreens/chat/chatwidgets/chat_composer.dart';
import 'package:uniquest/screens/navigationscreens/chat/chatwidgets/conversation.dart';
import 'package:uniquest/utils/constants/color.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
  final User user;
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Conversation(user: widget.user),
                ),
              ),
            ),
            buildChatComposer()
          ],
        ),
      ),
    );
  }
}