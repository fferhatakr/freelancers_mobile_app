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
        startDate: '01/08/2026',
        endDate: '05/08/2026',
        saat: '8',
        levels: 'Orta',
        taskStatus: TaskStatus.devamEdiyor,
      ),
      Task(
        taskName: 'Login Ekranı Kodlama',
        comment: 'Firebase auth entegrasyonu',
        bagliMusteri: 'Zeynep Kaya',
        baglantiliProje: 'Mobil Uygulama',
        startDate: '16/07/2026',
        endDate: '20/07/2026',
        saat: '12',
        levels: 'Zor',
        taskStatus: TaskStatus.tamamlandi,
      ),
      Task(
        taskName: 'Logo Revizyonu',
        comment: 'Müşteri renk değişikliği istedi',
        bagliMusteri: 'Mehmet Demir',
        baglantiliProje: 'Logo Tasarımı',
        startDate: '02/06/2026',
        endDate: '04/06/2026',
        saat: '3',
        levels: 'Kolay',
        taskStatus: TaskStatus.tamamlandi,
      ),
      Task(
        taskName: 'Responsive',
        comment: 'Mobil görünüm optimizasyonu',
        bagliMusteri: 'Elif Şahin',
        baglantiliProje: 'Web Sitesi Yenileme',
        startDate: '11/08/2026',
        endDate: '15/08/2026',
        saat: '6',
        levels: 'Orta',
        taskStatus: TaskStatus.bekliyor,
      ),
      Task(
        taskName: 'Anahtar Kelime Analizi',
        comment: 'Rakip site analizi de yapılacak',
        bagliMusteri: 'Can Öztürk',
        baglantiliProje: 'SEO Danışmanlığı',
        startDate: '06/08/2026',
        endDate: '10/08/2026',
        saat: '5',
        levels: 'Kolay',
        taskStatus: TaskStatus.devamEdiyor,
      ),
      Task(
        taskName: 'İçerik Takvimi',
        comment: 'Ağustos ayı planlanacak',
        bagliMusteri: 'Ayşe Arslan',
        baglantiliProje: 'Sosyal Medya Yönetimi',
        startDate: '02/07/2026',
        endDate: '06/07/2026',
        saat: '4',
        levels: 'Kolay',
        taskStatus: TaskStatus.bekliyor,
      ),
      Task(
        taskName: 'Veritabanı Şeması',
        comment: 'PostgreSQL tabloları oluşturulacak',
        bagliMusteri: 'Burak Aydın',
        baglantiliProje: 'Muhasebe Yazılımı',
        startDate: '21/06/2026',
        endDate: '28/06/2026',
        saat: '16',
        levels: 'Zor',
        taskStatus: TaskStatus.devamEdiyor,
      ),
      Task(
        taskName: 'Renk Düzeltmesi',
        comment: 'Video renk tonu ayarlanacak',
        bagliMusteri: 'Selin Koç',
        baglantiliProje: 'Video Düzenleme',
        startDate: '13/08/2026',
        endDate: '14/08/2026',
        saat: '2',
        levels: 'Kolay',
        taskStatus: TaskStatus.tamamlandi,
      ),
      Task(
        taskName: 'Ödeme Servisi Test',
        comment: 'Sandbox ortamında test edilecek',
        bagliMusteri: 'Kerem Yıldız',
        baglantiliProje: 'API Entegrasyonu',
        startDate: '02/08/2026',
        endDate: '06/08/2026',
        saat: '10',
        levels: 'Zor',
        taskStatus: TaskStatus.bekliyor,
      ),
      Task(
        taskName: 'Sorgu Performans ',
        comment: 'Yavaş sorgular tespit edilecek',
        bagliMusteri: 'Deniz Aksoy',
        baglantiliProje: 'Veritabanı Optimizasyonu',
        startDate: '06/07/2026',
        endDate: '10/07/2026',
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
