import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';

class ButtonClickLoading extends StatelessWidget {
  const ButtonClickLoading({super.key, this.color = Colors.black});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: color, strokeWidth: 2),
          width10,
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Loading.....',
                textStyle: boatTextStyle(
                    fontWeight: FontWeight.w500, size: 18, color: color),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            isRepeatingAnimation: true,
            repeatForever: true,
          ),
        ],
      ),
    );
  }
}
