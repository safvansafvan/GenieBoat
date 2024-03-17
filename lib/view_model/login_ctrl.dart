import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passworldCtrl = TextEditingController();
  TextEditingController userNameCtrl = TextEditingController();
  RxBool obscurePassword = false.obs;

  void obscureState() {
    obscurePassword.value = !obscurePassword.value;
  }
}
