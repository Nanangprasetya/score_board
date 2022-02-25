import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:score_board/main.dart';

abstract class Environment {
  static Environment value;
  String baseApi;
  int delay;
  bool debug;
  bool printResponse;
  String appVersion;

  Environment() {
    value = this;
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
        .then((_) {
      runApp(new MainApp());
    });
  }

  String get name => runtimeType.toString();

  @override
  String toString() {
    return '$name {appVersion: $appVersion, apiUrl: $baseApi, delay: $delay, debug: $debug}';
  }
}
