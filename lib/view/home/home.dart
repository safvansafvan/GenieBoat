import 'package:chatboat/view/chat_helper/chat_helper.dart';
import 'package:chatboat/view/history/genie_history.dart';
import 'package:chatboat/view/widgets/custom_navigation.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            CustomLeftNavigation(),
            ChatHelperWidget(),
            GenieHistory(),
          ],
        ),
      ),
    );
  }
}
