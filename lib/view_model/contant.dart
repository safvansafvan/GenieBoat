//colors

import 'package:flutter/material.dart';

Color blackColor = Colors.black;
Color whiteColor = Colors.white;
Color greyText = Colors.grey.withAlpha(300);

//font style
TextStyle boatTextStyle(
    {required FontWeight fontWeight, required double size, Color? color}) {
  return TextStyle(
      fontFamily: 'ProximaNova',
      fontWeight: fontWeight,
      fontSize: size,
      color: color ?? blackColor);
}
