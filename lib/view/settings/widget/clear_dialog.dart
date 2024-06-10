import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future showClearHistoryDialog(BuildContext ctx) {
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
        title: const Text('Clear Your History?'),
        content: const Text(
            '''If you select Clear we will Clear your all historys on our server.

Your app data will also be deleted and you won't be able to retrieve it.
'''),
        actions: [
          ElevatedButton(
              style: ThemeSetup.buttonStyle,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel')),
          GetBuilder<BoatChatCtrl>(builder: (bc) {
            return bc.isClearHistory
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: ThemeSetup.redButtonStyle,
                    onPressed: () async {
                      await bc.clearHistory(context).then(
                        (_) {
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: const Text('Clear'));
          })
        ],
      );
    },
  );
}
