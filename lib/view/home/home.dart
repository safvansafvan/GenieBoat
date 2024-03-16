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
            // Container(
            //   height: double.infinity,
            //   width: context.width - 260,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   padding: const EdgeInsets.all(20),
            //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            //   child: Row(
            //     children: [
            //       Container(
            //         width: context.width - 520,
            //         color: Colors.white,
            //       ),
            //       Container(
            //         width: 210,
            //         color: Colors.white10,
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
