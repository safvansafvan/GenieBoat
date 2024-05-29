import 'package:chatboat/firebase_options.dart';
import 'package:chatboat/view/splash/splash.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/core/app_theme.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/init_controllers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kIsWeb) {
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: "364816399916225",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    InitControllers.init();

    return GetBuilder<GlobleController>(builder: (ctrl) {
      return GetMaterialApp(
        title: 'Chat Boat',
        themeMode: ThemeMode.light,
        darkTheme: AppTheme.darkTheme,
        theme: ThemeData(
            elevatedButtonTheme: AppTheme.elevatedButtonThemeData,
            dividerColor:
                ctrl.isDarkTheme ? AppColors.whiteColor : AppColors.greyColor,
            brightness: ctrl.isDarkTheme ? Brightness.dark : Brightness.light,
            appBarTheme: AppTheme.appBarTheme,
            //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
            scaffoldBackgroundColor:
                ctrl.isDarkTheme || (kIsWeb && ctrl.isSystemTheme)
                    ? AppColors.blackColor
                    : AppColors.whiteColor),
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashView(),
        },
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
