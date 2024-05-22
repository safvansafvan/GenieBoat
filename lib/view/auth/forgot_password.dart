import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:chatboat/view/widgets/button_loading.dart';
import 'package:chatboat/view/widgets/login_text_field.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/controller/login_ctrl.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void forgotPasswordDialog(BuildContext context) {
  final ctrl = Get.find<LoginController>();

  showAlignedDialog(
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    duration: AppDurations.minDuration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Forgot Password',
              style:
                  CustomFunctions.style(fontWeight: FontWeight.w600, size: 17),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            )
          ],
        ),
        content: GetBuilder<LoginController>(
          builder: (loginC) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BoatTextFormFieldLogin(
                  label: 'Email',
                  controller: ctrl.forgotEmailCtrl,
                  isUsername: true,
                ),
                AppSizes.height20,
                loginC.isForgotLoading
                    ? const ButtonClickLoading()
                    : ElevatedButton(
                        onPressed: () async {
                          if (ctrl.forgotEmailCtrl.text.isEmpty) {
                            boatSnackBar(
                                text: 'Failed',
                                message: 'Enter Required Field',
                                ctx: context);
                          } else {
                            await ctrl.forgotPassword(context);
                          }
                        },
                        child: const Text('   Reset  ')),
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
