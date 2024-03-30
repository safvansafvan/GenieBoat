import 'package:chatboat/view_model/constant.dart';

import 'package:flutter/material.dart';

settingsDialog(BuildContext context) async {
  return await showDialog(
    barrierColor: Colors.transparent,
    barrierDismissible: true,
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
                    const Icon(Icons.close, size: 30)
                  ],
                ),
              ),
              const Divider()
            ],
          ),
        ),
      );
    },
  );
}
