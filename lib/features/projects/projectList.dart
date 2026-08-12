import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/projects/widgets/projectListWidget.dart';
import 'package:freelancer_tracking_system/provider/project_provider.dart';
import 'package:provider/provider.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    final items = context.watch<ProjectProvider>().projectItems;
    final int totalProject = items.length;

    return Scaffold(
      appBar: AppBar(title: Text('Proje Listesi')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              maxLength: 30,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Hızlı Bul',
                hintText: 'Örnek:Ferhat Akar',
                hintStyle: TextStyle(color: Colors.grey),
                prefix: Icon(Icons.search),
              ),
            ),
            Text('Toplam Proje: $totalProject', style: TextStyle(fontSize: 16)),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  print('Okundu');
                  final projectAdd = items[index];
                  return ProjectCard(title: projectAdd.projectName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
