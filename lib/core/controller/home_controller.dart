import 'package:get/get.dart';
class HomeController extends GetxController {

  final _isEditScore = false.obs;

  /// Get value Switch [EDIT SCORE] default is [false].
  bool get isEditScore => _isEditScore.value;

  /// Set edit Score required boolean.
  void setIsEditScore(bool value) => _setEditScore(value);

  void _setEditScore(bool value) {
    _isEditScore.value = value;
  }
}
