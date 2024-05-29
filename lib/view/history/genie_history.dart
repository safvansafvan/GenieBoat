import 'package:chatboat/view/widgets/boat_animate.dart';
import 'package:chatboat/view/widgets/history_view.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenieHistory extends StatelessWidget {
  const GenieHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BoatAnimate(
      child: GetBuilder<GlobleController>(builder: (ctrl) {
        return Container(
          width: 210,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: AppColors.bgColor),
            ),
            color: ctrl.isDarkTheme
                ? AppColors.blackShade
                : const Color.fromARGB(246, 255, 255, 255),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'History',
                      style: CustomFunctions.style(
                          fontWeight: FontWeight.w700,
                          size: 20,
                          color: ctrl.focusColor),
                    ),
                    Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.bgColor),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: '1',
                            style: TextStyle(color: ctrl.focusColor),
                            children: [
                              TextSpan(
                                  text: '/',
                                  style: TextStyle(color: ctrl.focusColor)),
                              TextSpan(
                                  text: '50',
                                  style: TextStyle(color: ctrl.focusColor))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Divider(),
              ),
              HistoryView(
                  color: ctrl.secondaryColor ?? AppColors.blackColor,
                  paddingLeft: 5),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: AppSizes.radius10,
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.bgColor),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: !ctrl.isDarkTheme
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                      ),
                      Text(
                        'Clear History',
                        style: TextStyle(
                          color: !ctrl.isDarkTheme
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
