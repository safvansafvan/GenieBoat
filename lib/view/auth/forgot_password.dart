import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:chatboat/view/widgets/button_loading.dart';
import 'package:chatboat/view/widgets/login_text_field.dart';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/login_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void forgotPasswordDialog(BuildContext context) {
  final ctrl = Get.find<LoginController>();

  showAlignedDialog(
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    duration: minDuration,
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
                label: 'Email',
                controller: ctrl.forgotEmailCtrl,
                isUsername: true,
              ),
              height20,
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
