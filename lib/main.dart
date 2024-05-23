import 'package:chatboat/firebase_options.dart';
import 'package:chatboat/view/splash/splash.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/init_controllers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return GetMaterialApp(
      title: 'Chat Boat',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: AppColors.whiteColor,
            elevation: 0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
