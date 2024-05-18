import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BoatAnimate extends StatelessWidget {
  const BoatAnimate({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(
          duration: Duration(milliseconds: 400),
        ),
        ScaleEffect(
          duration: Duration(milliseconds: 400),
        )
      ],
      child: child,
    );
  }
}
