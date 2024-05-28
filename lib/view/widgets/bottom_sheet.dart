import 'dart:math';
import 'package:chatboat/view/widgets/msg_toast.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

ratingBottomSheet(
    BuildContext context, AnimationController animationController) {
  final gctrl = Get.find<GlobleController>();
  return showModalBottomSheet(
    transitionAnimationController: animationController,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RatingBar.builder(
              initialRating: 2,
              minRating: 1,
              unratedColor: AppColors.blackColor.withAlpha(300),
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              glow: true,
              glowColor: AppColors.redColor,
              glowRadius: 1.5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: AppColors.blueColor,
              ),
              onRatingUpdate: (rating) {
                log(rating);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.back();
                    Get.back();
                    gctrl.chatHelperState();
                    gctrl.controllerTopCenter.play();
                    boatSnackBar(
                        text: 'Suceed',
                        isSuccess: true,
                        ctx: context,
                        message: 'Thanks For Your Rating');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    child: Text('Submit'),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
