import 'package:chatboat/view/settings/settings.dart';
import 'package:chatboat/view/widgets/history_view.dart';
import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/controller/login_ctrl.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/durations.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/controller/globel_ctrl.dart';

class CustomLeftNavigation extends StatelessWidget {
  const CustomLeftNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final lc = Get.find<LoginController>();
    final bc = Get.find<BoatChatCtrl>();
    return GetBuilder<GlobleController>(
      builder: (globelCtrl) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: 210,
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset('assets/images/boat_icon.png',
                      width: 50, height: 50),
                  title: Text(
                    'ChatGenie',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500,
                        size: 15,
                        color: AppColors.whiteColor),
                  ),
                ),
                AppSizes.height20,
                context.isPhone
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                globelCtrl.chatHelperState();
                                bc.bodyCurrentIndState(0);
                                Get.back();
                              },
                              child: AnimatedContainer(
                                duration: AppDurations.minDuration,
                                height: 50,
                                width: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: globelCtrl.isChatHelper
                                        ? AppColors.whiteColor.withAlpha(300)
                                        : Colors.transparent,
                                    border:
                                        Border.all(color: AppColors.bgColor),
                                    borderRadius: AppSizes.radius5),
                                child: Icon(Icons.home,
                                    color: AppColors.whiteColor),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                globelCtrl.settingState();
                                settingsDialog(context);
                              },
                              child: AnimatedContainer(
                                duration: AppDurations.minDuration,
                                height: 50,
                                width: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: globelCtrl.isSettings
                                        ? AppColors.whiteColor.withAlpha(300)
                                        : Colors.transparent,
                                    border:
                                        Border.all(color: AppColors.bgColor),
                                    borderRadius: AppSizes.radius5),
                                child: Icon(Icons.settings,
                                    color: AppColors.whiteColor),
                              ),
                            )
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          AnimatedContainer(
                            curve: Curves.decelerate,
                            duration: AppDurations.minDuration,
                            width: 160,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: globelCtrl.isChatHelper
                                  ? AppColors.bttnBg
                                  : AppColors.blackColor,
                              borderRadius: AppSizes.radius10,
                            ),
                            child: ListTile(
                              shape: OutlineInputBorder(
                                  borderRadius: AppSizes.radius10),
                              hoverColor: Colors.blue.withAlpha(300),
                              onTap: () {
                                globelCtrl.chatHelperState();
                              },
                              minLeadingWidth: 0,
                              horizontalTitleGap: 12,
                              leading: Icon(Icons.message_rounded,
                                  color: AppColors.greyColor),
                              title: Text(
                                'Ai Chat Helper',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: CustomFunctions.style(
                                    fontWeight: FontWeight.w500,
                                    size: 13,
                                    color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: AppDurations.minDuration,
                            curve: Curves.decelerate,
                            width: 160,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: globelCtrl.isSettings
                                  ? AppColors.bttnBg
                                  : AppColors.blackColor,
                              borderRadius: AppSizes.radius10,
                            ),
                            child: ListTile(
                              shape: OutlineInputBorder(
                                  borderRadius: AppSizes.radius10),
                              hoverColor: Colors.blue.withAlpha(300),
                              onTap: () async {
                                globelCtrl.settingState();
                                await settingsDialog(context);
                              },
                              minLeadingWidth: 0,
                              horizontalTitleGap: 12,
                              leading: Icon(Icons.settings,
                                  color: AppColors.greyColor),
                              title: Text(
                                'Settings',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: CustomFunctions.style(
                                    fontWeight: FontWeight.w500,
                                    size: 13,
                                    color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                context.width <= 968
                    ? HistoryView(color: AppColors.whiteColor)
                    : const SizedBox(),
                context.width > 968 ? const Spacer() : const SizedBox(),
                const Divider(indent: 10, endIndent: 10),
                AnimatedContainer(
                  duration: AppDurations.minDuration,
                  curve: Curves.decelerate,
                  width: 160,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(borderRadius: AppSizes.radius10),
                  child: ListTile(
                    shape: OutlineInputBorder(borderRadius: AppSizes.radius10),
                    hoverColor: Colors.blue.withAlpha(300),
                    onTap: () async {
                      await lc.logout(context);
                    },
                    minLeadingWidth: 0,
                    horizontalTitleGap: 0,
                    trailing: Icon(Icons.logout, color: AppColors.greyColor),
                    title: Text(
                      'Logout',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: CustomFunctions.style(
                          fontWeight: FontWeight.w500,
                          size: 14,
                          color: AppColors.whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
