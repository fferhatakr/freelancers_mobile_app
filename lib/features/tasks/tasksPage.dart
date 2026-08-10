import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/features/tasks/tasksAddPage.dart';
import 'package:freelancer_tracking_system/features/tasks/widgets/resultTaskWidget.dart';
import 'package:freelancer_tracking_system/features/tasks/widgets/tasks.dart';

class TasksPage extends StatelessWidget {
  TasksPage({super.key});

  static List<Map<String, String>> dummyTasks = [
    {
      'taskName': 'App',
      'taskDescription': 'Mobile Uygulamaya',
      'time': '3.42',
      'date': '3 Ekim',
      'status': 'Zor',
      'value': '100',
    },
    {
      'taskName': 'Revize',
      'taskDescription': 'Yönetim Paneline Ekleme',
      'time': '2.30',
      'date': '5 Ağustos',
      'status': 'Orta',
      'value': '60',
    },
    {
      'taskName': 'App',
      'taskDescription': 'Mobile Uygulamaya',
      'time': '3.42',
      'date': '3 Ekim',
      'status': 'Kolay',
      'value': '40',
    },
  ];
  static var filteredTasks = dummyTasks.where((task) => task['value'] == 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Görevler',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Görevleri Dilediğin Gibi Yönet',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(64)),
              ),
              child: IconButton(
                onPressed: () {
                  AppNavigation.navigateTo(context, TasksAddPage());
                },
                icon: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResultTask(),
            Expanded(
              child: ListView.builder(
                itemCount: dummyTasks.length,
                itemBuilder: (context, index) {
                  return TasksCards(
                    taskName: dummyTasks[index]['taskName']!,
                    taskDescription: dummyTasks[index]['taskDescription']!,
                    time: dummyTasks[index]['time']!,
                    date: dummyTasks[index]['date']!,
                    status: dummyTasks[index]['status']!,
                    value: dummyTasks[index]['value']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
