import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:chatboat/view/widgets/boat_drop_down.dart';
import 'package:chatboat/view/widgets/bottom_sheet.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

settingsDialog(BuildContext context) {
  showAlignedDialog(
    duration: AppDurations.minDuration,
    followerAnchor: Alignment.topLeft,
    targetAnchor: Alignment.topLeft,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return GetBuilder<GlobleController>(builder: (ctrl) {
        return Padding(
          padding: EdgeInsets.only(right: context.isPhone ? 40 : 0),
          child: Dialog(
              elevation: 5,
              insetPadding: EdgeInsets.zero,
              surfaceTintColor: const Color(0xffF9F9F9),
              shadowColor: const Color(0xffF9F9F9),
              backgroundColor: ctrl.bgColor,
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
                                color: ctrl.focusColor),
                          ),
                          IconButton(
                            onPressed: () {
                              ctrl.chatHelperState();
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close, color: ctrl.focusColor),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: Text(
                        'Theme',
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w500,
                            size: 16,
                            color: ctrl.focusColor),
                      ),
                      trailing: SizedBox(
                        width: 150,
                        child: CredrDropDown(
                            hintText: ctrl.selectedValueDropDown ?? 'Theme'),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        'Privacy & Policy',
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w500,
                            size: 16,
                            color: ctrl.focusColor),
                      ),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: ctrl.focusColor),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        'About',
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w500,
                            size: 16,
                            color: ctrl.focusColor),
                      ),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: ctrl.focusColor),
                    ),
                    ListTile(
                      onTap: () {
                        ratingBottomSheet(context, ctrl.animationController);
                      },
                      title: Text(
                        'Rating',
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w500,
                            size: 16,
                            color: ctrl.focusColor),
                      ),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: ctrl.focusColor),
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
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: AppColors.redColor),
                    ),
                    ListTile(
                      title: Text(
                        'Clear History',
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w500,
                            size: 16,
                            color: ctrl.focusColor),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: ListTile(
                        shape: OutlineInputBorder(
                            borderRadius: AppSizes.radius10,
                            borderSide: BorderSide.none),
                        minLeadingWidth: 0,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 2),
                        horizontalTitleGap: 10,
                        leading: const CircleAvatar(
                            radius: 20, backgroundColor: Colors.amber),
                        title: Text(
                          'Muhammed Safvan',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: CustomFunctions.style(
                              fontWeight: FontWeight.w500,
                              size: 12,
                              color: ctrl.focusColor),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.logout),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      });
    },
  );
}
