import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'generated/project.g.dart';

class ProjectProvider extends ValueNotifier<List<Project>> {
  ProjectProvider._sharedInstance() : super([]);
  static final ProjectProvider _shared = ProjectProvider._sharedInstance();
  factory ProjectProvider() => _shared;
  late Box<Project> box;
  String selectedTime = Time.haftalik.label;
  void addProject({required Project items}) {
    value.add(items);
    box.add(items);
    notifyListeners();
  }

  void removeProject({required Project items}) {
    value.remove(items);
    items.delete();
    notifyListeners();
  }

  void updateStatus({
    required String id,
    required ProjectStatus status,
    required DateTime date,
    required double money,
  }) {
    for (var i = 0; i < value.length; i++) {
      if (value[i].id == id) {
        value[i].status = status;
        value[i].dateTime = date;
        value[i].projectAmount = money;
        value[i].save();
        notifyListeners();
        return;
      }
    }
  }

  void updateTime(String value) {
    selectedTime = value;
    notifyListeners();
  }

  void loadProject() {
    value = box.values.toList();
    notifyListeners();
    return;
  }

  List<String> get completedProject {
    List<String> result = [];
    for (var p in value) {
      bool alreadyExists = false;
      if (p.status == ProjectStatus.tamamlandi) {
        for (int i = 0; i < result.length; i++) {
          if (result[i] == p.projectName) {
            alreadyExists = true;
            break;
          }
        }
        if (!alreadyExists) {
          result.add(p.projectName);
        }
      }
    }
    return result;
  }

  List<int> get completedProjectAmount {
    List<int> result = [];
    for (var p in value) {
      bool already = false;
      if (p.status == ProjectStatus.tamamlandi) {
        for (int i = 0; i < result.length; i++) {
          if (result[i] == p.projectAmount) {
            already = true;
            break;
          }
        }
        if (!already) {
          result.add(p.projectAmount.toInt());
        }
      }
    }
    return result;
  }

  int get totalMoney {
    int totalMoney = 0;
    for (int i = 0; i < completedProjectAmount.length; i++) {
      totalMoney = completedProjectAmount[i] + totalMoney;
    }

    return totalMoney;
  }

  dynamic calCompletedAmounts() {
    int toplam = 0;
    for (int i = 0; i < ProjectProvider().completedProjectAmount.length; i++) {
      toplam = toplam + i;
    }
    return toplam;
  }

  List<int> get pendingAndOngoingProject {
    List<int> resulta = [];
    for (var p in value) {
      if (p.status == ProjectStatus.bekliyor ||
          p.status == ProjectStatus.devamEdiyor) {
        bool already = false;
        for (int i = 0; i < resulta.length; i++) {
          if (resulta[i].toString() == p.projectName) {
            already = true;
            break;
          }
        }
        if (!already) {
          resulta.add(p.projectAmount.toInt());
        }
      }
    }
    return resulta;
  }

  List<double> weeklyResultChart() {
    List<Project> allProject = ProjectProvider().value;
    List<double> result = [0, 0, 0, 0, 0, 0, 0];

    for (int i = 0; i < allProject.length; i++) {
      if (allProject[i].status == ProjectStatus.tamamlandi) {
        if (allProject[i].dateTime != null) {
          int day = allProject[i].dateTime!.weekday - 1;
          result[day] += allProject[i].projectAmount;
        }
      }
    }
    notifyListeners();
    return result;
  }

  double get weeklyGrowthPercentage {
    List<Project> allProject = ProjectProvider().value;
    DateTime today = DateTime.now();
    Duration periodLength = Duration(days: 7);
    double currentWeekTotal = 0;
    double previousWeekTotal = 0;
    for (int i = 0; i < allProject.length; i++) {
      if (allProject[i].status == ProjectStatus.tamamlandi) {
        if (allProject[i].dateTime != null) {
          if (allProject[i].dateTime!.isBefore(today.subtract(periodLength))) {
            previousWeekTotal += allProject[i].projectAmount;
          } else {
            currentWeekTotal += allProject[i].projectAmount;
          }
        }
      }
    }
    if (previousWeekTotal == 0) return 0;

    return ((currentWeekTotal - previousWeekTotal) / previousWeekTotal) * 100;
  }

