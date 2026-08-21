import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'watch_record.g.dart';

class WatchRecord extends ChangeNotifier {
  WatchRecord._sharedInstance();
  static final WatchRecord _shared = WatchRecord._sharedInstance();
  factory WatchRecord() => _shared;

  List<Watch> totalRecord = [];
  late Box<Watch> box;

  void addTotalRecord(String id, int duration) {
    int foundIndex = -1;

    for (int i = 0; i < totalRecord.length; i++) {
      if (totalRecord[i].id == id) {
        foundIndex = i;
        break;
      }
    }
    if (foundIndex != -1) {
      totalRecord[foundIndex].duration =
          totalRecord[foundIndex].duration + duration;
      totalRecord[foundIndex].save();
    } else {
      final news = Watch(id: id, duration: duration);
      totalRecord.add(news);
      box.add(news);
    }
    notifyListeners();
  }

  void loadWatch() {
    totalRecord = box.values.toList();
    print(
      'Hive box uzunluğu: ${box.length}, yüklenen kayıt sayısı: ${totalRecord.length}',
    );

    notifyListeners();
    return;
  }

  int getDurationById(String id) {
    print(
      'Tüm kayıtlar: ${totalRecord.map((w) => "${w.id}: ${w.duration}ms").toList()}',
    );

    for (int i = 0; i < totalRecord.length; i++) {
      if (totalRecord[i].id == id) {
        return totalRecord[i].duration;
      }
    }
    return 0;
  }

  String formatDuration(int duration) {
    var milli = duration;
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    String hours = (((milli ~/ 1000) ~/ 60) ~/ 60).toString().padLeft(2, "0");

    return "$hours:$minutes:$seconds";
  }
}

@HiveType(typeId: 7)
class Watch extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  int duration;

  Watch({required this.id, required this.duration});
}
