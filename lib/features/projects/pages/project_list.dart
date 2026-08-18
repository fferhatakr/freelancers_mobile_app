import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/projects/widgets/project_card.dart';
import 'package:freelancer_tracking_system/providers/project.dart';

class ProjectList extends StatefulWidget {
  ProjectList({super.key});
  final List<Project> allProject = ProjectProvider().value;

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final TextEditingController searchController = TextEditingController();
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
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
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
              child: ValueListenableBuilder<List<Project>>(
                valueListenable: ProjectProvider(),
                builder: (context, value, child) {
                  final displayList = searchController.text.isEmpty
                      ? value
                      : value
                            .where(
                              (p) => p.projectName.toLowerCase().contains(
                                searchController.text.toLowerCase(),
                              ),
                            )
                            .toList();
                  if (displayList.isEmpty) {
                    return Center(
                      child: Text(
                        'No result found',
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: displayList.length,
                    itemBuilder: (context, index) {
                      final project = displayList[index];
                      return Dismissible(
                        onDismissed: (direction) {
                          ProjectProvider().removeProject(items: project);
                        },
                        key: ValueKey(project.id),
                        child: ProjectCard(project: project),
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
