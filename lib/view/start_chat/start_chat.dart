import 'package:chatboat/view/widgets/message_sender.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';

class StartChatingView extends StatelessWidget {
  const StartChatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset('assets/gif/boat-unscreen.gif',
              height: 200, width: 200, fit: BoxFit.cover),
          Text(
            'How Can I Help You Today',
            style: boatTextStyle(
                fontWeight: FontWeight.bold, size: 18, color: blackColor),
          ),
          const Spacer(),
          const GenieMessageSender(),
        ],
      ),
    );
  }
}
