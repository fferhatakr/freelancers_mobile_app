import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';

class WatchProvider extends ValueNotifier {
  WatchProvider._sharedInstance() : super([]);
  static final WatchProvider _shared = WatchProvider._sharedInstance();
  factory WatchProvider() => _shared;

  Stopwatch stopWatch = Stopwatch();
  Timer? t;

  void start() {
    if (stopWatch.isRunning == false) {
      stopWatch.start();
    }
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      notifyListeners();
    });
  }

  void stop() {
    if (stopWatch.isRunning == true) {
      stopWatch.stop();
      t?.cancel();
    }
    notifyListeners();
  }

  void reset() {
    stopWatch.stop();
    t?.cancel();
    t = null;
    stopWatch.reset();
    notifyListeners();
  }

  String get formattedText {
    var milli = stopWatch.elapsed.inMilliseconds;
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    String hours = (((milli ~/ 1000) ~/ 60) ~/ 60).toString().padLeft(2, "0");

    return "$hours:$minutes:$seconds";
  }
}
