import 'dart:developer';

import 'package:chatboat/view/chat_helper/chat_helper.dart';
import 'package:chatboat/view/history/genie_history.dart';
import 'package:chatboat/view/start_chat/start_chat.dart';
import 'package:chatboat/view/widgets/custom_navigation.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/globel_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void didChangeDependencies() {
    final ctrl = Get.find<GlobleController>();
    ctrl.size = Size(context.width, context.height);
    super.didChangeDependencies();
  }

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
            centerViewHandling(),
            if (context.width > 968) const GenieHistory(),
          ],
        ),
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor: blackColor,
        child: const Column(
          children: [
            Expanded(child: CustomLeftNavigation()),
          ],
        ),
      ),
    );
  }

  Widget centerViewHandling() {
    final ctrl = Get.find<GlobleController>();
    switch (ctrl.bodyCurrentInd) {
      case 0:
        return const Expanded(child: StartChatingView());

      case 1:
        return const Expanded(child: ChatHelperWidget());

      default:
        return const SizedBox();
    }
  }
}
