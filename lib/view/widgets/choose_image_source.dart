import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

chooseImageSource(BuildContext context) async {
  final bCtrl = Get.find<BoatChatCtrl>();
  if (context.isPhone) {
    return showAlignedDialog(
      barrierColor: Colors.transparent,
      duration: AppDurations.minDuration,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Source',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500, size: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          await bCtrl.imageFromGalleryOrCamera(isCamera: true);
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
                                  fontWeight: FontWeight.w600, size: 14),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await bCtrl.imageFromGalleryOrCamera();
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
                                  fontWeight: FontWeight.w600, size: 14),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  } else {
    await bCtrl.imageFromGalleryOrCamera();
  }
}