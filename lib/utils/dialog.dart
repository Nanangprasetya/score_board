import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:score_board/utils/colors.dart';
import 'package:score_board/utils/size_config.dart';

class AppDialog {
  static GlobalKey _loadingDialogKey;

  static void hideLoading() {
    if (_loadingDialogKey == null) return;
    Get.back(result: true);
  }

  static Future<void> showLoading() async {
    _loadingDialogKey = new GlobalKey<State>();
    return Get.dialog(
      WillPopScope(
        key: _loadingDialogKey,
        onWillPop: () async => false,
        child: Material(
          color: AppColors.transparent,
          child: Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.grey.shade100.withOpacity(0.3),
                  ),
                  width: SizeConfig.heightMultiplier * 16,
                  height: SizeConfig.heightMultiplier * 16,
                  padding: EdgeInsets.all(16.0),
                  child: Theme(
                      data: ThemeData(
                        primaryColor: AppColors.white,
                        cupertinoOverrideTheme: CupertinoThemeData(
                          brightness: Brightness.dark,
                        ),
                      ),
                      child: CupertinoActivityIndicator(radius: 16)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
