import 'package:get/get.dart';
import 'package:score_board/core/controller/ads_controller.dart';
import 'package:score_board/core/controller/counter_controller.dart';
import 'package:score_board/core/controller/setting_controller.dart';
import 'package:score_board/core/controller/timer_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => AdsController());
    Get.lazyPut(() => TimerController());
  }
}
