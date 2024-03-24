import 'dart:developer';

import 'package:chatboat/view/chat_helper/chat_helper.dart';
import 'package:chatboat/view/history/genie_history.dart';
import 'package:chatboat/view/widgets/custom_navigation.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    log(context.width.toString());
    return Scaffold(
      backgroundColor: blackColor,
      body: Padding(
        padding: EdgeInsets.all(context.isPhone ? 0.0 : 10.0),
        child: Row(
          children: [
            if (context.width > 748) const CustomLeftNavigation(),
            const Expanded(child: ChatHelperWidget()),
            if (context.width > 968) const GenieHistory(),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: blackColor,
        child: Column(
          children: [
            Expanded(child: CustomLeftNavigation()),
          ],
        ),
      ),
    );
  }
}
