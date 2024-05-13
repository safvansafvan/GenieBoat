import 'dart:developer';
import 'package:chatboat/view/chat_helper/chat_helper.dart';
import 'package:chatboat/view/history/genie_history.dart';
import 'package:chatboat/view/start_chat/start_chat.dart';
import 'package:chatboat/view/widgets/celebration.dart';
import 'package:chatboat/view/widgets/custom_navigation.dart';
import 'package:chatboat/view/widgets/menu_drawer.dart';
import 'package:chatboat/view_model/boat_controller.dart';
import 'package:chatboat/view_model/constant.dart';
import 'package:chatboat/view_model/firestore_controller.dart';
import 'package:chatboat/view_model/globel_ctrl.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final gctrl = Get.find<GlobleController>();
  final fc = Get.find<FireStoreCtrl>();

  @override
  void initState() {
    gctrl.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    gctrl.controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 4));
    fc.getHistoryFromApp();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    gctrl.size = Size(context.width, context.height);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    log(context.width.toString());
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: context.isPhone ? whiteColor : blackColor,
      body: GetBuilder<BoatChatCtrl>(
        builder: (ctrl) {
          return Padding(
            padding: EdgeInsets.all(context.isPhone ? 0.0 : 10.0),
            child: Column(
              children: [
                if (context.isPhone) celebrationKit(),
                if (context.isPhone)
                  SafeArea(
                    child: SizedBox(
                      height: 45,
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
                                  style: boatTextStyle(
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
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: bgColor),
                                            borderRadius: radius5),
                                        child: const Icon(Icons.search),
                                      )
                                    : SizedBox(
                                        height: 40,
                                        width: 250,
                                        child: TextField(
                                          cursorColor: greyColor,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(left: 10),
                                            hintText: 'Search ...',
                                            hintStyle: TextStyle(
                                                color: greyColor,
                                                fontWeight: FontWeight.w500),
                                            prefixIcon: Icon(Icons.search,
                                                color: greyColor),
                                            fillColor:
                                                Colors.grey.withAlpha(300),
                                            filled: true,
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: radius5,
                                                borderSide: BorderSide.none),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: radius5,
                                                borderSide: BorderSide.none),
                                          ),
                                        ),
                                      ),
                                if (ctrl.bodyCurrentInd == 1)
                                  Container(
                                    height: 34,
                                    width: 34,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: bgColor),
                                        borderRadius: radius5),
                                    child: const Icon(
                                        Icons.notifications_outlined),
                                  ),
                                if (ctrl.bodyCurrentInd == 1)
                                  Container(
                                    height: 34,
                                    width: 34,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: bgColor),
                                        borderRadius: radius5),
                                    child: const Icon(Icons.info_outline),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (context.isPhone)
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Divider(),
                  ),
                Expanded(
                  child: Row(
                    children: [
                      if (context.width > 748) const CustomLeftNavigation(),
                      centerViewHandling(ctrl),
                      if (context.width > 968) const GenieHistory(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      drawer: const MenuDrawer(),
    );
  }

  Widget centerViewHandling(BoatChatCtrl ctrl) {
    switch (ctrl.bodyCurrentInd) {
      case 0:
        return const Expanded(child: StartChatingView());
      case 1:
        return const Expanded(child: ChatHelperWidget());
      default:
        return const SizedBox();
    }
  }
}
