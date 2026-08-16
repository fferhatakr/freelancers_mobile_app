import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/tasks/widgets/task_card.dart';
import 'package:uuid/uuid.dart';

class TaskProvider extends ValueNotifier<List<Task>> {
  TaskProvider._sharedInstance() : super([]);
  static final TaskProvider _shared = TaskProvider._sharedInstance();
  factory TaskProvider() =>
      _shared; //Factory kullanım amacı nesne çağıırlınca ne döndürücegime ben karar veririm.

  void addTasks({required Task items}) {
    value.add(items);
    notifyListeners();
  }

  void removeTasks({required Task items}) {
    value.remove(items);
    notifyListeners();
  }

  void updateStatus({required String id, required TaskStatus taskStatus}) {
    for (var i = 0; i < value.length; i++) {
      if (value[i].id == id) {
        value[i].taskStatus = taskStatus;
        notifyListeners();
        return;
      }
    }
  }
}

class Task {
  final String id;
  final String taskName;
  final String comment;
  final String? bagliMusteri;
  final String? baglantiliProje;
  final String? startDate;
  final String? endDate;
  final String? saat;
  final String? note;
  final String? levels;
  TaskStatus? taskStatus;
  Task({
    required this.taskName,
    required this.comment,
    this.bagliMusteri,
    this.baglantiliProje,
    this.startDate,
    this.endDate,
    this.saat,
    this.note,
    this.levels,
    this.taskStatus,
  }) : id = const Uuid().v4(); //v4 seçme sebebimiz rastgele dagıtım yapması
}
