// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProjectProvider extends ChangeNotifier {
  final List<ProjectAddProvier> _project = [];

  List<ProjectAddProvier> get projectItems => _project;

  void addProject(ProjectAddProvier projectItems) {
    _project.add(projectItems);
    notifyListeners();
  }

  void removeProject(ProjectAddProvier projectItems) {
    _project.remove(projectItems);
    notifyListeners();
  }
}

class ProjectAddProvier {
  final String projectName;
  final String? musteriName;
  final String? aciklama;
  final String? startDate;
  final String? endDate;
  final double? projectAmount;
  final String? status;
  final String? oncelik;
  final String? nots;
  ProjectAddProvier({
    required this.projectName,
    this.musteriName,
    this.aciklama,
    this.startDate,
    this.endDate,
    this.projectAmount,
    this.status,
    this.oncelik,
    this.nots,
  });
}
