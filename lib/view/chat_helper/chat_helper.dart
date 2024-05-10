import 'package:chatboat/view/widgets/message_sender.dart';
import 'package:chatboat/view_model/boat_controller.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHelperWidget extends StatelessWidget {
  const ChatHelperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 0.0,
        minHeight: 0.0,
      ),
      width: context.width - 460,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: (context.width < 968)
            ? context.isPhone
                ? null
                : BorderRadius.circular(15)
            : const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<BoatChatCtrl>(
              builder: (bCtrl) {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  primary: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 500,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: radius10,
                        gradient: LinearGradient(
                            colors: [
                              Colors.blue.withOpacity(0.6),
                              Colors.white.withAlpha(300),
                              Colors.white
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue.withAlpha(300),
                              blurRadius: 1,
                              spreadRadius: 0.7)
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.copy,
                                color: whiteColor,
                                size: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Copy Text',
                                  style: boatTextStyle(
                                      fontWeight: FontWeight.w400,
                                      size: 12,
                                      color: whiteColor),
                                ),
                              )
                            ],
                          ),
                          const Divider(),
                          Text(bCtrl.textAnswer,
                              style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: radius10,
                                  border: Border.all(
                                    color: greyColor.withAlpha(300),
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        bCtrl.questionCtrl.text,
                                        style: boatTextStyle(
                                            fontWeight: FontWeight.w400,
                                            size: 14,
                                            color: blackColor),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                height: 35,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: radius10,
                                    border: Border.all(
                                        color: greyColor.withAlpha(300))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.view_agenda_outlined,
                                      size: 20,
                                    ),
                                    width5,
                                    Text(
                                      'View',
                                      style: boatTextStyle(
                                          fontWeight: FontWeight.w500,
                                          size: 14),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const GenieMessageSender(),
        ],
      ),
    );
  }
}
