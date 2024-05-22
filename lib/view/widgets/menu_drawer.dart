import 'package:chatboat/view/widgets/custom_navigation.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: AppColors.blackColor,
      child: const Column(
        children: [
          Expanded(
            child: CustomLeftNavigation(),
          ),
        ],
      ),
    );
  }
}
