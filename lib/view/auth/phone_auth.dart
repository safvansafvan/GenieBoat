import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:chatboat/view/widgets/button_loading.dart';
import 'package:chatboat/view/widgets/login_text_field.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/login_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void phoneAuth(BuildContext context) {
  final ctrl = Get.find<LoginController>();

  showAlignedDialog(
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    duration: minDuration,
    context: context,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    builder: (context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Number Verification',
              style: boatTextStyle(fontWeight: FontWeight.w600, size: 17),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close))
          ],
        ),
        content: GetBuilder<LoginController>(builder: (loginC) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BoatTextFormFieldLogin(
                label: 'Number',
                controller: ctrl.numberCtrl,
                isNumber: true,
                inputType: TextInputType.number,
              ),
              BoatTextFormFieldLogin(
                label: 'Otp',
                isOtp: true,
                controller: ctrl.otpCtrl,
                inputType: TextInputType.number,
              ),
              height20,
              loginC.isOtpVerification
                  ? const ButtonClickLoading()
                  : ElevatedButton(
                      onPressed: () async {
                        if (ctrl.otpCtrl.text.isEmpty) {
                          boatSnackBar(
                              text: 'Failed', message: 'Enter Otp Field');
                        } else {
                          await ctrl.handlePhoneOtpVerification(context);
                        }
                      },
                      child: const Text('   Verify  ')),
              height20
            ],
          );
        }),
        shape: RoundedRectangleBorder(borderRadius: radius10),
        contentPadding: const EdgeInsets.symmetric(horizontal: 2),
      );
    },
  );
}
