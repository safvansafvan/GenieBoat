import 'package:chatboat/model/firestore_model.dart';
import 'package:chatboat/view/widgets/animated_text_kit.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/controller/firestore_controller.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';

class BoatChatDataWidget extends StatelessWidget {
  const BoatChatDataWidget(
      {super.key,
      required this.dataSet,
      required this.isLastIndex,
      required this.ctrl});

  final FirestoreModel dataSet;
  final bool isLastIndex;
  final FireStoreCtrl ctrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: AppSizes.radius10,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Date : ',
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w600, size: 14),
                        children: [
                          TextSpan(
                            text: dataSet.date ?? "",
                            style: CustomFunctions.style(
                                fontWeight: FontWeight.w500, size: 13),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    RichText(
                      text: TextSpan(
                        text: 'Time : ',
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w600, size: 14),
                        children: [
                          TextSpan(
                            text: dataSet.time ?? "",
                            style: CustomFunctions.style(
                                fontWeight: FontWeight.w500, size: 13),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.copy,
                        color: AppColors.whiteColor,
                        size: 15,
                      ),
                      Text(
                        'Copy Text',
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w400,
                            size: 12,
                            color: AppColors.whiteColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          isLastIndex && ctrl.isLoadingNew
              ? AnimatedTextKitWidget(textV: dataSet.ans ?? "")
              : Text(
                  dataSet.ans ?? "",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
          AppSizes.height10,
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: AppSizes.radius10,
                  border: Border.all(
                    color: AppColors.greyColor.withAlpha(300),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        dataSet.qus ?? '',
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w400,
                            size: 14,
                            color: AppColors.blackColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}