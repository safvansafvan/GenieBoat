import 'package:chatboat/firebase_options.dart';
import 'package:chatboat/view/splash/splash.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/core/init_controllers.dart';
import 'package:chatboat/view_model/core/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    InitControllers.init();
    return GetBuilder<GlobleController>(builder: (ctrl) {
      return GetMaterialApp(
        theme: ThemeSetup.lightTheme,
        darkTheme: ThemeSetup.darkTheme,
        themeMode: ctrl.themeMode ? ThemeMode.dark : ThemeMode.light,
        title: 'Chat Genie',
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashView(),
        },
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
