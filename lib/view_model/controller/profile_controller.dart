import 'dart:developer';
import 'dart:typed_data';
import 'package:chatboat/model/user_model.dart';
import 'package:chatboat/view_model/firebase_service/firestore_user_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCtrl extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  Uint8List? selectedProfileImg;
  UserModel? userModel;

  Future<void> profileImageFrom({bool isCamera = false}) async {
    final ImagePicker picker = ImagePicker();
    if (isCamera) {
      final XFile? cameraFile =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
      if (cameraFile != null) {
        selectedProfileImg = await cameraFile.readAsBytes();
        update();
      }
    } else {
      final XFile? gfile = await picker.pickImage(source: ImageSource.gallery);
      if (gfile != null) {
        selectedProfileImg = await gfile.readAsBytes();
        update();
      }
    }
    log('Selected Profile img $selectedProfileImg');
    Get.back();
  }

  Future<void> getUsersDetailsForProfile() async {
    userModel = await UserFirestoreRes().getUserDetails();
    log(userModel?.name ?? '', name: 'User data collected');
    nameController.text = userModel?.name ?? "";
    emailController.text = userModel?.email ?? "";
    numberController.text = userModel?.number ?? "";
    update();
  }
}
