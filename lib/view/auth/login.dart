import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.width,
            height: context.height / 2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(231, 33, 149, 243),
              Color.fromARGB(231, 104, 58, 183)
            ])),
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
                    ]),
              )),
        ],
      ),
    );
  }
}
