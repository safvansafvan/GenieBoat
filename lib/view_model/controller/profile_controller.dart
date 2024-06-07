import 'dart:developer';
import 'package:chatboat/model/edit_user_model.dart';
import 'package:chatboat/model/user_model.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/firebase_service/firestore_user_res.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileCtrl extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController createdCtrl = TextEditingController();
  TextEditingController updatedCtrl = TextEditingController();

  RxString name = ''.obs;
  String initName = '';
  String initEmail = '';
  String initNumber = '';
  Uint8List? selectedProfileImg;
  UserModel? userModel;
  String profileDownloadedUrl = '';
  bool isEditLoading = false;

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(_updateState);
    emailController.addListener(_updateState);
    numberController.addListener(_updateState);
  }

  @override
  void onClose() {
    nameController.removeListener(_updateState);
    emailController.removeListener(_updateState);
    numberController.removeListener(_updateState);
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    super.onClose();
  }

  void _updateState() {
    update();
  }

  Future<void> profileImageFrom({bool isCamera = false}) async {
    name.value;
    final ImagePicker picker = ImagePicker();
    if (isCamera) {
      final XFile? cameraFile =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
      if (cameraFile != null) {
        selectedProfileImg = await cameraFile.readAsBytes();
        profileDownloadedUrl = '';

        update();
      }
    } else {
      final XFile? gfile = await picker.pickImage(source: ImageSource.gallery);
      if (gfile != null) {
        selectedProfileImg = await gfile.readAsBytes();
        profileDownloadedUrl = '';
        update();
      }
    }
    log('Selected Profile img');
    if (!kIsWeb) {
      Get.back();
    }
  }

  Future<void> getUsersDetailsForProfile() async {
    userModel = await UserFirestoreRes().getUserDetails();
    log(userModel?.name ?? '', name: 'User data collected');
    initName = nameController.text = userModel?.name ?? "";
    initEmail = emailController.text = userModel?.email ?? "";
    initNumber = numberController.text = userModel?.number ?? "";
    profileDownloadedUrl = userModel?.url ?? '';
    createdCtrl.text = userModel?.datetime ?? '';
    updatedCtrl.text = userModel?.lastUpdated ?? "";
    update();
  }

  Future<void> editProfileValues(context) async {
    isEditLoading = true;
    update();
    log('CALLED EDIT PROFILE ');
    try {
      if (selectedProfileImg != null) {
        profileDownloadedUrl =
            await UserFirestoreRes().uploadImageToStorage(selectedProfileImg!);
        update();
        log(profileDownloadedUrl, name: 'downloaded url');
        if (profileDownloadedUrl.isNotEmpty) {
          selectedProfileImg = null;
          update();
        }
      }
      await UserFirestoreRes().editUserDetails(
        EditUserModel(
            lastUpdated: DateFormat.yMMMMEEEEd().format(DateTime.now()),
            name: nameController.text,
            number: numberController.text,
            email: emailController.text,
            uid: userModel?.uid,
            datetime: createdCtrl.text,
            url: profileDownloadedUrl),
      );
      await getUsersDetailsForProfile();
      update();
      boatSnackBar(
          text: 'Success',
          message: 'Profile Updated',
          ctx: context,
          isSuccess: true);
    } catch (e) {
      boatSnackBar(
          text: 'Error', message: 'Profile Updation Failed', ctx: context);
      log(e.toString());
    } finally {
      isEditLoading = false;
      update();
    }
  }
}
