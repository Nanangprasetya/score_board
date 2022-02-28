import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  static TimerController get to => Get.find();

  Stopwatch _watch = Stopwatch();
  Timer _timer;

  final _elapsedTime = "00:00:00:00".obs;

  String get elapsedTime => _elapsedTime.value;

  void start() => _start();
  void stop() => _stop();
  void reset() => _reset();

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  void _start() {
    _watch.start();
    _timer = Timer.periodic(new Duration(milliseconds: 100), _updateTime);
    update();
  }

  void _stop() {
    _watch.stop();
    _elapsedTime.value = _getTransformMilliSeconds(_watch.elapsedMilliseconds);
    update();
  }

  void _reset() {
    _watch.reset();
    _watch.stop();
    _elapsedTime.value = _getTransformMilliSeconds(_watch.elapsedMilliseconds);
    update();
  }

  _updateTime(Timer timer) {
    if (_watch.isRunning) {
      _elapsedTime.value =
          _getTransformMilliSeconds(_watch.elapsedMilliseconds);
    }
    update();
  }

  String _getTransformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String milisecondStr = (hundreds % 60).toString().padLeft(2, '0');

    String data = "$hoursStr:$minutesStr:$secondsStr:$milisecondStr";

    return data;
  }

}
