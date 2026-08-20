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

  void seedFakeData() {
    final fakeTasks = [
      Task(
        taskName: 'Ana Sayfa Tasarımı',
        comment: 'Figma üzerinden mockup hazırlanacak',
        bagliMusteri: 'Ahmet Yılmaz',
        baglantiliProje: 'E-ticaret Sitesi',
        startDate: DateTime(2026, 8, 1),
        endDate: DateTime(2026, 8, 5),
        saat: '8',
        levels: 'Kolay',
        taskStatus: TaskStatus.devamEdiyor,
      ),
      Task(
        taskName: 'Login Ekranı Kodlama',
        comment: 'Firebase auth entegrasyonu',
        bagliMusteri: 'Zeynep Kaya',
        baglantiliProje: 'Mobil Uygulama',
        startDate: DateTime(2026, 7, 16),
        endDate: DateTime(2026, 7, 20),
        saat: '12',
        levels: 'Orta',
        taskStatus: TaskStatus.tamamlandi,
      ),
      Task(
        taskName: 'Logo Revizyonu',
        comment: 'Müşteri renk değişikliği istedi',
        bagliMusteri: 'Mehmet Demir',
        baglantiliProje: 'Logo Tasarımı',
        startDate: DateTime(2026, 6, 2),
        endDate: DateTime(2026, 6, 4),
        saat: '3',
        levels: 'Zor',
        taskStatus: TaskStatus.tamamlandi,
      ),
      Task(
        taskName: 'Responsive',
        comment: 'Mobil görünüm optimizasyonu',
        bagliMusteri: 'Elif Şahin',
        baglantiliProje: 'Web Sitesi Yenileme',
        startDate: DateTime(2026, 8, 11),
        endDate: DateTime(2026, 8, 15),
        saat: '6',
        levels: 'Orta',
        taskStatus: TaskStatus.bekliyor,
      ),
      Task(
        taskName: 'Anahtar Kelime Analizi',
        comment: 'Rakip site analizi de yapılacak',
        bagliMusteri: 'Can Öztürk',
        baglantiliProje: 'SEO Danışmanlığı',
        startDate: DateTime(2026, 8, 6),
        endDate: DateTime(2026, 8, 10),
        saat: '5',
        levels: 'Kolay',
        taskStatus: TaskStatus.devamEdiyor,
      ),
      Task(
        taskName: 'İçerik Takvimi',
        comment: 'Ağustos ayı planlanacak',
        bagliMusteri: 'Ayşe Arslan',
        baglantiliProje: 'Sosyal Medya Yönetimi',
        startDate: DateTime(2026, 7, 2),
        endDate: DateTime(2026, 7, 6),
        saat: '4',
        levels: 'Kolay',
        taskStatus: TaskStatus.bekliyor,
      ),
      Task(
        taskName: 'Veritabanı Şeması',
        comment: 'PostgreSQL tabloları oluşturulacak',
        bagliMusteri: 'Burak Aydın',
        baglantiliProje: 'Muhasebe Yazılımı',
        startDate: DateTime(2026, 6, 21),
        endDate: DateTime(2026, 6, 28),
        saat: '16',
        levels: 'Zor',
        taskStatus: TaskStatus.devamEdiyor,
      ),
      Task(
        taskName: 'Renk Düzeltmesi',
        comment: 'Video renk tonu ayarlanacak',
        bagliMusteri: 'Selin Koç',
        baglantiliProje: 'Video Düzenleme',
        startDate: DateTime(2026, 8, 13),
        endDate: DateTime(2026, 8, 14),
        saat: '2',
        levels: 'Kolay',
        taskStatus: TaskStatus.tamamlandi,
      ),
      Task(
        taskName: 'Ödeme Servisi Test',
        comment: 'Sandbox ortamında test edilecek',
        bagliMusteri: 'Kerem Yıldız',
        baglantiliProje: 'API Entegrasyonu',
        startDate: DateTime(2026, 8, 2),
        endDate: DateTime(2026, 8, 6),
        saat: '10',
        levels: 'Zor',
        taskStatus: TaskStatus.bekliyor,
      ),
      Task(
        taskName: 'Sorgu Performans ',
        comment: 'Yavaş sorgular tespit edilecek',
        bagliMusteri: 'Deniz Aksoy',
        baglantiliProje: 'Veritabanı Optimizasyonu',
        startDate: DateTime(2026, 7, 6),
        endDate: DateTime(2026, 7, 10),
        saat: '7',
        levels: 'Orta',
        taskStatus: TaskStatus.devamEdiyor,
      ),
    ];

    value.addAll(fakeTasks);
    notifyListeners();
  }
}

class Task {
  final String id;
  final String taskName;
  final String comment;
  final String? bagliMusteri;
  final String? baglantiliProje;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? saat;
  final String? note;
  final String? levels;
  TaskStatus? taskStatus;
  Task({
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
  }) : id = const Uuid().v4(); //v4 seçme sebebimiz rastgele dagıtım yapması
}
