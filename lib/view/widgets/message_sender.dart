import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';

class GenieMessageSender extends StatelessWidget {
  const GenieMessageSender({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(borderRadius: radius10, color: bgColor),
              child: Icon(Icons.mic_none_outlined, color: blackColor),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 35,
              child: TextField(
                maxLength: null,
                maxLines: null,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintStyle: boatTextStyle(
                        fontWeight: FontWeight.w500,
                        size: 14,
                        color: blackColor),
                    hintText: 'Message ChatGenie....',
                    fillColor: bgColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: radius10, borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: radius10, borderSide: BorderSide.none)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
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
        ],
      ),
    );
  }
}
