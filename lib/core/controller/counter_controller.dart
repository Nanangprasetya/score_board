import 'package:get/get.dart';
import 'package:score_board/core/controller/home_controller.dart';
import 'package:score_board/core/controller/setting_controller.dart';

enum CountType { RIGHT, LEFT }

class CounterController extends GetxController {
  static CounterController get to => Get.find();

  /// Private declaration
  final _countRight = 0.obs;
  final _countLeft = 0.obs;
  final _isWinRight = false.obs;
  final _isWinLeft = false.obs;
  final _messageWinner = "".obs;

  /// Public ddeclaration
  /// get counter right and left
  int get countRight => _countRight.value;
  int get countLeft => _countLeft.value;

  /// Get win if > limitField Setting
  bool get isWinRight => _isWinRight.value;
  bool get isWinLeft => _isWinLeft.value;

  String get messageWinner => _messageWinner.value;

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
    ever(_countRight,
        (_) => _winSnackBar(_countRight.value, SettingController.to.textRight));
    ever(_countLeft,
        (_) => _winSnackBar(_countLeft.value, SettingController.to.textLeft));
    super.onInit();
  }

  void _winSnackBar(int count, String txt) {
    final limitInit = SettingController.to.textLimit;
    final isLimit = SettingController.to.isLimitBoard;
    if (isLimit && count == int.parse(limitInit)) {
      HomeController.to.setIsWinner(true);

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
      }
    } else {
      if (isLimit &&
          _countLeft.value > int.parse(limitInit) - int.parse(_incrementInit)) {
        _isWinLeft.value = true;
      } else {
        _countLeft.value += int.parse(_incrementInit);
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
    update();
  }
}
