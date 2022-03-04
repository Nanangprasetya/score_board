import 'package:get/get.dart';
import 'package:score_board/core/controller/setting_controller.dart';

import 'ads_controller.dart';

enum CountType { RIGHT, LEFT }

class CounterController extends GetxController {
  static CounterController get to => Get.find();

  final _clickCountRight = 0.obs;
  final _clickCountLeft = 0.obs;
  final _clickReset = 0.obs;
  final _isEditScore = false.obs;
  final _isWinner = false.obs;
  final _countRight = 0.obs;
  final _countLeft = 0.obs;
  final _isWinRight = false.obs;
  final _isWinLeft = false.obs;
  final _messageWinner = "".obs;

  bool get isEditScore => _isEditScore.value;
  bool get isWinner => _isWinner.value;
  int get countRight => _countRight.value;
  int get countLeft => _countLeft.value;
  bool get isWinRight => _isWinRight.value;
  bool get isWinLeft => _isWinLeft.value;
  String get messageWinner => _messageWinner.value;

  void setIsEditScore(bool value) => _setEditScore(value);
  void setIsWinner(bool value) => _setWinnerShow(value);
  void increment(CountType countType) => _increment(countType);
  void decrement(CountType countType) => _decrement(countType);
  void reset() => _reset();

  @override
  void onInit() {
    AdsController.to.initBannerAd();
    AdsController.to.createRewardedAd();
    ever(_countRight,
        (_) => _winSnackBar(_countRight.value, SettingController.to.textRight));
    ever(_countLeft,
        (_) => _winSnackBar(_countLeft.value, SettingController.to.textLeft));
    super.onInit();
  }

  @override
  void onClose() {
    AdsController.to.bannerAdWidget.dispose();
    super.onClose();
  }

  void _winSnackBar(int count, String txt) {
    final limitInit = SettingController.to.textLimit;
    final isLimit = SettingController.to.isLimitBoard;
    if (isLimit && count == int.parse(limitInit)) {
      _setWinnerShow(true);
      _messageWinner.value = "win.text";
    }
    update();
  }

  Future<void> _increment(CountType countType) async {
    final _incrementInit = SettingController.to.textIncrement;
    final limitInit = SettingController.to.textLimit;
    final isLimit = SettingController.to.isLimitBoard;

    if (countType == CountType.RIGHT) {
      if (isLimit &&
          _countRight.value >
              int.parse(limitInit) - int.parse(_incrementInit)) {
        _isWinRight.value = true;
      } else {
        _countRight.value += int.parse(_incrementInit);

        if (!isEditScore) {
          _setAdsCount(countType);
        }
      }
    } else {
      if (isLimit &&
          _countLeft.value > int.parse(limitInit) - int.parse(_incrementInit)) {
        _isWinLeft.value = true;
      } else {
        _countLeft.value += int.parse(_incrementInit);
        
        if (!isEditScore) {
          _setAdsCount(countType);
        }
      }
    }
    update();
  }

  void _decrement(CountType countType) {
    final _incrementInit = SettingController.to.textIncrement;
    if (countType == CountType.RIGHT) {
      if (_countRight > 0) {
        _countRight.value -= int.parse(_incrementInit);
      }
    } else {
      if (_countLeft > 0) {
        _countLeft.value -= int.parse(_incrementInit);
      }
    }
    _isWinRight.value = false;
    _isWinLeft.value = false;
    update();
  }

  void _reset() {
    _countRight.value = 0;
    _countLeft.value = 0;
    _isWinRight.value = false;
    _isWinLeft.value = false;
    _clickReset.value++;
    AdsController.to.adsClick2X(_clickReset.value);
    update();
  }

  void _setEditScore(bool value) {
    _isEditScore.value = value;
    update();
  }

  void _setWinnerShow(bool value) {
    _isWinner.value = value;
    update();
  }

  void _setAdsCount(CountType countType) {
    if (countType == CountType.RIGHT) {
      _clickCountRight.value++;
    } else {
      _clickCountLeft.value++;
    }
    AdsController.to.adsClick10X(_clickCountRight.value, _clickCountLeft.value);
  }
}
