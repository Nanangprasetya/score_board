import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:score_board/core/service/service.dart';
import 'package:score_board/utils/colors.dart';

class SettingController extends GetxController {
  static SettingController get to => Get.find();
  LocalStorageService _service = LocalStorageService();

  String _localIsLabelBoard = "localIsLabelBoard";
  String _localIsPositionBoard = "localIsPositionBoard";
  String _localIsLimitBoard = "localIsLimitBoard";
  String _localIsTimerBoard = "localIsTimerBoard";
  String _localLabelRightBoardColor = "localLabelRightBoardColor";
  String _localLabelLeftBoardColor = "localLabelLeftBoardColor";
  String _localLabelRightField = "localLabelRightField";
  String _localLabelLeftField = "localLabelLeftField";
  String _localIncrementField = "localIncrementField";
  String _localLimitField = "localLimitField";

  String _initLimit = "10";

  final _isLabelBoard = false.obs;
  final _isPositionBoard = false.obs;
  final _isLimitBoard = false.obs;
  final _isTimerBoard = true.obs;

  final _labelRightBoardColor = Rx<Color>(AppColors.blue);
  final _labelLeftBoardColor = Rx<Color>(AppColors.red);

  final _textRight = "B".obs;
  final _textLeft = "A".obs;
  final _textIncrement = "1".obs;
  final _textLimit = "10".obs;

  bool get isLabelBoard => _isLabelBoard.value;
  bool get isPositionBoard => _isPositionBoard.value;
  bool get isLimitBoard => _isLimitBoard.value;
  bool get isTimerBoard => _isTimerBoard.value;
  Color get labelLeftBoardColor => _labelLeftBoardColor.value;
  Color get labelRightBoardColor => _labelRightBoardColor.value;

  String get textRight => _textRight.value;
  String get textLeft => _textLeft.value;
  String get textIncrement => _textIncrement.value;
  String get textLimit => _textLimit.value;

  void setLabelBoard(bool value) => _setLabelBoard(value);
  void setPositionBoard(bool value) => _setPositionBoard(value);
  void setLimitBoard(bool value) => _setLimitBoard(value);
  void setTimerBoard(bool value) => _setTimerBoard(value);
  void setColorBoard(Color color) => _setColorBoard(color);

  void setTextRight(String value) => _setTextRight(value);
  void setTextLeft(String value) => _setTextLeft(value);
  void setTextIncrement(String value) => _setTextIncrement(value);
  void setTextLimit(String value) => _setTextLimit(value);

  @override
  void onInit() {
    _initLocal();
    super.onInit();
  }

  void _setLabelBoard(bool value) {
    _isLabelBoard.value = value;
    _service.setBool(_localIsLabelBoard, _isLabelBoard.value);
    update();
  }

  void _setPositionBoard(bool value) {
    _isPositionBoard.value = value;
    _service.setBool(_localIsPositionBoard, _isPositionBoard.value);
    update();
  }

  void _setLimitBoard(bool value) {
    
    _isLimitBoard.value = value;
    _service.setBool(_localIsLimitBoard, _isLimitBoard.value);
    update();
  }

  void _setTimerBoard(bool value) {
    _isTimerBoard.value = value;
    _service.setBool(_localIsTimerBoard, _isTimerBoard.value);
    update();
  }

  void _setTextRight(String value) {
    
      _textRight.value = value;
    _service.setString(_localLabelRightField, _textRight.value);
    update();
  }

  void _setTextLeft(String value) {
    _textLeft.value = value;
    _service.setString(_localLabelLeftField, _textLeft.value);
    update();
  }

  void _setTextIncrement(String value) {
    _textIncrement.value = value;
    _service.setString(_localIncrementField, _textIncrement.value);
    update();
  }

  void _setTextLimit(String value) {
    _textLimit.value = value;
    _service.setString(_localLimitField, _textLimit.value);
    update();
  }

  void _setColorBoard(Color color) {
    if (_isPositionBoard.value) {
      _labelRightBoardColor.value = color;
      _service.setInt(
          _localLabelRightBoardColor, _labelRightBoardColor.value.value);
    } else {
      _labelLeftBoardColor.value = color;
      _service.setInt(
          _localLabelLeftBoardColor, _labelLeftBoardColor.value.value);
    }
    update();
  }

  Future<void> _initLocal() async {
    final isLabel = await _service.getBool(_localIsLabelBoard);
    final isPosition = await _service.getBool(_localIsPositionBoard);
    final isLimit = await _service.getBool(_localIsLimitBoard);
    final isTimer = await _service.getBool(_localIsTimerBoard);
    final colorRight = await _service.getInt(_localLabelRightBoardColor);
    final colorLeft = await _service.getInt(_localLabelLeftBoardColor);
    final fieldRight = await _service.getString(_localLabelRightField);
    final fieldLeft = await _service.getString(_localLabelLeftField);
    final increment = await _service.getString(_localIncrementField);
    final limit = await _service.getString(_localLimitField);

    _setBoolInitLocal(_localIsLabelBoard, _isLabelBoard, isLabel);
    _setBoolInitLocal(_localIsPositionBoard, _isPositionBoard, isPosition);
    _setBoolInitLocal(_localIsLimitBoard, _isLimitBoard, isLimit);
    _setBoolInitLocal(_localIsTimerBoard, _isTimerBoard, isTimer);
    _setColorInitLocal(
        _localLabelRightBoardColor, _labelRightBoardColor, colorRight);
    _setColorInitLocal(
        _localLabelLeftBoardColor, _labelLeftBoardColor, colorLeft);
    _setFieldInitLocal(_localLabelRightField, _textRight, fieldRight);
    _setFieldInitLocal(_localLabelLeftField, _textLeft, fieldLeft);
  }

  void _setBoolInitLocal(String key, RxBool initValue, bool onLocal) {
    if (onLocal == null) {
      _service.setBool(key, initValue.value);
    } else {
      initValue.value = onLocal;
    }
  }

  void _setColorInitLocal(String key, Rx<Color> initValue, int onLocal) {
    if (onLocal == null) {
      _service.setInt(key, initValue.value.value);
    } else {
      initValue.value = Color(onLocal);
    }
  }

  void _setFieldInitLocal(String key, RxString initValue, String onLocal) {
    if (onLocal == null) {
      _service.setString(key, initValue.value);
    } else {
      initValue.value = onLocal;
    }
  }
}
