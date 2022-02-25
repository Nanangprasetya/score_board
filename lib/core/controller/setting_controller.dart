import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:score_board/utils/colors.dart';

class SettingController extends GetxController {
  static SettingController get to => Get.find();

  final _isLabelBoard = false.obs;
  final _isPositionBoard = false.obs;
  final _isLimitBoard = false.obs;
  final _isTimerBoard = true.obs;
  final _isColorBoard = false.obs;

  final _labelRightBoardColor = Rx<Color>(AppColors.blue);
  final _labelLeftBoardColor = Rx<Color>(AppColors.red);

  TextEditingController labelRightField = TextEditingController();
  TextEditingController labelLeftField = TextEditingController();
  TextEditingController incrementField = TextEditingController();
  TextEditingController limitField = TextEditingController();

  bool get isLabelBoard => _isLabelBoard.value;
  bool get isPositionBoard => _isPositionBoard.value;
  bool get isLimitBoard => _isLimitBoard.value;
  bool get isTimerBoard => _isTimerBoard.value;
  bool get isColorBoard => _isColorBoard.value;
  Color get labelLeftBoardColor => _labelLeftBoardColor.value;
  Color get labelRightBoardColor => _labelRightBoardColor.value;

  void setLabelBoard(bool value) => _setLabelBoard(value);
  void setPositionBoard(bool value) => _setPositionBoard(value);
  void setLimitBoard(bool value) => _setLimitBoard(value);
  void setTimerBoard(bool value) => _setTimerBoard(value);
  void setColorBoard(Color color) => _setColorBoard(color);

  @override
  void onInit() {
    _initTextField();
    super.onInit();
  }

  void _setLabelBoard(bool value) {
    _isLabelBoard.value = value;
    update();
  }

  void _setPositionBoard(bool value) {
    _isPositionBoard.value = value;
    update();
  }

  void _setLimitBoard(bool value) {
    _isLimitBoard.value = value;
    update();
  }

  void _setTimerBoard(bool value) {
    _isTimerBoard.value = value;
    update();
  }

  void _setColorBoard(Color color) {
    if (_isPositionBoard.value) {
      _labelRightBoardColor.value = color;
    } else {
      _labelLeftBoardColor.value = color;
    }
    update();
  }

  void _initTextField() {
    labelLeftField = TextEditingController(text: "A");
    labelRightField = TextEditingController(text: "B");
    incrementField = TextEditingController(text: "1");
    limitField = TextEditingController(text: "10");
  }
}
