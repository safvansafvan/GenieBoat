import 'package:chatboat/view/widgets/login_text_field.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/login_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 420,
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
                          style: boatTextStyle(
                              fontWeight: FontWeight.w600, size: 23),
                        ),
                      ),
                      Image.network(
                        'assets/gif/boat.gif',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 60,
                      ),
                      BoatTextFormFieldLogin(
                        controller: loginCtrl.emailCtrl,
                        label: 'Email',
                        isUsername: true,
                      ),
                      height20,
                      BoatTextFormFieldLogin(
                        controller: loginCtrl.passworldCtrl,
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
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: radius10)),
                                  animationDuration: Duration(seconds: 1)),
                              onPressed: () {},
                              child: const Text('Login')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            const Expanded(child: Divider()),
                            Text(
                              'Or SignUp Using',
                              style: boatTextStyle(
                                  fontWeight: FontWeight.w500,
                                  size: 13,
                                  color: greyColor),
                            ),
                            const Expanded(child: Divider())
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlutterSocialButton(
                            buttonType: ButtonType.google,
                            mini: true,
                            onTap: () {},
                          ),
                          FlutterSocialButton(
                            buttonType: ButtonType.facebook,
                            mini: true,
                            onTap: () {},
                          ),
                          FlutterSocialButton(
                            buttonType: ButtonType.phone,
                            mini: true,
                            onTap: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Don't Have An Account ? ",
                    style: boatTextStyle(
                        fontWeight: FontWeight.w500,
                        size: 14,
                        color: greyColor),
                    children: [
                      TextSpan(
                        text: 'SignUp',
                        style: boatTextStyle(
                            fontWeight: FontWeight.w600,
                            size: 14,
                            color: Colors.deepPurple),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
