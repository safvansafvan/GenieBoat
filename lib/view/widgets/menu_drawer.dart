import 'package:chatboat/view/widgets/custom_navigation.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobleController>(builder: (ctrl) {
      return Drawer(
        width: 250,
        backgroundColor: ctrl.bgColor,
        child: const Column(
          children: [
            Expanded(
              child: CustomLeftNavigation(),
            ),
          ],
        ),
      );
    });
  }
}
