import 'package:chatboat/model/firestore_model.dart';
import 'package:chatboat/view/widgets/message_sender.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/firestore_controller.dart';
import 'package:flutter/foundation.dart';
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
        color: kIsWeb ? whiteColor : null,
        borderRadius: (context.width < 968)
            ? context.isPhone
                ? null
                : BorderRadius.circular(15)
            : const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      padding: EdgeInsets.symmetric(vertical: context.isPhone ? 0 : 4),
      margin: EdgeInsets.symmetric(vertical: context.isPhone ? 0 : 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<FireStoreCtrl>(
            builder: (fCtrl) {
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  primary: true,
                  itemCount: fCtrl.allHistory.length,
                  itemBuilder: (context, index) {
                    List<FirestoreModel> f = fCtrl.allHistory.reversed.toList();
                    final dataSet = f[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
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
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Date : ',
                                        style: boatTextStyle(
                                            fontWeight: FontWeight.w600,
                                            size: 14),
                                        children: [
                                          TextSpan(
                                            text: dataSet.date ?? "",
                                            style: boatTextStyle(
                                                fontWeight: FontWeight.w500,
                                                size: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Time : ',
                                        style: boatTextStyle(
                                            fontWeight: FontWeight.w600,
                                            size: 14),
                                        children: [
                                          TextSpan(
                                            text: dataSet.time ?? "",
                                            style: boatTextStyle(
                                                fontWeight: FontWeight.w500,
                                                size: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.copy,
                                        color: whiteColor,
                                        size: 15,
                                      ),
                                      Text(
                                        'Copy Text',
                                        style: boatTextStyle(
                                            fontWeight: FontWeight.w400,
                                            size: 12,
                                            color: whiteColor),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(),
                          Text(
                            dataSet.ans ?? "",
                            style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          height10,
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
                                        dataSet.qus ?? '',
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
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: GenieMessageSender(),
          ),
        ],
      ),
    );
  }
}
