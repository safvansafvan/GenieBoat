//colors

import 'package:flutter/material.dart';

Color blackColor = Colors.black;
Color whiteColor = Colors.white;
Color greyColor = Colors.grey;
Color bttnBg = const Color.fromARGB(32, 255, 255, 255);
Color bgColor = Colors.grey.withAlpha(300);
Color blueColor = Colors.blue;

//font style
TextStyle boatTextStyle(
    {required FontWeight fontWeight, required double size, Color? color}) {
  return TextStyle(
      fontFamily: 'ProximaNova',
      fontWeight: fontWeight,
      fontSize: size,
      color: color ?? blackColor);
}

//height

var height20 = const SizedBox(height: 20);

//width
var width10 = const SizedBox(width: 10);
var width5 = const SizedBox(width: 5);

//radius
BorderRadius radius5 = BorderRadius.circular(5);
BorderRadius radius10 = BorderRadius.circular(10);

//duration

Duration boatDuration = const Duration(milliseconds: 1000);
