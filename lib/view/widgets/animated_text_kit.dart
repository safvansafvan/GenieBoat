import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedTextKitWidget extends StatelessWidget {
  const AnimatedTextKitWidget({super.key, required this.textV});

  final String textV;
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      onFinished: () {
        Get.find<BoatChatCtrl>().loadingNewState();
      },
      animatedTexts: [
        TypewriterAnimatedText(textV,
            textStyle: CustomFunctions.style(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
                size: 15),
            speed: const Duration(milliseconds: 10),
            cursor: "",
            curve: Easing.emphasizedAccelerate),
      ],
      totalRepeatCount: 1,
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    );
  }
}
