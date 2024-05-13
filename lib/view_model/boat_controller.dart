import 'dart:developer';

import 'package:chatboat/model/firestore_model.dart';
import 'package:chatboat/view_model/firestore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class BoatChatCtrl extends GetxController {
  TextEditingController questionCtrl =
      TextEditingController(text: 'What is flutter');
  bool isLoadingAns = false;
  static const String key = 'AIzaSyDr9OuXdV4zMasHUHS3OxWxOh8iocF8_Vk';
  String textAnswer = '';
  int bodyCurrentInd = 0;
  String currentDate = '';
  String currentTime = '';
  var uuid = const Uuid();

  Future<void> boatChatHandling(context) async {
    final fc = Get.find<FireStoreCtrl>();
    String id = uuid.v1();
    formateDate(DateTime.now());
    try {
      isLoadingAns = true;
      bodyCurrentInd = 1;
      update();
      final model = GenerativeModel(model: 'gemini-pro', apiKey: key);
      final content = [Content.text(questionCtrl.text)];
      final response = await model.generateContent(content);
      log(response.text ?? '');
      log('${questionCtrl.text} $currentDate  $currentTime  $id');
      await fc.addHistoryToFirestore(
        context: context,
        model: FirestoreModel(
          id: id,
          ans: response.text,
          qus: questionCtrl.text,
          date: currentDate,
          time: currentTime,
        ),
      );
      await fc.getHistoryFromApp();
    } catch (e) {
      log(e.toString());
      isLoadingAns = false;
      update();
    }
    isLoadingAns = false;
    update();
  }

  void formateDate(DateTime dateTime) {
    currentTime = DateFormat('hh:mm:ss').format(dateTime);
    currentDate = DateFormat.MMMMEEEEd().format(dateTime);
  }
}
