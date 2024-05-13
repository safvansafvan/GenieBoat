import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/boat_controller.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenieMessageSender extends StatelessWidget {
  const GenieMessageSender({super.key});

  @override
  Widget build(BuildContext context) {
    final chatCtrl = Get.find<BoatChatCtrl>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.isPhone ? 10 : 25),
      height: 50,
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(borderRadius: radius10, color: bgColor),
            child: Icon(Icons.upload_file, color: blackColor),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.isPhone ? 5 : 20.0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(borderRadius: radius10, color: bgColor),
              child: Icon(Icons.mic_none_outlined, color: blackColor),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: chatCtrl.questionCtrl,
                maxLength: null,
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  hintStyle: boatTextStyle(
                      fontWeight: FontWeight.w500, size: 14, color: blackColor),
                  hintText: 'Message ChatGenie....',
                  fillColor: bgColor,
                  enabled: true,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: radius10, borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: radius10, borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (chatCtrl.questionCtrl.text.isEmpty) {
                return boatSnackBar(
                    text: 'Error', message: 'Enter Messages', ctx: context);
              }
              await chatCtrl.boatChatHandling(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: context.isPhone ? 5 : 20.0),
              child: Container(
                height: 35,
                width: 35,
                decoration:
                    BoxDecoration(borderRadius: radius10, color: Colors.orange),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/send.png',
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
