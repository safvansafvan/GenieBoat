import 'package:chatboat/view/widgets/celebration.dart';
import 'package:chatboat/view/widgets/message_sender.dart';
import 'package:chatboat/view_model/constant.dart';
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
            color: !context.isPhone ? whiteColor : Colors.transparent,
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
            Text(
              'How Can I Help You Today',
              style: boatTextStyle(
                  fontWeight: FontWeight.bold, size: 18, color: blackColor),
            ),
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
