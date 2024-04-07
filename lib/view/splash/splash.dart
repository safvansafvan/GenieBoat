import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatboat/view/auth/login.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/globel_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    naviagateToHome();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final ctrl = Get.find<GlobleController>();
    ctrl.size = Size(context.width, context.height);
    super.didChangeDependencies();
  }

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

  Future<void> naviagateToHome() async {
    await Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.to(() => const LoginView()));
  }
}
