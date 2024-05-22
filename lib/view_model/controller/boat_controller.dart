import 'dart:developer';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:chatboat/model/firestore_model.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/controller/firestore_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
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
  Uint8List? selectedImage;

  void bodyCurrentIndState(int ind) {
    bodyCurrentInd = ind;
    update();
  }

  Future<void> boatChatHandling(context) async {
    isLoadingAns = true;
    update();
    final fc = Get.find<FireStoreCtrl>();
    String id = uuid.v1();
    formateDate(DateTime.now());
    try {
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
    } finally {
      isLoadingAns = false;
      update();
    }
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
        selectedImage = await cameraFile.readAsBytes();
        Get.back();
        update();
      }
    }
    // else {
    //   if (kIsWeb) {
    //     log('message');
    //     XFile? image = await picker.pickImage(source: ImageSource.gallery);
    //     if (image != null) {
    //       var f = await image.readAsBytes();
    //       selectedImage = f;
    //       update();
    //     }
    //   }
    else {
      final XFile? gfile = await picker.pickImage(source: ImageSource.gallery);
      if (gfile != null) {
        selectedImage = await gfile.readAsBytes();
        Get.back();
        update();
      }
    }
  }

  void clearSelectedImage() {
    selectedImage = null;

    update();
  }

  String? recordedAudio;
  bool isRecoreding = false;
  bool? permission;
  Future<void> recordAudio() async {
    final record = AudioRecorder();
    try {
      permission = await record.hasPermission();
      if (permission == true) {
        isRecoreding = true;

        update();
        Directory directory = await getApplicationDocumentsDirectory();
        String filepath = '${directory.path}/recording.m4a';
        await record.start(
            const RecordConfig(
              encoder: AudioEncoder.aacLc,
              bitRate: 128000,
            ),
            path: filepath);
        recordedAudio = filepath;
      }
    } catch (e) {
      log(e.toString());
    } finally {
      update();
    }
  }

  Future<void> stopRecord(context) async {
    final record = AudioRecorder();
    log('Stop audio');
    try {
      String? path = await record.stop();
      if (path == null || path.isEmpty) {
        return boatSnackBar(
            text: 'Error', message: 'Audio Is Not Recorded', ctx: context);
      }
      recordedAudio = path;
      log(recordedAudio.toString());
      isRecoreding = false;
      update();
    } catch (e) {
      log(e.toString());
    } finally {
      update();
    }
  }

  Future<void> playRecordedAudio(BuildContext ctx) async {
    AudioPlayer audioPlayer = AudioPlayer();
    try {
      Source urlSource = UrlSource(recordedAudio ?? "");
      audioPlayer.play(urlSource);
    } catch (e) {
      log(e.toString());
      boatSnackBar(text: 'Error', message: 'Something Went Wrong', ctx: ctx);
    }
  }
}
