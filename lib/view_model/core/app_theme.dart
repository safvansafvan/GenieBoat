import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static AppBarTheme appBarTheme = AppBarTheme(
      centerTitle: true, backgroundColor: AppColors.whiteColor, elevation: 0);

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.deepPurple,
        onPrimary: Colors.deepPurple,
        secondary: Colors.deepPurple,
        onSecondary: Colors.deepPurple,
        error: AppColors.redColor,
        onError: AppColors.redColor,
        background: AppColors.blackColor,
        onBackground: AppColors.blackColor,
        surface: AppColors.greyColor,
        onSurface: AppColors.greyColor,
      ));
  static ThemeData lightTheme = ThemeData(brightness: Brightness.light);

  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        CustomFunctions.style(
            fontWeight: FontWeight.w600, size: 15, color: AppColors.whiteColor),
      ),
      elevation: const MaterialStatePropertyAll(3),
      foregroundColor: MaterialStatePropertyAll(AppColors.whiteColor),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: MaterialStatePropertyAll(AppColors.secondBg),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppSizes.radius10),
      ),
      animationDuration: const Duration(seconds: 1),
    ),
  );
}
