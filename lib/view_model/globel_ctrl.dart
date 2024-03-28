import 'package:get/get.dart';

class GlobleController extends GetxController {
  bool isChatHelper = true;
  bool isSettings = false;
  int bodyCurrentInd = 0;

  void chatHelperState() {
    isSettings = false;
    isChatHelper = true;
    update();
  }

  void settingState() {
    isChatHelper = false;
    isSettings = true;
    update();
  }
}
