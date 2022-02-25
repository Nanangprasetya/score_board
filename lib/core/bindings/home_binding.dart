import 'package:get/get.dart';
import 'package:score_board/core/controller/counter_controller.dart';
import 'package:score_board/core/controller/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CounterController());
  }
}
