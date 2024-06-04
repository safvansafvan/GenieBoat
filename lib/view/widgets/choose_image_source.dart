import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/controller/profile_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

chooseImageSource({required BuildContext context, bool? isPorfile}) async {
  final bCtrl = Get.find<BoatChatCtrl>();
  final pCtrl = Get.find<ProfileCtrl>();
  if (context.isPhone) {
    return showAlignedDialog(
      barrierColor: Colors.transparent,
      duration: AppDurations.minDuration,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: GetBuilder<GlobleController>(builder: (gc) {
            return Dialog(
              elevation: 10,
              shadowColor: gc.themeMode == true ? AppColors.bgColor : null,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Select Source',
                      style: CustomFunctions.style(
                          fontWeight: FontWeight.w500,
                          size: 14,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            await bCtrl.imageFromGalleryOrCamera(
                                isCamera: true);
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/camera.webp',
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                              AppSizes.minHeight,
                              Text(
                                'Camera',
                                style: CustomFunctions.style(
                                    fontWeight: FontWeight.w600,
                                    size: 14,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            if (isPorfile == true) {
                              pCtrl.profileImageFrom();
                            } else {
                              await bCtrl.imageFromGalleryOrCamera();
                            }
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/gallery.png',
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                              AppSizes.minHeight,
                              Text(
                                'Gallery',
                                style: CustomFunctions.style(
                                    fontWeight: FontWeight.w600,
                                    size: 14,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  } else {
    if (isPorfile == true) {
      await pCtrl.profileImageFrom();
    } else {
      await bCtrl.imageFromGalleryOrCamera();
    }
  }
}
