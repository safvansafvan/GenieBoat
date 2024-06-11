import 'package:chatboat/view/chat_helper/widget/chat_data_widget.dart';
import 'package:chatboat/view/widgets/boat_animate.dart';
import 'package:chatboat/view/widgets/lottie_view.dart';
import 'package:chatboat/view/widgets/message_sender.dart';
import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHelperWidget extends StatelessWidget {
  const ChatHelperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BoatAnimate(
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 0.0,
          minHeight: 0.0,
        ),
        width: context.width - 460,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: (context.width < 968)
              ? context.isPhone
                  ? null
                  : BorderRadius.circular(15)
              : const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
        ),
        padding: EdgeInsets.symmetric(vertical: context.isPhone ? 0 : 4),
        margin: EdgeInsets.symmetric(vertical: context.isPhone ? 0 : 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: GetBuilder<BoatChatCtrl>(
                builder: (fCtrl) {
                  return GestureDetector(
                    onVerticalDragUpdate: (details) {
                      fCtrl.loadingNewState();
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      primary: true,
                      itemCount: fCtrl.allHistory.length,
                      itemBuilder: (context, index) {
                        final dataSet = fCtrl.allHistory[index];
                        if (index == fCtrl.allHistory.length - 1) {
                          return BoatChatDataWidget(
                            dataSet: dataSet,
                            isLastIndex: true,
                            ctrl: fCtrl,
                          );
                        } else {
                          return BoatChatDataWidget(
                            dataSet: dataSet,
                            isLastIndex: false,
                            ctrl: fCtrl,
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            GetBuilder<BoatChatCtrl>(
              builder: (bCtrl) {
                return bCtrl.isLoadingAns
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: lottieView(
                            path: 'assets/lotties/genarate_loading.json',
                            height: 150),
                      )
                    : const SizedBox();
              },
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: GenieMessageSender(),
            ),
          ],
        ),
      ),
    );
  }
}
