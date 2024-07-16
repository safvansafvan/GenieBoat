import 'package:chatboat/view_model/controller/rating_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

ratingBottomSheet(
    BuildContext context, AnimationController animationController) {
  return showModalBottomSheet(
    backgroundColor: AppColors.whiteColor,
    barrierColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: AppSizes.radius10),
    transitionAnimationController: animationController,
    constraints: BoxConstraints(minWidth: context.width),
    context: context,
    builder: (context) {
      return GetBuilder<RatingController>(builder: (ratingCtrl) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ratingCtrl.isRated
                  ? Center(
                      child: Text(
                        'Already Rated Our Application At ${ratingCtrl.ratingModel?.date}',
                        style: CustomFunctions.style(
                          fontWeight: FontWeight.w600,
                          size: 18,
                        ),
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 5),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: AppColors.borderGrey)),
                            child: TextFormField(
                              maxLength: null,
                              maxLines: null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: ratingCtrl.ratingText,
                              cursorColor:
                                  Theme.of(context).colorScheme.primary,
                              style: CustomFunctions.style(
                                  fontWeight: FontWeight.w500,
                                  size: 14,
                                  color: Theme.of(context).colorScheme.primary),
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorStyle: CustomFunctions.style(
                                    fontWeight: FontWeight.w500,
                                    size: 0,
                                    color: AppColors.redColor),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                hintText: 'Message',
                                hintStyle: CustomFunctions.style(
                                    fontWeight: FontWeight.w500,
                                    size: 14,
                                    color: AppColors.greyColor),
                              ),
                            ),
                          ),
                        ),
                        if (ratingCtrl.isRatingHelperText)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Minimum 5 Charectors',
                                style: CustomFunctions.style(
                                    fontWeight: FontWeight.w600,
                                    size: 14,
                                    color: AppColors.redColor),
                              ),
                            ),
                          ),
                        RatingBar.builder(
                          initialRating: 2,
                          minRating: 1,
                          unratedColor: AppColors.blackColor.withAlpha(300),
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          glow: true,
                          glowColor: AppColors.redColor,
                          glowRadius: 1,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: AppColors.blueColor,
                          ),
                          onRatingUpdate: (rating) {
                            ratingCtrl.starRatedCountState(rating);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  ratingCtrl.ratingText.text.length < 8
                                      ? AppColors.borderGrey
                                      : AppColors.blackColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () async {
                              if (ratingCtrl.ratingText.text.length < 5) {
                                return ratingCtrl.helperTextState(true);
                              }
                              ratingCtrl.helperTextState(false);
                              await ratingCtrl.addUserRating(context: context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 14),
                              child: Text('Submit'),
                            ),
                          ),
                        )
                      ],
                    ),
            ],
          ),
        );
      });
    },
  );
}
