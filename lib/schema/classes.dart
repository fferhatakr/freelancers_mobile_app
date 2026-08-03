void main() {
  final user1 = Client(
    '1',
    'Company A',
    email: 'Acompany@gmail.com',
    phone: '+90 555 555 55 55',
  );
  final user2 = Client(
    '2',
    'Company B',
    email: 'Bcompany@gmail.com',
    phone: '+90 444 444 44 44',
  );
  final user3 = Client(
    '3',
    'Company C',
    email: 'Ccompayny@gmail.com',
    phone: '+90 544 123 1414',
  );

  final project1 = Project(
    '1',
    '3',
    'Project1',
    Status.completed,
    RateType.fixed,
    100,
  );
  final project2 = Project(
    '2',
    '2',
    'Project2',
    Status.pending,
    RateType.hourly,
    200,
  );
  final project3 = Project(
    '3',
    '1',
    'Project3',
    Status.pending,
    RateType.fixed,
    50,
  );
  final task1 = Task('1', '1', 'Revize Yap', true, priority: Priority.low);
  final task2 = Task('2', '3', '3 Buton Ekle', false, priority: Priority.high);
  final task3 = Task('3', '2', 'Teslim Tarihi Geldi Teslim et', false);

  final timeEntry1 = TimeEntry(
    '1',
    '1',
    DateTime(2025, 1, 1),
    endTime: DateTime(2026, 2, 2),
  );
  final timeEntry2 = TimeEntry(
    '2',
    '3',
    DateTime(2025, 8, 9),
    endTime: DateTime(2026, 1, 1),
  );
  final timeEntry3 = TimeEntry('3', '2', DateTime.now(), endTime: null);
  print(user1.name);
  print(project3.rateType);
  print(task2.priority);
  print(timeEntry3.startTime);
}

enum Status { completed, pending }

enum RateType { fixed, hourly }

enum Priority { low, medium, high }

class Client {
  late final String id;
  late final String name;
  late final String? email;
  late final String? phone;

  Client(this.id, this.name, {this.email, this.phone});
}

class Project {
  late final String id; //Benzersiz Kimlik
  late final String clientId; //Bagli oldugu müşteri.
  late String title; // Proje adi
  late Status status; //Tamamlandi/Beklemede vb.
  late RateType rateType; //Fixed or Hourly
  late double rateAmount; // Sabit ücret veya saatlik ücret.

  Project(
    this.id,
    this.clientId,
    this.title,
    this.status,
    this.rateType,
    this.rateAmount,
  );
}

class Task {
  late final String id; // Benzersiz kimlik
  late final String projectId; // Bağli oldugu proje
  late final String taskName; // Görev adi
  late bool isDone; // tamamlandı mı?
  late Priority? priority; //low / medium / high

  Task(this.id, this.projectId, this.taskName, this.isDone, {this.priority});
}

class TimeEntry {
  late final String id; // Kimlik
  late final String taskId; //Bagli oldugu görev
  late DateTime startTime; // Başlangiç zamani otomatik çekilebilir.
  late DateTime? endTime; // Devam ediyorsa null

  TimeEntry(this.id, this.taskId, this.startTime, {this.endTime});
}
