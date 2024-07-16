import 'package:chatboat/view/chat_helper/chat_helper.dart';
import 'package:chatboat/view/history/genie_history.dart';
import 'package:chatboat/view/start_chat/start_chat.dart';
import 'package:chatboat/view/widgets/boat_appbar.dart';
import 'package:chatboat/view/widgets/celebration.dart';
import 'package:chatboat/view/widgets/custom_navigation.dart';
import 'package:chatboat/view/widgets/menu_drawer.dart';
import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/controller/profile_controller.dart';
import 'package:chatboat/view_model/controller/rating_controller.dart';
import 'package:chatboat/view_model/core/colors.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
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
  final bc = Get.find<BoatChatCtrl>();
  final pc = Get.find<ProfileCtrl>();
  final rating = Get.find<RatingController>();

  @override
  void initState() {
    gctrl.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    gctrl.controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 4));
    bc.getHistoryFirestore();

    pc.getUsersDetailsForProfile();
    rating.getUserRatingData();
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor:
          context.isPhone ? AppColors.whiteColor : AppColors.blackColor,
      body: GetBuilder<BoatChatCtrl>(
        builder: (ctrl) {
          return Padding(
            padding: EdgeInsets.all(context.isPhone ? 0.0 : 10.0),
            child: Column(
              children: [
                if (context.isPhone) celebrationKit(),
                if (context.isPhone)
                  BoatAppBar(scaffoldKey: scaffoldKey, chatCtrl: ctrl),
                Expanded(
                  child: Row(
                    children: [
                      if (context.width > 748) const CustomLeftNavigation(),
                      centerViewHandling(ctrl),
                      if (context.width > 968 && ctrl.allHistory.isNotEmpty)
                        const GenieHistory(),
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
        return const Expanded(child: ChatHelperWidget());
      case 1:
        return const Expanded(child: ChatHelperWidget());
      default:
        return const SizedBox();
    }
  }
}
