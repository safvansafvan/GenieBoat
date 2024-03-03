import 'package:chatboat/view/chat_helper/chat_helper.dart';
import 'package:chatboat/view/widgets/custom_navigation.dart';
import 'package:chatboat/view_model/contant.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const CustomLeftNavigation(),
            const ChatHelperWidget(),
            Container(
              width: 210,
              decoration: const BoxDecoration(
                color: Color.fromARGB(212, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 12),
            ),
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
