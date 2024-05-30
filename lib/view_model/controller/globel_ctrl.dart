import 'dart:developer';
import 'package:chatboat/view_model/storage/get_storage.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobleController extends GetxController {
  @override
  void onInit() {
    bool value = StorageUtil.readData('theme_mode') ?? false;
    toggleTheme(value);
    super.onInit();
  }

  bool themeMode = false;
  void toggleTheme(bool v) {
    themeMode = v;
    if (themeMode) {
      StorageUtil.insertData('theme_mode', true);
      log('DARK THEME $themeMode');
    } else {
      StorageUtil.insertData('theme_mode', true);
      log('LIGHT THEME $themeMode');
    }
    update();
  }

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
