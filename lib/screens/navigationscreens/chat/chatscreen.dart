import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uniquest/controllers/chatcontroller.dart';
import 'package:uniquest/utils/constants/color.dart';
import 'package:uniquest/utils/constants/sizes.dart';
import 'package:uniquest/utils/helpers/helper_functions.dart';// Import the GetX controller

class Chatscreen extends StatelessWidget {
  const Chatscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize GetX Controller
    final ChatController chatController = Get.put(ChatController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/gpt-robot.png', color: TColors.inprimary,),
            SizedBox(width: 10,),
            Text('UnquestBot', style: Theme.of(context).textTheme.titleLarge,),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: TSizes.md,
          ),
          Expanded(
            child: Obx(() {  // Reactive UI using GetX
              return ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final message = chatController.messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1,color:message.isUser ?  TColors.grey:TColors.inprimary),
                          borderRadius: message.isUser
                              ? BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                              : BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                        ),
                        child: Text(
                          message.text,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          // User input
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: chatController.controller,
                      decoration: InputDecoration(
                          hintText: 'Write your message',
                          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: darkMode ? Colors.black:Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20)
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Obx(() {  // Reactive loading indicator
                    return chatController.isLoading.value
                        ? Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      ),
                    )
                        : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: chatController.callGeminiModel,
                        child: Image.asset('assets/send.png', color: TColors.inprimary,),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
