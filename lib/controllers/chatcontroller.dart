import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:uniquest/data/model/chatmodel.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;  // RxList to make messages reactive
  var isLoading = false.obs;  // RxBool to handle loading state
  final TextEditingController controller = TextEditingController();

  // Function to call Gemini model and fetch response
  callGeminiModel() async {
    try {
      if (controller.text.isNotEmpty) {
        // Add the user message to the list
        messages.add(Message(text: controller.text, isUser: true));
        isLoading.value = true; // Show loading indicator
      }

      final model = GenerativeModel(model: 'gemini-pro', apiKey: "AIzaSyCzxDdwLq_ATNRNNJvbmOkUTI8lFFlge8A");
      final prompt = controller.text.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      // Update messages list with the response from Gemini
      messages.add(Message(text: response.text!, isUser: false));
      isLoading.value = false; // Hide loading indicator

      controller.clear();  // Clear the input text field
    } catch (e) {
      print("Error: $e");
      isLoading.value = false; // Hide loading indicator on error
    }
  }
}
