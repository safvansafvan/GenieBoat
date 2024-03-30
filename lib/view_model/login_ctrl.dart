import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passworldCtrl = TextEditingController();
  TextEditingController userNameCtrl = TextEditingController();
  bool obscurePassword = true;
  bool isSignUp = false;

  void obscureState() {
    obscurePassword = !obscurePassword;
    update();
  }

  void signUpState() {
    isSignUp = !isSignUp;
    update();
  }

  void clearControllers() {
    emailCtrl.clear();
    passworldCtrl.clear();
    userNameCtrl.clear();
  }
}
