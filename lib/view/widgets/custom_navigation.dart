import 'package:chatboat/view/widgets/history_view.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/globel_ctrl.dart';

class CustomLeftNavigation extends StatelessWidget {
  const CustomLeftNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobleController>(
      builder: (globelCtrl) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: 210,
          child: Column(
            children: [
              ListTile(
                leading: Image.asset('assets/images/boat_icon.png',
                    width: 50, height: 50),
                title: Text(
                  'ChatGenie',
                  style: boatTextStyle(
                      fontWeight: FontWeight.w500, size: 18, color: whiteColor),
                ),
              ),
              height20,
              context.isPhone
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: bgColor),
                                borderRadius: radius5),
                            child: Icon(Icons.home, color: whiteColor),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: bgColor),
                                borderRadius: radius5),
                            child: Icon(Icons.settings, color: whiteColor),
                          )
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        AnimatedContainer(
                          curve: Curves.decelerate,
                          duration: boatDuration,
                          width: 160,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color:
                                globelCtrl.isChatHelper ? bttnBg : blackColor,
                            borderRadius: radius10,
                          ),
                          child: ListTile(
                            shape: OutlineInputBorder(borderRadius: radius10),
                            hoverColor: Colors.blue.withAlpha(300),
                            onTap: () {
                              globelCtrl.chatHelperState();
                            },
                            minLeadingWidth: 0,
                            horizontalTitleGap: 12,
                            leading:
                                Icon(Icons.message_rounded, color: greyColor),
                            title: Text(
                              'Ai Chat Helper',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: boatTextStyle(
                                  fontWeight: FontWeight.w500,
                                  size: 14,
                                  color: whiteColor),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: boatDuration,
                          curve: Curves.decelerate,
                          width: 160,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: globelCtrl.isSettings ? bttnBg : blackColor,
                            borderRadius: radius10,
                          ),
                          child: ListTile(
                            shape: OutlineInputBorder(borderRadius: radius10),
                            hoverColor: Colors.blue.withAlpha(300),
                            onTap: () {
                              globelCtrl.settingState();
                            },
                            minLeadingWidth: 0,
                            horizontalTitleGap: 12,
                            leading: Icon(Icons.settings, color: greyColor),
                            title: Text(
                              'Settings',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: boatTextStyle(
                                  fontWeight: FontWeight.w500,
                                  size: 14,
                                  color: whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
              context.width <= 968
                  ? HistoryView(color: whiteColor)
                  : const SizedBox(),
              context.width > 968 ? Spacer() : SizedBox(),
              Divider(
                color: whiteColor.withAlpha(300),
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              AnimatedContainer(
                duration: boatDuration,
                curve: Curves.decelerate,
                width: 160,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: radius10,
                ),
                child: ListTile(
                  shape: OutlineInputBorder(borderRadius: radius10),
                  hoverColor: Colors.blue.withAlpha(300),
                  onTap: () {},
                  minLeadingWidth: 0,
                  horizontalTitleGap: 0,
                  trailing: Icon(Icons.logout, color: greyColor),
                  title: Text(
                    'Logout',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: boatTextStyle(
                        fontWeight: FontWeight.w500,
                        size: 14,
                        color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
