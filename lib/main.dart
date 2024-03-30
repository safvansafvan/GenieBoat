import 'package:chatboat/view/auth/login.dart';
import 'package:chatboat/view/home/home.dart';
import 'package:chatboat/view_model/init_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {'/': (_) => const LoginView()},
      debugShowCheckedModeBanner: false,
    );
  }
}
