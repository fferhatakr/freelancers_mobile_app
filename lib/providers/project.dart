import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/projects/pages/project_list.dart';
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

  List<String> get completedProject {
    List<String> result = [];
    for (var p in value) {
      bool alreadyExists = false;
      if (p.status == Status.tamamlandi) {
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
      if (p.status == Status.tamamlandi) {
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
      if (p.status == Status.bekliyor || p.status == Status.devamEdiyor) {
        bool already = false;
        for (int i = 0; i < resulta.length; i++) {
          if (resulta[i] == p.projectName) {
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

  void updateStatus({required String id, required Status status}) {
    for (var i = 0; i < value.length; i++) {
      if (value[i].id == id) {
        value[i].status = status;
        notifyListeners();
        return;
      }
    }
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

  void seedFakeData() {
    final fakeProjects = [
      Project(
        projectName: 'E-ticaret Sitesi',
        selectedCustomer: 'Ahmet Yılmaz',
        aciklama: 'Online mağaza tasarımı',
        startDate: '01/08/2026',
        endDate: '30/09/2026',
        projectAmount: 15000,
        status: Status.devamEdiyor,
        oncelik: 'Yüksek',
      ),
      Project(
        projectName: 'Mobil Uygulama',
        selectedCustomer: 'Zeynep Kaya',
        aciklama: 'iOS ve Android uygulama',
        startDate: '15/07/2026',
        endDate: '15/10/2026',
        projectAmount: 25000,
        status: Status.bekliyor,
        oncelik: 'Orta',
      ),
      Project(
        projectName: 'Logo Tasarımı',
        selectedCustomer: 'Mehmet Demir',
        aciklama: 'Kurumsal kimlik çalışması',
        startDate: '01/06/2026',
        endDate: '10/06/2026',
        projectAmount: 3000,
        status: Status.tamamlandi,
        oncelik: 'Düşük',
      ),
      Project(
        projectName: 'Web Sitesi Yenileme',
        selectedCustomer: 'Elif Şahin',
        aciklama: 'Eski siteyi güncelleme',
        startDate: '10/08/2026',
        endDate: '25/08/2026',
        projectAmount: 8000,
        status: Status.devamEdiyor,
        oncelik: 'Yüksek',
      ),
      Project(
        projectName: 'SEO Danışmanlığı',
        selectedCustomer: 'Can Öztürk',
        aciklama: 'Arama motoru optimizasyonu',
        startDate: '05/08/2026',
        endDate: '05/11/2026',
        projectAmount: 6000,
        status: Status.bekliyor,
        oncelik: 'Orta',
      ),
      Project(
        projectName: 'Sosyal Medya Yönetimi',
        selectedCustomer: 'Ayşe Arslan',
        aciklama: 'Instagram ve Twitter içerikleri',
        startDate: '01/07/2026',
        endDate: '31/12/2026',
        projectAmount: 12000,
        status: Status.devamEdiyor,
        oncelik: 'Orta',
      ),
      Project(
        projectName: 'Muhasebe Yazılımı',
        selectedCustomer: 'Burak Aydın',
        aciklama: 'Küçük işletme için özel yazılım',
        startDate: '20/06/2026',
        endDate: '20/09/2026',
        projectAmount: 30000,
        status: Status.bekliyor,
        oncelik: 'Yüksek',
      ),
      Project(
        projectName: 'Video Düzenleme',
        selectedCustomer: 'Selin Koç',
        aciklama: 'Tanıtım filmi montajı',
        startDate: '12/08/2026',
        endDate: '20/08/2026',
        projectAmount: 4500,
        status: Status.tamamlandi,
        oncelik: 'Düşük',
      ),
      Project(
        projectName: 'API Entegrasyonu',
        selectedCustomer: 'Kerem Yıldız',
        aciklama: 'Ödeme sistemi bağlantısı',
        startDate: '01/08/2026',
        endDate: '15/08/2026',
        projectAmount: 9000,
        status: Status.devamEdiyor,
        oncelik: 'Yüksek',
      ),
      Project(
        projectName: 'Veritabanı Optimizasyonu',
        selectedCustomer: 'Deniz Aksoy',
        aciklama: 'Sorgu hızlandırma çalışması',
        startDate: '05/07/2026',
        endDate: '20/07/2026',
        projectAmount: 7000,
        status: Status.tamamlandi,
        oncelik: 'Orta',
      ),
    ];

    value.addAll(fakeProjects);
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
  final double projectAmount;
  final DateTime? dateTime;
  Status? status;
  final String? oncelik;
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
