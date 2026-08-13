import 'package:flutter/material.dart';

import 'package:freelancer_tracking_system/features/tasks/widgets/task_add.dart';
import 'package:freelancer_tracking_system/providers/client.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';

class TasksAdd extends StatefulWidget {
  const TasksAdd({super.key});

  @override
  State<TasksAdd> createState() => _TasksAddState();
}

final tasksNameController = TextEditingController();
final commentController = TextEditingController();
final noteController = TextEditingController();

class _TasksAddState extends State<TasksAdd> {
  Customer? selectedCustomer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 33, 18),
        title: Text('Görev Ekle', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskAdd(
                controller: tasksNameController,
                icon: Icons.add_task_outlined,
                title: 'Görev İsmi',
                subtitle: 'Görev Adını Giriniz',
              ),
              TaskAdd(
                controller: commentController,
                icon: Icons.article,
                title: 'Açıklama',
                subtitle: 'Açıklama Ekle',
              ),
              SelectionTask(
                icon2: Icons.person_2_outlined,
                title2: 'Bağlantılı Müşteri',
                subtitle2: selectedCustomer?.adSoyad ?? 'Müşteri Seç',
                onTap: () {},
              ),
              SelectionTask(
                icon2: Icons.search,
                title2: 'Bağlantılı Proje',
                subtitle2: 'Mobile App',
                onTap: () {},
              ),

              SelectionTask(
                icon2: Icons.calendar_month,
                title2: 'Başlangıç Tarihi',
                subtitle2: '12 Ağustos 2026',
                onTap: () {},
              ),
              SelectionTask(
                icon2: Icons.calendar_month,
                title2: 'Bitiş Tarihi',
                subtitle2: 'Tarih Seç',
                onTap: () {},
              ),
              SelectionTask(
                icon2: Icons.watch_later_outlined,
                title2: 'Kaç Saat Sürücek?',
                subtitle2: 'Saat Belirle',
                onTap: () {},
              ),
              TaskAdd(
                controller: noteController,
                icon: Icons.note_add,
                title: 'Not ekleyin',
                subtitle: 'Görev Notlarını ekleyin',
              ),
              SelectionTask(
                icon2: Icons.flag,
                title2: 'Zorluk',
                subtitle2: 'Basit/Orta/Zor',
                onTap: () {},
              ),

              ElevatedButton(
                onPressed: () {
                  final task = Task(
                    taskName: tasksNameController.text,
                    comment: commentController.text,
                  );
                  TaskProvider().addTasks(items: task);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save, color: Color.fromARGB(255, 245, 33, 18)),
                    Text(
                      'Kaydedildi',
                      style: TextStyle(color: Color.fromARGB(255, 245, 33, 18)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
