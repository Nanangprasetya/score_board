import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color red = Color(0xFFFF453A);
  static const Color orange = Color(0xFFFF9F0A);
  static const Color yellow = Color(0xFFFFD60A);
  static const Color green = Color(0xFF32D74B);
  static const Color tial = Color(0xFF64D2FF);
  static const Color blue = Color(0xFF0A84FF);
  static const Color indigo = Color(0xFF5E5CE6);
  static const Color purple = Color(0xFFBF5AF2);
  static const Color greenDark = Color(0xFF34C759);
  
  static const Color success = Colors.green;
  static const Color alert = Colors.orange;
  static const Color danger = Colors.red;
  static const Color black = Colors.black;
  static const Color text1 = Colors.black87;
  static const Color text2 = Colors.black54;
  static const Color text3 = Colors.black45;
  static const Color text4 = Colors.black38;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;
  static const Color disable = Color(0xFFE3E3E3);
  static const Color line = Color(0xFFDEDEDE);
  static const Color label = Color(0xFF38383A);
  static const Color keyBoard = Color(0xFFEAF8FD);
  static const Color uploadBg = Color(0xFFDFF0FD);
}

class ColorBoard {
  final int idColor;
  final Color color;

  ColorBoard({@required this.idColor, @required this.color});

  static List<ColorBoard> listColorBoard = [
    ColorBoard(
      idColor: AppColors.red.value,
      color: AppColors.red,
    ),
    ColorBoard(
      idColor: AppColors.orange.value,
      color: AppColors.orange,
    ),
    ColorBoard(
      idColor: AppColors.yellow.value,
      color: AppColors.yellow,
    ),
    ColorBoard(
      idColor: AppColors.green.value,
      color: AppColors.green,
    ),
    ColorBoard(
      idColor: AppColors.tial.value,
      color: AppColors.tial,
    ),
    ColorBoard(
      idColor: AppColors.blue.value,
      color: AppColors.blue,
    ),
    ColorBoard(
      idColor: AppColors.indigo.value,
      color: AppColors.indigo,
    ),
    ColorBoard(
      idColor: AppColors.purple.value,
      color: AppColors.purple,
    ),
  ];
}
