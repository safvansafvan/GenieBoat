import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:chatboat/view_model/core/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatAppBar extends StatelessWidget {
  const BoatAppBar(
      {super.key, required this.scaffoldKey, required this.chatCtrl});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final BoatChatCtrl chatCtrl;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListTile(
            leading: context.width < 747
                ? IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  )
                : null,
            contentPadding: EdgeInsets.zero,
            title: context.width < 747
                ? null
                : Text(
                    'Ai Chat Helper',
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w700, size: 20),
                  ),
            trailing: SizedBox(
              width: 340,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  context.width < 501
                      ? Container(
                          height: 34,
                          width: 34,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.bgColor),
                              borderRadius: AppSizes.radius5),
                          child: const Icon(Icons.search),
                        )
                      : SizedBox(
                          height: 40,
                          width: 250,
                          child: TextField(
                            cursorColor: AppColors.greyColor,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              hintText: 'Search ...',
                              hintStyle: TextStyle(
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.w500),
                              prefixIcon: Icon(Icons.search,
                                  color: AppColors.greyColor),
                              fillColor: Colors.grey.withAlpha(300),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: AppSizes.radius5,
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: AppSizes.radius5,
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                  if (chatCtrl.bodyCurrentInd == 1)
                    Container(
                      height: 34,
                      width: 34,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.bgColor),
                          borderRadius: AppSizes.radius5),
                      child: const Icon(Icons.notifications_outlined),
                    ),
                  if (chatCtrl.bodyCurrentInd == 1)
                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.bgColor),
                          borderRadius: AppSizes.radius5),
                      child: const Icon(Icons.info_outline),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
