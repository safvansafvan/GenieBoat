import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatboat/view_model/contant.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: screenSize.height / 3),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/gif/loading.gif',
                      height: 200, width: 200),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          'Chat Boat',
                          textStyle: boatTextStyle(
                              fontWeight: FontWeight.w600,
                              size: 28,
                              color: whiteColor),
                        ),
                      ],
                      isRepeatingAnimation: true,
                      repeatForever: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
