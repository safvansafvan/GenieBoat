import 'dart:developer';

import 'package:chatboat/view_model/core/colors.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GlobleController extends GetxController {
  @override
  void onInit() {
    darkThemeState(false);
    super.onInit();
  }

  late AnimationController animationController;
  late ConfettiController controllerTopCenter;
  bool isChatHelper = true;
  bool isSettings = false;
  bool isDarkTheme = false;
  Color? focusColor;
  Color? bgColor;
  Color? containerClr;
  Size size = const Size(0, 0);
  bool isCelebrating = false;
  String? selectedValueDropDown;

  void dropDownState(String v) {
    selectedValueDropDown = v;
    update();
  }

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

  void darkThemeState(bool v) {
    isDarkTheme = v;
    log('Dark theme $isDarkTheme');
    if (isDarkTheme) {
      focusColor = AppColors.whiteColor;
      bgColor = AppColors.blackColor;
      containerClr = AppColors.whiteColor.withAlpha(300);
    } else {
      focusColor = AppColors.blackColor;
      bgColor = AppColors.whiteColor;
      containerClr = AppColors.blackColor.withAlpha(300);
    }
    log(focusColor.toString());
    update();
  }
}
