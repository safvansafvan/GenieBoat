import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
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
          ),
        ),
      ),
    );
  }
}
