import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:chatboat/view/widgets/bottom_sheet.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

settingsDialog(BuildContext context) {
  final gc = Get.find<GlobleController>();
  showAlignedDialog(
    duration: AppDurations.minDuration,
    followerAnchor: Alignment.topLeft,
    targetAnchor: Alignment.topLeft,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(right: context.isPhone ? 40 : 0),
        child: Dialog(
          elevation: 5,
          insetPadding: EdgeInsets.zero,
          surfaceTintColor: const Color(0xffF9F9F9),
          shadowColor: const Color(0xffF9F9F9),
          backgroundColor: const Color(0xffF9F9F9),
          shape: RoundedRectangleBorder(borderRadius: AppSizes.radius10),
          child: SizedBox(
            width: 600,
            height: 500,
            child: Column(
              children: [
                AppSizes.minHeight,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Settings',
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w700,
                            size: 18,
                            color: AppColors.blackColor),
                      ),
                      IconButton(
                        onPressed: () {
                          gc.chatHelperState();
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: AppColors.black87,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                GetBuilder<GlobleController>(builder: (gc) {
                  return ListTile(
                    title: Text(
                      'Theme',
                      style: CustomFunctions.style(
                          fontWeight: FontWeight.w500, size: 16),
                    ),
                    trailing: SizedBox(
                      width: 150,
                      child: Switch(
                        value: gc.themeMode,
                        onChanged: (value) {
                          gc.toggleTheme(value);
                        },
                      ),
                    ),
                  );
                }),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'Privacy & Policy',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500, size: 16),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.black87,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'About',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500, size: 16),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.black87,
                  ),
                ),
                ListTile(
                  onTap: () {
                    ratingBottomSheet(context, gc.animationController);
                  },
                  title: Text(
                    'Rating',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500, size: 16),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.black87,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'Delete Account',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500,
                        size: 16,
                        color: AppColors.redColor),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: AppColors.redColor),
                ),
                ListTile(
                  title: Text(
                    'Clear History',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500, size: 16),
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        child: Text(
                          'Clear',
                          style: CustomFunctions.style(
                              fontWeight: FontWeight.w600,
                              size: 14,
                              color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    shape: OutlineInputBorder(
                        borderRadius: AppSizes.radius10,
                        borderSide: BorderSide.none),
                    minLeadingWidth: 0,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                    horizontalTitleGap: 10,
                    leading: const CircleAvatar(radius: 20),
                    title: Text(
                      'Muhammed Safvan',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: CustomFunctions.style(
                          fontWeight: FontWeight.w500,
                          size: 12,
                          color: AppColors.blackColor),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.logout, color: AppColors.black87),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
