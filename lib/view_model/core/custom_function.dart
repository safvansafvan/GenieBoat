import 'package:chatboat/view_model/core/colors.dart';
import 'package:flutter/material.dart';

class CustomFunctions {
  static TextStyle style(
      {required FontWeight fontWeight, required double size, Color? color}) {
    return TextStyle(
        fontFamily: 'ProximaNova',
        fontWeight: fontWeight,
        fontSize: size,
        color: color ?? AppColors.blackColor);
  }
}
