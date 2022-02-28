import 'package:get/get.dart';
import 'package:score_board/core/controller/ads_controller.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find();

  final _isEditScore = false.obs;
  final _isWinner = false.obs;

  /// Get value Switch [EDIT SCORE] default is [false].
  bool get isEditScore => _isEditScore.value;
  bool get isWinner => _isWinner.value;

  /// Set edit Score required boolean.
  void setIsEditScore(bool value) => _setEditScore(value);

  /// Set Show Winner on Bottom required boolean.
  void setIsWinner(bool value) => _setWinnerShow(value);

  @override
  void onInit() {
    AdsController.to.createRewardedAd();
    super.onInit();
  }

  void _setEditScore(bool value) {
    
    _isEditScore.value = value;
  }

  void _setWinnerShow(bool value) {
    _isWinner.value = value;
  }
}
