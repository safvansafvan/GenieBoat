import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/core/custom_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key, required this.color, this.paddingLeft = 0});

  final Color color;
  final double paddingLeft;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoatChatCtrl>(builder: (fctrl) {
      return Expanded(
        child: ListView.builder(
          itemCount: fctrl.allHistory.length,
          itemBuilder: (context, index) {
            final dataSet = fctrl.allHistory[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: paddingLeft),
                horizontalTitleGap: 0,
                title: Text(
                  dataSet.qus ?? '',
                  style: CustomFunctions.style(
                      fontWeight: FontWeight.w600, size: 13, color: color),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    dataSet.ans ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: CustomFunctions.style(
                        fontWeight: FontWeight.w500, size: 12, color: color),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
