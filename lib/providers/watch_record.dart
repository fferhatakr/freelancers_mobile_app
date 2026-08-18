import 'package:flutter/material.dart';

class WatchRecord extends ChangeNotifier {
  WatchRecord._sharedInstance();
  static final WatchRecord _shared = WatchRecord._sharedInstance();
  factory WatchRecord() => _shared;

  Map<String, Duration> totalRecord = {};

  void addTotalRecord(String id, Duration duration) {
    bool alreadyExisting = false;
    if (totalRecord.containsKey(id)) {
      alreadyExisting = true;
    }
    if (!alreadyExisting) {
      totalRecord.addAll({id: duration});
    } else {
      totalRecord[id] = totalRecord[id]! + duration;
    }
    notifyListeners();
  }

  String formatDuration(Duration duration) {
    var milli = duration.inMilliseconds;
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    String hours = (((milli ~/ 1000) ~/ 60) ~/ 60).toString().padLeft(2, "0");

    return "$hours:$minutes:$seconds";
  }
}

class Watch {
  final String id;
  final Duration duration;

  const Watch({required this.id, required this.duration});
}
