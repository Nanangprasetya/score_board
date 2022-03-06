import 'package:get/get.dart';
import 'package:score_board/core/controller/ads_controller.dart';
import 'package:score_board/core/controller/purchase_controller.dart';
class PurchaseBindings implements Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut(() => PurchaseController());
    Get.lazyPut(() => AdsController());
  }
}
