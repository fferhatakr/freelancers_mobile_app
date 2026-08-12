import 'package:flutter/material.dart';

class TasksProvider extends ChangeNotifier {

  final List<TasksAddProvider> _tasks = [];
  List<TasksAddProvider> get tasksItems => _tasks;

  void addTask(TasksAddProvider tasksItems) {
    _tasks.add(tasksItems);
    notifyListeners();
  }

  void removeTask(TasksAddProvider tasksItems) {
    _tasks.remove(tasksItems);
    notifyListeners();
  }
}

class TasksAddProvider {
  final String taskName;
  final String comment;
  final String? bagliMusteri;
  final String? baglantiliProje;
  final String? startDate;
  final String? endDate;
  final double? saat;
  final String? note;
  final String? levels;
  TasksAddProvider({
    required this.taskName,
    required this.comment,
    this.bagliMusteri,
    this.baglantiliProje,
    this.startDate,
    this.endDate,
    this.saat,
    this.note,
    this.levels,
  });
}


// snackCase olmalı dartta dosya adları .
// upperCase olmalı class isimleri