import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProjectProvider extends ValueNotifier<List<Project>> {
  ProjectProvider._sharedInstance() : super([]);
  static final ProjectProvider _shared = ProjectProvider._sharedInstance();
  factory ProjectProvider() => _shared;

  void addProject({required Project items}) {
    value.add(items);
    notifyListeners();
  }

  void removeProject({required Project items}) {
    value.remove(items);
    notifyListeners();
  }
}

class Project {
  final String id;
  final String projectName;
  final String musteriName;
  final String? aciklama;
  final String? startDate;
  final String? endDate;
  final double? projectAmount;
  final String? status;
  final String? oncelik;
  final String? nots;
  Project({
    required this.projectName,
    required this.musteriName,
    this.aciklama,
    this.startDate,
    this.endDate,
    this.projectAmount,
    this.status,
    this.oncelik,
    this.nots,
  }) : id = const Uuid().v4();
}
