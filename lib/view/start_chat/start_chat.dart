import 'package:chatboat/view/widgets/celebration.dart';
import 'package:chatboat/view/widgets/message_sender.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartChatingView extends StatelessWidget {
  const StartChatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: context.isPhone ? 0 : 12),
        decoration: BoxDecoration(
            color: !context.isPhone ? AppColors.whiteColor : Colors.transparent,
            borderRadius: !context.isPhone
                ? const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15))
                : null),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!context.isPhone) celebrationKit(),
            const Spacer(),
            Image.asset('assets/gif/boat-unscreen.gif',
                height: 200, width: 200, fit: BoxFit.cover),
            GetBuilder<GlobleController>(builder: (ctrl) {
              return Text(
                'How Can I Help You Today',
                style: CustomFunctions.style(
                    fontWeight: FontWeight.bold,
                    size: 18,
                    color: ctrl.focusColor),
              );
            }),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: GenieMessageSender(),
            ),
          ],
        ),
      ),
    );
  }
}
