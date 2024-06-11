import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:chatboat/view_model/controller/login_ctrl.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future showDeleteAccountDialog(BuildContext ctx) {
  return showAlignedDialog(
    followerAnchor: Alignment.center,
    targetAnchor: Alignment.center,
    duration: AppDurations.boatDuration,
    transitionsBuilder: (context, animation, _, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    context: ctx,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete your Account?'),
        content: const Text(
            '''If you select Delete we will delete your account on our server.

Your app data will also be deleted and you won't be able to retrieve it.
'''),
        actions: [
          ElevatedButton(
              style: ThemeSetup.buttonStyle,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel')),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.redColor,
                foregroundColor: AppColors.whiteColor,
                animationDuration: AppDurations.boatDuration,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                await Get.find<LoginController>().deleteAccount(context);
              },
              child: const Text('Delete'))
        ],
      );
    },
  );
}
