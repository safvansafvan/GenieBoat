import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';

class ThemeSetup {
  static AppBarTheme appBarTheme = AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      foregroundColor: AppColors.blackColor);
  static AppBarTheme appBarThemeDark = AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      foregroundColor: AppColors.whiteColor);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
    switchTheme: switchTheme,
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: AppSizes.radius10,
        side: BorderSide(color: AppColors.bttnBg),
      ),
    ),
    dividerTheme: DividerThemeData(color: AppColors.divider),
    appBarTheme: appBarTheme,
    colorScheme: ColorScheme.light(
        background: AppColors.whiteColor,
        primary: AppColors.blackColor,
        secondary: const Color.fromARGB(246, 255, 255, 255),
        inversePrimary: AppColors.bgColor),
  );

  static ThemeData darkTheme = ThemeData(
    switchTheme: switchTheme,
    dividerTheme: DividerThemeData(color: AppColors.greyColor),
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
    appBarTheme: appBarThemeDark,
    colorScheme: ColorScheme.dark(
        background: AppColors.blackColor,
        primary: AppColors.whiteColor,
        secondary: AppColors.whiteColor,
        inversePrimary: AppColors.whiteColor),
  );

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.button,
    foregroundColor: AppColors.whiteColor,
    animationDuration: AppDurations.boatDuration,
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static SwitchThemeData switchTheme = SwitchThemeData(
    overlayColor: MaterialStatePropertyAll(AppColors.blueColor),
    splashRadius: 1,
    trackColor: MaterialStatePropertyAll(AppColors.bgColor),
    trackOutlineColor: MaterialStatePropertyAll(AppColors.bgColor),
    mouseCursor: MaterialStateMouseCursor.clickable,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    thumbIcon: const MaterialStatePropertyAll(Icon(Icons.dark_mode)),
    thumbColor: MaterialStatePropertyAll(AppColors.button),
  );
}
