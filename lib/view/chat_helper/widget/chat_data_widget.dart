import 'package:chatboat/model/firestore_model.dart';
import 'package:chatboat/view/widgets/animated_text_kit.dart';
import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatChatDataWidget extends StatelessWidget {
  const BoatChatDataWidget(
      {super.key,
      required this.dataSet,
      required this.isLastIndex,
      required this.ctrl});

  final FirestoreModel dataSet;
  final bool isLastIndex;
  final BoatChatCtrl ctrl;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobleController>(builder: (gCtrl) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          // color: gCtrl.bgColor,
          borderRadius: AppSizes.radius10,
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.5,
            tileMode: TileMode.clamp,
            colors: gCtrl.isDarkTheme
                ? [AppColors.greyColor, AppColors.blackShade]
                : [
                    Colors.blue.withOpacity(0.6),
                    Colors.white.withAlpha(300),
                    Colors.white
                  ],
          ),
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
                              fontWeight: FontWeight.w600,
                              size: 14,
                              color: gCtrl.focusColor),
                          children: [
                            TextSpan(
                              text: dataSet.date ?? "",
                              style: CustomFunctions.style(
                                  fontWeight: FontWeight.w500,
                                  size: 13,
                                  color: gCtrl.focusColor),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      RichText(
                        text: TextSpan(
                          text: 'Time : ',
                          style: CustomFunctions.style(
                              fontWeight: FontWeight.w600,
                              size: 14,
                              color: gCtrl.focusColor),
                          children: [
                            TextSpan(
                              text: dataSet.time ?? "",
                              style: CustomFunctions.style(
                                  fontWeight: FontWeight.w500,
                                  size: 13,
                                  color: gCtrl.focusColor),
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
                          color: gCtrl.focusColor,
                          size: 15,
                        ),
                        AppSizes.width5,
                        Text(
                          'Copy Text',
                          style: CustomFunctions.style(
                              fontWeight: FontWeight.w400,
                              size: 12,
                              color: gCtrl.focusColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            isLastIndex && ctrl.isLoadingNew
                ? AnimatedTextKitWidget(
                    textV: dataSet.ans ?? "",
                    color: gCtrl.focusColor ?? Colors.black,
                  )
                : Text(
                    dataSet.ans ?? "",
                    style: TextStyle(
                        color: gCtrl.focusColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
            AppSizes.height10,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: AppSizes.radius10,
                border: Border.all(
                  color: AppColors.greyColor.withAlpha(300),
                ),
              ),
              child: Center(
                child: Text(
                  dataSet.qus ?? '',
                  style: CustomFunctions.style(
                      fontWeight: FontWeight.w400,
                      size: 14,
                      color: AppColors.blackColor),
                  maxLines: null,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
