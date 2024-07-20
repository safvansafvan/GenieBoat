import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isPhone
          ? AppBar(
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            )
          : null,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Genie Boat',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text('Developed By Muhammed Safvan'),
            Text('Version : 1.0.0'),
          ],
        ),
      ),
    );
  }
}
