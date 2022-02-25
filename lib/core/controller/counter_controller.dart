import 'package:get/get.dart';
import 'package:score_board/core/controller/setting_controller.dart';
import 'package:score_board/core/service/service.dart';

enum CountType { RIGHT, LEFT }

class CounterController extends GetxController {
  static CounterController get to => Get.find();
  LocalStorageService _service = LocalStorageService();

  final _localCountRight = "localCountRight";
  final _localCountLeft = "localCountLeft";
  final _localWinRight = "localWinRight";
  final _localWinLeft = "localWinLeft";

  /// Private declaration
  final _countRight = 0.obs;
  final _countLeft = 0.obs;
  final _isWinRight = false.obs;
  final _isWinLeft = false.obs;

  /// Public ddeclaration
  /// get counter right and left
  int get countRight => _countRight.value;
  int get countLeft => _countLeft.value;

  /// Get win if > limitField Setting
  bool get isWinRight => _isWinRight.value;
  bool get isWinLeft => _isWinLeft.value;

  /// Public Function
  /// Counter INCREMENT default +1,
  /// Use [CountType.RIGHT] for Counter Right, [CountType.LEFT] for Counter Left.
  void increment(CountType countType) => _increment(countType);

  /// Counter DECREMENT default -1,
  /// Use [CountType.RIGHT] for Counter Right, [CountType.LEFT] for Counter Left.
  void decrement(CountType countType) => _decrement(countType);

  /// Reset all [CountType] to ZERO (0),
  void reset() => _reset();

  @override
  void onInit() {
    _getCount(CountType.RIGHT, _countRight.value, _isWinRight.value);
    _getCount(CountType.LEFT, _countLeft.value, _isWinLeft.value);
    super.onInit();
  }

  Future<void> _increment(CountType countType) async {
    final _incrementInit = SettingController.to.incrementField.text;
    final _limitInit = SettingController.to.limitField.text;

    if (countType == CountType.RIGHT) {
      if (_countRight.value ==
          int.parse(_limitInit) - int.parse(_incrementInit)) {
        _isWinRight.value = true;
        _service.setBool(_localWinRight, _isWinRight.value);
      } else {
        _countRight.value += int.parse(_incrementInit);
        _service.setInt(_localCountRight, _countRight.value);
      }
    } else {
      if (_countLeft.value ==
          int.parse(_limitInit) - int.parse(_incrementInit)) {
        _isWinLeft.value = true;
        _service.setBool(_localWinLeft, _isWinLeft.value);
      } else {
        _countLeft.value += int.parse(_incrementInit);
        _service.setInt(_localCountLeft, _countLeft.value);
      }
    }

    update();
  }

  void _decrement(CountType countType) {
    final _incrementInit = SettingController.to.incrementField.text;
    if (countType == CountType.RIGHT) {
      if (_countRight > 0) {
        _countRight.value -= int.parse(_incrementInit);
        _service.setInt(_localCountRight, _countRight.value);
      }
    } else {
      if (_countLeft > 0) {
        _countLeft.value -= int.parse(_incrementInit);
        _service.setInt(_localCountLeft, _countLeft.value);
      }
    }
    _isWinRight.value = false;
    _isWinLeft.value = false;
    _service.setBool(_localWinRight, _isWinRight.value);
    _service.setBool(_localWinLeft, _isWinLeft.value);
    update();
  }

  void _reset() {
    _countRight.value = 0;
    _countLeft.value = 0;
    _isWinRight.value = false;
    _isWinLeft.value = false;
    _service.setInt(_localCountRight, _countRight.value);
    _service.setInt(_localCountLeft, _countLeft.value);
    _service.setBool(_localWinRight, _isWinRight.value);
    _service.setBool(_localWinLeft, _isWinLeft.value);
    update();
  }

  Future<void> _getCount(CountType countType, int count, bool win) async {
    if (countType == CountType.RIGHT) {
      final _count = await _service.getInt(_localCountRight);
      final _win = await _service.getBool(_localWinRight);
      if (_count == null && _win == null) {
        _service.setInt(_localCountRight, count);
        _service.setBool(_localCountRight, win);
      } else {
        _countRight.value = _count;
        _isWinRight.value = _win;
      }
    } else {
      final _count = await _service.getInt(_localCountLeft);
      final _win = await _service.getBool(_localWinLeft);
      if (_count == null && _win == null) {
        _service.setInt(_localCountLeft, count);
        _service.setBool(_localCountLeft, win);
      } else {
        _countLeft.value = _count;
        _isWinLeft.value = _win;
      }
    }
    update();
  }
}
