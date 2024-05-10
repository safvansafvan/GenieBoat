import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class BoatChatCtrl extends GetxController {
  TextEditingController questionCtrl =
      TextEditingController(text: 'What is flutter');
  bool isLoadingAns = false;
  static const String key = 'AIzaSyDr9OuXdV4zMasHUHS3OxWxOh8iocF8_Vk';
  String textAnswer = '';
  int bodyCurrentInd = 0;
  Future<void> boatChatHandling() async {
    try {
      isLoadingAns = true;
      bodyCurrentInd = 1;
      update();
      final model = GenerativeModel(model: 'gemini-pro', apiKey: key);
      final content = [Content.text(questionCtrl.text)];
      final response = await model.generateContent(content);
      log(response.text ?? '');
      textAnswer = response.text ?? "";
    } catch (e) {
      log(e.toString());
      isLoadingAns = false;
      update();
    }
    isLoadingAns = false;
    update();
  }
}
