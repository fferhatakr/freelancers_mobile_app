import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/projects/widgets/project_card.dart';
import 'package:freelancer_tracking_system/providers/project.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final TextEditingController searchController = TextEditingController();
  final List<Project> allProject = ProjectProvider().value;
  List<Project> _foundProjectName = [];
  String? status;

  @override
  void initState() {
    super.initState();
    // ekran ilk açıldığında tüm listeyi göstermek için
    _foundProjectName = ProjectProvider().value;
  }

  void _runFilter(String enteredKeyword) {
    List<Project> results = [];
    if (enteredKeyword.isEmpty) {
      results = allProject;
    } else {
      results = allProject
          .where(
            (project) => project.projectName.toLowerCase().contains(
              enteredKeyword.toLowerCase(),
            ),
          )
          .toList();
    }
    setState(() {
      _foundProjectName = results;
    });
  }

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
              onChanged: (value) {
                _runFilter(value);
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
              child: _foundProjectName.isNotEmpty
                  ? ValueListenableBuilder(
                      valueListenable: ProjectProvider(),
                      builder: (context, allProject, child) {
                        return ListView.builder(
                          itemCount: _foundProjectName.length,
                          itemBuilder: (context, index) {
                            final project = _foundProjectName[index];
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
                    )
                  : Center(
                      child: const Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
