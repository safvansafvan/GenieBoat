import 'dart:developer';

import 'package:chatboat/view_model/local_database/get_storage.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GlobleController extends GetxController {
  @override
  void onInit() {
    initThemeSetup();
    super.onInit();
  }

  void initThemeSetup() {
    String theme = StorageUtil().readData('theme_mode') ?? '';
    log('Theme Mode $theme');
    if (theme == 'dark') {
      isDarkTheme = true;
      focusColor = AppColors.whiteColor;
      bgColor = AppColors.blackColor;
      containerClr = AppColors.whiteColor.withAlpha(300);
      secondaryColor = AppColors.whiteColor;
      update();
    } else if (theme == 'light') {
      focusColor = AppColors.blackColor;
      bgColor = AppColors.whiteColor;
      containerClr = AppColors.blackColor.withAlpha(300);
      update();
    } else {
      isSystemTheme = true;
      focusColor = AppColors.whiteColor;
      secondaryColor = AppColors.blackColor;
      update();
    }
  }

  late AnimationController animationController;
  late ConfettiController controllerTopCenter;
  bool isChatHelper = true;
  bool isSettings = false;
  bool isDarkTheme = false;
  bool isSystemTheme = false;
  Color? focusColor;
  Color? secondaryColor;
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
    isSystemTheme = false;
    isDarkTheme = v;

    log('Dark theme $isDarkTheme');
    if (isDarkTheme) {
      StorageUtil().insertData('theme_mode', 'dark');

      focusColor = AppColors.whiteColor;
      bgColor = AppColors.blackColor;
      containerClr = AppColors.whiteColor.withAlpha(300);
    } else {
      StorageUtil().insertData('theme_mode', 'light');
      focusColor = AppColors.blackColor;
      bgColor = AppColors.whiteColor;
      containerClr = AppColors.blackColor.withAlpha(300);
    }
    log(focusColor.toString());
    update();
  }

  void systemThemeState(bool v) {
    StorageUtil().insertData('theme_mode', 'system');
    isDarkTheme = false;
    isSystemTheme = v;
    focusColor = AppColors.whiteColor;
    secondaryColor = AppColors.blackColor;
    update();
  }
}
