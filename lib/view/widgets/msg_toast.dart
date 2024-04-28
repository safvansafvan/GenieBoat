import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/globel_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void boatSnackBar(
    {required String text,
    required String message,
    bool isSuccess = false,
    String? path}) {
  final ctrl = Get.find<GlobleController>();
  Get.showSnackbar(GetSnackBar(
    backgroundColor: whiteColor,
    borderWidth: 1,
    barBlur: 1,
    margin: EdgeInsets.only(
        top: 20, bottom: 50, right: 10, left: ctrl.size.width - 300),
    maxWidth: 250,
    animationDuration: const Duration(seconds: 1),
    snackPosition: SnackPosition.TOP,
    titleText: Row(
      children: [
        Image.asset(
            isSuccess ? 'assets/images/success.png' : 'assets/images/close.png',
            width: 20,
            height: 20),
        width10,
        Text(
          text,
          style: boatTextStyle(
              fontWeight: FontWeight.w600, size: 14, color: blackColor),
        )
      ],
    ),
    messageText: Text(
      message,
      style: boatTextStyle(
          fontWeight: FontWeight.w600, size: 13, color: blackColor),
    ),
    duration: const Duration(milliseconds: 1300),
    borderColor: blackColor,
    borderRadius: 6,
    isDismissible: true,
  ));
}
