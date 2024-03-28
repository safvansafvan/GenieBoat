import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartChatingView extends StatelessWidget {
  const StartChatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 0.0,
        minHeight: 0.0,
      ),
      width: context.width - 460,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: (context.width < 968)
            ? context.isPhone
                ? null
                : BorderRadius.circular(15)
            : const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.network('assets/gif/boat.gif',
                  height: 200, width: 200, fit: BoxFit.cover),
              Text('How Can I Help You Today'),
            ],
          )
        ],
      ),
    );
  }
}
