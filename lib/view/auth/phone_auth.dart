import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:chatboat/view/widgets/button_loading.dart';
import 'package:chatboat/view/widgets/login_text_field.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/controller/login_ctrl.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void phoneAuth(BuildContext context) {
  final ctrl = Get.find<LoginController>();

  showAlignedDialog(
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    duration: AppDurations.minDuration,
    context: context,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Number Verification',
              style:
                  CustomFunctions.style(fontWeight: FontWeight.w600, size: 17),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, color: AppColors.black87),
            )
          ],
        ),
        content: GetBuilder<LoginController>(
          builder: (loginC) {
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
                AppSizes.height20,
                loginC.isOtpVerification
                    ? const ButtonClickLoading()
                    : ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                loginC.isVerifyLoading == false &&
                                        loginC.otpCtrl.text.length > 5
                                    ? Colors.deepPurple
                                    : AppColors.greyColor)),
                        onPressed: loginC.isVerifyLoading
                            ? () async {
                                if (ctrl.otpCtrl.text.isEmpty) {
                                  boatSnackBar(
                                      text: 'Failed',
                                      message: 'Enter Otp Field',
                                      ctx: context);
                                } else {
                                  await ctrl
                                      .handlePhoneOtpVerification(context);
                                }
                              }
                            : () {},
                        child: const Text('   Verify  '),
                      ),
                AppSizes.height20
              ],
            );
          },
        ),
        shape: RoundedRectangleBorder(borderRadius: AppSizes.radius10),
        contentPadding: const EdgeInsets.symmetric(horizontal: 2),
      );
    },
  );
}
