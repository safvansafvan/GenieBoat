import 'package:chatboat/view/widgets/login_text_field.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/login_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCtrl = Get.find<LoginController>();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.width,
            height: context.height / 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(231, 33, 149, 243),
                  Color.fromARGB(231, 104, 58, 183)
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: radius10,
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                      color: greyColor,
                      blurRadius: 0.1,
                      spreadRadius: 0.1,
                      blurStyle: BlurStyle.outer)
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Login',
                      style:
                          boatTextStyle(fontWeight: FontWeight.w600, size: 23),
                    ),
                  ),
                  Image.network(
                    'assets/gif/boat.gif',
                    width: 100,
                    height: 100,
                  ),
                  BoatTextFormFieldLogin(
                    controller: loginCtrl.emailCtrl,
                    label: 'Email',
                    isUsername: true,
                  ),
                  height20,
                  BoatTextFormFieldLogin(
                    controller: loginCtrl.emailCtrl,
                    label: 'Password',
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22.0),
                      child: Text(
                        'Forgot Password?',
                        style: boatTextStyle(
                            fontWeight: FontWeight.w600,
                            size: 13,
                            color: Colors.deepPurple),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
