import 'dart:developer';
import 'dart:io';
import 'package:chatboat/model/firestore_model.dart';
import 'package:chatboat/view_model/firestore_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class BoatChatCtrl extends GetxController {
  TextEditingController questionCtrl = TextEditingController();
  FocusNode questionFocous = FocusNode();
  bool isLoadingAns = false;
  static const String key = 'AIzaSyDr9OuXdV4zMasHUHS3OxWxOh8iocF8_Vk';
  int bodyCurrentInd = 0;
  String currentDate = '';
  String currentTime = '';
  var uuid = const Uuid();
  File? selectedImage;

  void bodyCurrentIndState(int ind) {
    bodyCurrentInd = ind;
    update();
  }

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
      log('$currentDate  $currentTime  $id');
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
      await fc.getHistoryFromFireStore();
    } catch (e) {
      log(e.toString());
      isLoadingAns = false;
      update();
    }
    isLoadingAns = false;
    update();
  }

  void formateDate(DateTime dateTime) {
    currentTime = DateFormat('hh:mm').format(dateTime);
    currentDate = DateFormat.MMMMEEEEd().format(dateTime);
  }

  Future<void> imageFromGalleryOrCamera({bool isCamera = false}) async {
    final ImagePicker picker = ImagePicker();
    if (isCamera) {
      final XFile? cameraFile =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
      if (cameraFile != null) {
        selectedImage = File(cameraFile.path);
        Get.back();
        update();
      }
    } else {
      final XFile? gfile = await picker.pickImage(source: ImageSource.gallery);
      if (gfile != null) {
        selectedImage = File(gfile.path);
        Get.back();
        update();
      }
    }
  }

  void clearSelectedImage() {
    selectedImage = null;
    update();
  }
}