  double get last30DaysGrowthPercentage {
    List<Project> allProject = ProjectProvider().value;
    DateTime today = DateTime.now();
    Duration periodLength = Duration(days: 30);
    double currentPeriodTotal = 0;
    double previousPeriodTotal = 0;
    for (int i = 0; i < allProject.length; i++) {
      if (allProject[i].status == ProjectStatus.tamamlandi) {
        if (allProject[i].dateTime != null) {
          if (allProject[i].dateTime!.isBefore(today.subtract(periodLength))) {
            previousPeriodTotal += allProject[i].projectAmount;
          } else {
            currentPeriodTotal += allProject[i].projectAmount;
          }
        }
      }
    }
    if (previousPeriodTotal == 0) return 0;

    return ((currentPeriodTotal - previousPeriodTotal) / previousPeriodTotal) *
        100;
  }

  double get yearlyGrowthPercentage {
    List<Project> allProject = ProjectProvider().value;
    DateTime today = DateTime.now();
    Duration periodLength = Duration(days: 365);
    double currentYearTotal = 0;
    double previousYearTotal = 0;
    for (int i = 0; i < allProject.length; i++) {
      if (allProject[i].status == ProjectStatus.tamamlandi) {
        if (allProject[i].dateTime != null) {
          if (allProject[i].dateTime!.isBefore(today.subtract(periodLength))) {
            previousYearTotal += allProject[i].projectAmount;
          } else {
            currentYearTotal += allProject[i].projectAmount;
          }
        }
      }
    }
    if (previousYearTotal == 0) return 0;

    return ((currentYearTotal - previousYearTotal) / previousYearTotal) * 100;
  }

  List<double> monthResultChart() {
    List<Project> allProject = ProjectProvider().value;
    List<double> result = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    for (int i = 0; i < allProject.length; i++) {
      if (allProject[i].status == ProjectStatus.tamamlandi) {
        if (allProject[i].dateTime != null) {
          int month = allProject[i].dateTime!.month - 8;
          result[month] += allProject[i].projectAmount;
        }
      }
    }
    notifyListeners();
    return result;
  }

  List<double> yearResultChart() {
    List<Project> allProject = ProjectProvider().value;
    List<double> result = [0, 0, 0, 0, 0, 0, 0];

    for (int i = 0; i < allProject.length; i++) {
      if (allProject[i].status == ProjectStatus.tamamlandi) {
        if (allProject[i].dateTime != null) {
          int year = allProject[i].dateTime!.year - 2026;
          result[year] += allProject[i].projectAmount;
        }
      }
    }
    notifyListeners();
    return result;
  }

  dynamic calPendingAndOngoing() {
    int result = 0;
    for (
      int i = 0;
      i < ProjectProvider().pendingAndOngoingProject.length;
      i++
    ) {
      result = result + ProjectProvider().pendingAndOngoingProject[i];
    }
    return result;
  }
}

@HiveType(typeId: 3)
class Project extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String projectName;
  @HiveField(2)
  final String? selectedCustomer;
  @HiveField(3)
  final String? aciklama;
  @HiveField(4)
  final String? startDate;
  @HiveField(5)
  final String? endDate;
  @HiveField(6)
  double projectAmount;
  @HiveField(7)
  DateTime? dateTime;
  @HiveField(8)
  ProjectStatus? status;
  @HiveField(9)
  final String? oncelik;
  @HiveField(10)
  final String? nots;
  Project({
    required this.projectName,
    this.selectedCustomer,
    this.aciklama,
    this.startDate,
    this.endDate,
    required this.projectAmount,
    this.status,
    this.oncelik,
    this.nots,
    this.dateTime,
  }) : id = const Uuid().v4();
}

@HiveType(typeId: 4)
enum ProjectStatus {
  @HiveField(0)
  tamamlandi('Tamamlandı'),
  @HiveField(1)
  bekliyor('Beklemede'),
  @HiveField(2)
  devamEdiyor('Devam Ediyor');

  final String label;
  const ProjectStatus(this.label);
}

enum Time {
  haftalik('Haftalık'),
  aylik('Aylık'),
  yillik('Yıllık');

  final String label;
  const Time(this.label);
}
