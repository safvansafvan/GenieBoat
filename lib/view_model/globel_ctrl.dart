import 'package:get/get.dart';

class GlobleController extends GetxController {
  bool isChatHelper = true;
  bool isTemblate = false;
  bool isSettings = false;

  void chatHelperState() {
    isTemblate = false;
    isSettings = false;
    isChatHelper = true;
    update();
  }

  void templateState() {
    isSettings = false;
    isChatHelper = false;
    isTemblate = true;
    update();
  }

  void settingState() {
    isChatHelper = false;
    isTemblate = false;
    isSettings = true;
    update();
  }
}
