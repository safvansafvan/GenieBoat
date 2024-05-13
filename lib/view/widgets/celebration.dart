import 'dart:math';

import 'package:chatboat/view_model/globel_ctrl.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget celebrationKit() {
  final gctrl = Get.find<GlobleController>();
  return Align(
    alignment: Alignment.topCenter,
    child: ConfettiWidget(
      confettiController: gctrl.controllerTopCenter,
      blastDirection: pi / 1,
      maxBlastForce: 3,
      minBlastForce: 2,
      emissionFrequency: 0.03,
      numberOfParticles: 15,
    ),
  );
}
