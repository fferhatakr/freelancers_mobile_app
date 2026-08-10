import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/tasks/widgets/taskAddWidget.dart';

class TasksAddPage extends StatelessWidget {
  const TasksAddPage({super.key});

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
                icon: Icons.add_task_outlined,
                title: 'Görev İsmi',
                subtitle: 'Görev Adını Giriniz',
              ),
              TaskAdd(
                icon: Icons.article,
                title: 'Açıklama',
                subtitle: 'Açıklama Ekle',
              ),
              tasksecmeContanier(
                icon2: Icons.person_2_outlined,
                title2: 'Bağlantılı Müşteri',
                subtitle2: 'Ferhat Akar',
                onTap: () {
                  print('object');
                },
              ),
              tasksecmeContanier(
                icon2: Icons.search,
                title2: 'Bağlantılı Proje',
                subtitle2: 'Mobile App',
                onTap: () {
                  print('object');
                },
              ),

              tasksecmeContanier(
                icon2: Icons.calendar_month,
                title2: 'Başlangıç Tarihi',
                subtitle2: '12 Ağustos 2026',
                onTap: () {
                  print('object');
                },
              ),
              tasksecmeContanier(
                icon2: Icons.calendar_month,
                title2: 'Bitiş Tarihi',
                subtitle2: 'Tarih Seç',
                onTap: () {
                  print('object');
                },
              ),
              tasksecmeContanier(
                icon2: Icons.watch_later_outlined,
                title2: 'Kaç Saat Sürücek?',
                subtitle2: 'Saat Belirle',
                onTap: () {
                  print('object');
                },
              ),
              TaskAdd(
                icon: Icons.note_add,
                title: 'Not ekleyin',
                subtitle: 'Görev Notlarını ekleyin',
              ),
              tasksecmeContanier(
                icon2: Icons.flag,
                title2: 'Zorluk',
                subtitle2: 'Basit/Orta/Zor',
                onTap: () {
                  print('object');
                },
              ),

              ElevatedButton(
                onPressed: () {
                  print('Eklendi');
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
