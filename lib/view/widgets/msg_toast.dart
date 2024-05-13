import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/globel_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void boatSnackBar(
    {required String text,
    required String message,
    required BuildContext ctx,
    bool isSuccess = false}) {
  if (ctx.isPhone) {
    Get.showSnackbar(
      GetSnackBar(
        boxShadows: [
          BoxShadow(color: greyColor, blurRadius: 0.2, spreadRadius: 0.5)
        ],
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        backgroundColor: whiteColor,
        borderWidth: 0.5,
        barBlur: 1,
        snackPosition: SnackPosition.TOP,
        animationDuration: const Duration(seconds: 1),
        messageText: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
                isSuccess
                    ? 'assets/images/success.png'
                    : 'assets/images/close.png',
                width: 20,
                height: 20),
            width10,
            Text(
              message,
              style: boatTextStyle(
                  fontWeight: FontWeight.w600, size: 14, color: blackColor),
            )
          ],
        ),
        duration: const Duration(milliseconds: 1300),
        borderColor: greyColor.withAlpha(300),
        borderRadius: 10,
        isDismissible: false,
      ),
    );
  } else {
    final ctrl = Get.find<GlobleController>();
    Get.showSnackbar(
      GetSnackBar(
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
                isSuccess
                    ? 'assets/images/success.png'
                    : 'assets/images/close.png',
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
        isDismissible: false,
      ),
    );
  }
}
