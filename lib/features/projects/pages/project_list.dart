import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/projects/widgets/project_card.dart';
import 'package:freelancer_tracking_system/providers/project.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  String? status;
  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: ProjectProvider(),
                builder: (context, projectItems, child) {
                  return ListView.builder(
                    itemCount: projectItems.length,
                    itemBuilder: (context, index) {
                      final projectadd = projectItems[index];

                      return Dismissible(
                        onDismissed: (direction) {
                          ProjectProvider().removeProject(items: projectadd);
                        },
                        key: ValueKey(projectadd.id),
                        child: ProjectCard(title: projectadd.projectName),
                      );
                    },
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
