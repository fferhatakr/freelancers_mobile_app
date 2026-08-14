import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/projects/widgets/project_card.dart';
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
  final String? selectedCustomer;
  final String? aciklama;
  final String? startDate;
  final String? endDate;
  final double? projectAmount;
  Status? status;
  final String? oncelik;
  final String? nots;
  Project({
    required this.projectName,
    this.selectedCustomer,
    this.aciklama,
    this.startDate,
    this.endDate,
    this.projectAmount,
    this.status,
    this.oncelik,
    this.nots,
  }) : id = const Uuid().v4();
}
