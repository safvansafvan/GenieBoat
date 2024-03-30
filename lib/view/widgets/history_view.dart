import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key, required this.color, this.paddingLeft = 0});

  final Color color;
  final double paddingLeft;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: paddingLeft),
              horizontalTitleGap: 0,
              title: Text(
                'Create Welcome Form',
                style: boatTextStyle(
                    fontWeight: FontWeight.w600, size: 13, color: color),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'write code html and css and java and create form ',
                  maxLines: 2,
                  style: boatTextStyle(
                      fontWeight: FontWeight.w500, size: 12, color: color),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
