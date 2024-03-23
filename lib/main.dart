import 'package:chatboat/view/auth/login.dart';
import 'package:chatboat/view_model/globel_ctrl.dart';
import 'package:chatboat/view_model/login_ctrl.dart';
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
    Get.put(LoginController());
    return GetMaterialApp(
      title: 'Chat Boat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {'/': (_) => const LoginView()},
      debugShowCheckedModeBanner: false,
    );
  }
}
