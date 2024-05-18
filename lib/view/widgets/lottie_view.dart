import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget lottieView(
    {required String path, double? height = 50, double? width = 50}) {
  return Lottie.asset(path,
      fit: BoxFit.cover, width: width, height: height, animate: true);
}
