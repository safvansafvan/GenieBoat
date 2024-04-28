import 'package:chatboat/view/widgets/boat_drop_down.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/globel_ctrl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

settingsDialog(BuildContext context) async {
  final gc = Get.find<GlobleController>();
  return await showDialog(
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        elevation: 5,
        insetPadding: EdgeInsets.zero,
        surfaceTintColor: const Color(0xffF9F9F9),
        shadowColor: const Color(0xffF9F9F9),
        backgroundColor: const Color(0xffF9F9F9),
        shape: RoundedRectangleBorder(borderRadius: radius10),
        child: SizedBox(
          width: 600,
          height: 500,
          child: Column(
            children: [
              minHeight,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Settings',
                      style: boatTextStyle(
                          fontWeight: FontWeight.w700,
                          size: 18,
                          color: blackColor),
                    ),
                    IconButton(
                        onPressed: () {
                          gc.chatHelperState();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  'Theme',
                  style: boatTextStyle(fontWeight: FontWeight.w500, size: 16),
                ),
                trailing: const SizedBox(
                  width: 150,
                  child: CredrDropDown(hintText: 'Theme'),
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Privacy & Policy',
                  style: boatTextStyle(fontWeight: FontWeight.w500, size: 16),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'About',
                  style: boatTextStyle(fontWeight: FontWeight.w500, size: 16),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                  title: Text(
                    'Clear History',
                    style: boatTextStyle(fontWeight: FontWeight.w500, size: 16),
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        child: Text(
                          'Clear',
                          style: boatTextStyle(
                              fontWeight: FontWeight.w600,
                              size: 14,
                              color: whiteColor),
                        ),
                      ),
                    ),
                  )),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListTile(
                  shape: OutlineInputBorder(
                      borderRadius: radius10, borderSide: BorderSide.none),
                  minLeadingWidth: 0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                  horizontalTitleGap: 10,
                  leading: const CircleAvatar(radius: 20),
                  title: Text(
                    'Muhammed Safvan',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: boatTextStyle(
                        fontWeight: FontWeight.w500,
                        size: 12,
                        color: blackColor),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.logout),
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
