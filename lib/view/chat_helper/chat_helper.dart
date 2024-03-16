import 'package:chatboat/view/widgets/message_sender.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHelperWidget extends StatelessWidget {
  const ChatHelperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width - 460,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          SizedBox(
            height: 35,
            child: ListTile(
              leading: Text(
                'Ai Chat Helper',
                style: boatTextStyle(fontWeight: FontWeight.w700, size: 20),
              ),
              trailing: SizedBox(
                width: 340,
                child: Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 250,
                      child: TextField(
                        cursorColor: greyColor,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintText: 'Search ...',
                          hintStyle: TextStyle(
                              color: greyColor, fontWeight: FontWeight.w500),
                          prefixIcon: Icon(Icons.search, color: greyColor),
                          fillColor: Colors.grey.withAlpha(300),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: radius5,
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: radius5,
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    Container(
                      height: 34,
                      width: 34,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: bgColor),
                          borderRadius: radius5),
                      child: const Icon(Icons.notifications_outlined),
                    ),
                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                          border: Border.all(color: bgColor),
                          borderRadius: radius5),
                      child: const Icon(Icons.info_outline),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              primary: true,
              children: [
                Container(
                  height: 500,
                  padding: const EdgeInsets.all(12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: radius10,
                    gradient: LinearGradient(colors: [
                      Colors.blue.withOpacity(0.6),
                      Colors.white.withAlpha(300),
                      Colors.white
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withAlpha(300),
                          blurRadius: 1,
                          spreadRadius: 0.7)
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  padding: const EdgeInsets.all(12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: radius10,
                    gradient: LinearGradient(colors: [
                      Colors.blue.withOpacity(0.6),
                      Colors.white.withAlpha(300),
                      Colors.white
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withAlpha(300),
                          blurRadius: 1,
                          spreadRadius: 0.7)
                    ],
                  ),
                )
              ],
            ),
          ),
          const GenieMessageSender(),
        ],
      ),
    );
  }
}
