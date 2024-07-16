import 'package:chatboat/view_model/controller/boat_controller.dart';
import 'package:chatboat/view_model/controller/globel_ctrl.dart';
import 'package:chatboat/view_model/controller/login_ctrl.dart';
import 'package:chatboat/view_model/controller/profile_controller.dart';
import 'package:chatboat/view_model/controller/rating_controller.dart';
import 'package:get/get.dart';

class InitControllers {
  static void init() {
    Get.put(GlobleController());
    Get.put(LoginController());
    Get.put(BoatChatCtrl());
    Get.put(ProfileCtrl());
    Get.put(RatingController());
  }
}
