import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatboat/view/profile/profile_view.dart';
import 'package:chatboat/view/settings/view/about_us.dart';
import 'package:chatboat/view/settings/view/privacy_policy.dart';
import 'package:chatboat/view/settings/widget/clear_dialog.dart';
import 'package:chatboat/view/settings/widget/delete_dialog.dart';
import 'package:chatboat/view/widgets/bottom_sheet.dart';
import 'package:chatboat/view_model/controller/login_ctrl.dart';
import 'package:chatboat/view_model/controller/profile_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:chatboat/view_model/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

settingsDialog(BuildContext context) {
  final gc = Get.find<GlobleController>();
  final lc = Get.find<LoginController>();
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
                    minVerticalPadding: 0,
                    title: Text(
                      'Theme',
                      style: CustomFunctions.style(
                          fontWeight: FontWeight.w500, size: 14),
                    ),
                    trailing: Switch(
                      value: gc.themeMode,
                      onChanged: (value) {
                        gc.toggleTheme(value);
                      },
                    ),
                  );
                }),
                ListTile(
                  minVerticalPadding: 0,
                  onTap: () {
                    Get.off(() => const PrivacyAndPolicy(),
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 400),
                        transition: Transition.zoom);
                  },
                  title: Text(
                    'Privacy & Policy',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500, size: 14),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.black87,
                  ),
                ),
                ListTile(
                  minVerticalPadding: 0,
                  onTap: () {
                    Get.off(() => const AboutUs(),
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 400),
                        transition: Transition.zoom);
                  },
                  title: Text(
                    'About Us',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500, size: 14),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.black87,
                  ),
                ),
                ListTile(
                  minVerticalPadding: 0,
                  onTap: () {
                    ratingBottomSheet(context, gc.animationController);
                  },
                  title: Text(
                    'Rating',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500, size: 14),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.black87,
                  ),
                ),
                ListTile(
                  minVerticalPadding: 0,
                  onTap: () {
                    showDeleteAccountDialog(context);
                  },
                  title: Text(
                    'Delete Account',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500,
                        size: 14,
                        color: AppColors.redColor),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: AppColors.redColor),
                ),
                ListTile(
                    minVerticalPadding: 0,
                    title: Text(
                      'Clear History',
                      style: CustomFunctions.style(
                          fontWeight: FontWeight.w500, size: 14),
                    ),
                    trailing: ElevatedButton(
                        style: ThemeSetup.redButtonStyle,
                        onPressed: () async {
                          showClearHistoryDialog(context);
                        },
                        child: const Text('Clear'))),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: GetBuilder<ProfileCtrl>(builder: (pc) {
                    return ListTile(
                      onTap: () {
                        gc.chatHelperState();
                        Get.off(() => const ProfileView(),
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 400),
                            transition: Transition.zoom);
                      },
                      shape: OutlineInputBorder(
                          borderRadius: AppSizes.radius10,
                          borderSide: BorderSide.none),
                      minLeadingWidth: 0,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                      horizontalTitleGap: 10,
                      leading: pc.profileDownloadedUrl.isNotEmpty
                          ? CircleAvatar(
                              radius: 20,
                              backgroundImage: CachedNetworkImageProvider(
                                  pc.profileDownloadedUrl),
                            )
                          : const CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/person.jpg'),
                            ),
                      title: Text(
                        pc.nameController.text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w500,
                            size: 13,
                            color: AppColors.blackColor),
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          await lc.logout(context);
                        },
                        icon: Icon(Icons.logout, color: AppColors.black87),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
