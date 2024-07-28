import 'dart:developer';

import 'package:chatboat/model/rating_model.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/firebase_service/rating_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class RatingController extends GetxController {
  TextEditingController ratingText = TextEditingController();
  String currentDate = '';
  int starRatedCount = 2;
  var uuid = const Uuid();
  bool isRatingHelperText = false;
  RatingModel? ratingModel;
  bool isRated = false;

  @override
  void onInit() {
    ratingText.addListener(_stateUpdate);
    super.onInit();
  }

  void _stateUpdate() {
    update();
  }

  void helperTextState(bool v) {
    isRatingHelperText = v;
    update();
  }

  void starRatedCountState(double count) {
    starRatedCount = count.toInt();
    log('STAR RATED COUNT $starRatedCount');
    update();
  }

  Future<void> addUserRating({required context}) async {
    final gctrl = Get.find<GlobleController>();
    String id = uuid.v1();
    try {
      formateDate(DateTime.now());

      log(id, name: 'RATING ID');
      await RatingService.addUserRating(
        model: RatingModel(
            date: currentDate,
            id: id,
            message: ratingText.text,
            ratingCount: starRatedCount),
      );
      Get.back();
      Get.back();
      Get.back();
      gctrl.controllerTopCenter.play();
      getUserRatingData();
      gctrl.chatHelperState();
      boatSnackBar(
          text: 'Suceed',
          isSuccess: true,
          ctx: context,
          message: 'Thanks For Your Rating');
      gctrl.controllerTopCenter.play();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getUserRatingData() async {
    ratingModel = await RatingService.getUserRatings();
    if (ratingModel!.message!.isNotEmpty) {
      isRated = true;
      update();
    }
    log(isRated.toString(), name: 'RATED');
  }

  void formateDate(DateTime dateTime) {
    currentDate = DateFormat.MMMMEEEEd().format(dateTime);
  }
}
