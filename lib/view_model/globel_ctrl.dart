import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobleController extends GetxController {
  late AnimationController animationController;
  late ConfettiController controllerTopCenter;
  bool isChatHelper = true;
  bool isSettings = false;
  Size size = const Size(0, 0);
  bool isCelebrating = false;

  void chatHelperState() {
    isSettings = false;
    isChatHelper = true;
    update();
  }

  void settingState() {
    isChatHelper = false;
    isSettings = true;
    update();
  }
}
