import 'package:get/get.dart';
import 'package:score_board/core/controller/counter_controller.dart';
import 'package:score_board/core/controller/setting_controller.dart';

class SettingBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
    Get.lazyPut(() => SettingController());
  }
}
