import 'package:chatboat/view/splash/splash.dart';
import 'package:chatboat/view_model/globel_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GlobleController());
    return GetMaterialApp(
      title: 'Chat Boat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
