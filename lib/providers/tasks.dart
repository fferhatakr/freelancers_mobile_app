import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'generated/tasks.g.dart';

class TaskProvider extends ValueNotifier<List<Task>> {
  TaskProvider._sharedInstance() : super([]);
  static final TaskProvider _shared = TaskProvider._sharedInstance();
  factory TaskProvider() =>
      _shared; //Factory kullanım amacı nesne çağıırlınca ne döndürücegime ben karar veririm.

  late Box<Task> box;
  void addTasks({required Task items}) async {
    value.add(items);
    await box.add(items);
    notifyListeners();
  }

  void removeTasks({required Task items}) {
    value.remove(items);
    items.delete();
    notifyListeners();
  }

  void updateStatus({required String id, required TaskStatus taskStatus}) {
    for (var i = 0; i < value.length; i++) {
      if (value[i].id == id) {
        value[i].taskStatus = taskStatus;
        value[i].save();
        return;
      }
    }
  }

  void loadTasks() {
    value = box.values.toList();
    notifyListeners();
    return;
  }
}

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String taskName;

  @HiveField(2)
  final String comment;

  @HiveField(3)
  final String? bagliMusteri;

  @HiveField(4)
  final String? baglantiliProje;

  @HiveField(5)
  final DateTime? startDate;

  @HiveField(6)
  final DateTime? endDate;

  @HiveField(7)
  final String? saat;

  @HiveField(8)
  final String? note;

  @HiveField(9)
  final String? levels;

  @HiveField(10)
  TaskStatus? taskStatus;
  Task({
    String? id,
    required this.taskName,
    required this.comment,
    required this.bagliMusteri,
    required this.baglantiliProje,
    this.startDate,
    this.endDate,
    this.saat,
    this.note,
    this.levels,
    this.taskStatus,
  }) : id = id ?? Uuid().v4(); //v4 seçme sebebimiz rastgele dagıtım yapması
}

@HiveType(typeId: 1)
enum TaskStatus {
  @HiveField(0)
  tamamlandi('Tamamlandı'),
  @HiveField(1)
  bekliyor('Beklemede'),
  @HiveField(2)
  devamEdiyor('Devam');

  final String label;
  const TaskStatus(this.label);
}
