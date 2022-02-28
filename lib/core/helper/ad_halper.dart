import 'dart:io';

import 'package:score_board/core/config/environment.dart';

class AdHelper {
  static String get rewardedAdUnitId {
    final _testMode = "/6499/example/rewarded";
    final _idUnitIOS = "ca-app-pub-5016731169687704/2098186740";
    final _idUnitAndroid = "ca-app-pub-5016731169687704/4444831251";

    if (Environment.value.debug) {
      return _testMode;
    } else {
      if (Platform.isAndroid) {
        return _idUnitAndroid;
      } else if (Platform.isIOS) {
        return _idUnitIOS;
      } else {
        throw new UnsupportedError('Unsupported platform');
      }
    }
  }
  static String get bannerAdUnitId {
    final _testMode = "/6499/example/banner";
    final _idUnitIOS = "PASTE_ID_UNIT_BANNER_IOS_TO_THIS";
    final _idUnitAndroid = "ca-app-pub-5016731169687704/8706460140";

    if (Environment.value.debug) {
      return _testMode;
    } else {
      if (Platform.isAndroid) {
        return _idUnitAndroid;
      } else if (Platform.isIOS) {
        return _idUnitIOS;
      } else {
        throw new UnsupportedError('Unsupported platform');
      }
    }
  }
}
