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
            color: ctrl.themeMode
                ? Theme.of(context).colorScheme.background
                : Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 9),
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
                          size: 18,
                          color: Theme.of(context).colorScheme.primary),
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
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                            children: [
                              TextSpan(
                                text: '/',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              TextSpan(
                                text: '50',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              )
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
                  color: Theme.of(context).colorScheme.primary, paddingLeft: 5),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: AppSizes.radius10,
                    color: AppColors.whiteColor,
                    border: Border.all(color: AppColors.bgColor),
                    boxShadow: [BoxShadow(color: AppColors.greyColor)]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_outline, color: AppColors.blackColor),
                      Text(
                        'Clear History',
                        style: CustomFunctions.style(
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: AppColors.blackColor),
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
