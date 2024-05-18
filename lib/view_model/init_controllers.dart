import 'package:chatboat/view_model/boat_controller.dart';
import 'package:chatboat/view_model/firestore_controller.dart';
import 'package:chatboat/view_model/globel_ctrl.dart';
import 'package:chatboat/view_model/login_ctrl.dart';
import 'package:get/get.dart';

class InitControllers {
  static void init() {
    Get.put(GlobleController());
    Get.put(LoginController());
    Get.put(BoatChatCtrl());
    Get.put(FireStoreCtrl());
  }
}
