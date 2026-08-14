import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/features/tasks/page/task_add.dart';
import 'package:freelancer_tracking_system/features/tasks/widgets/task_card.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final List<Task> taskAll = TaskProvider().value;
  List<Task> _foundTask = [];

  @override
  void initState() {
    super.initState();
    _foundTask = TaskProvider().value;
  }

  void _runFilter(String enteredKeyword) {
    List<Task> result = [];
    if (enteredKeyword.isEmpty) {
      result = taskAll;
    } else {
      result = taskAll
          .where(
            (task) => task.taskName.toLowerCase().contains(
              enteredKeyword.toLowerCase(),
            ),
          )
          .toList();
    }
    setState(() {
      _foundTask = result;
    });
  }

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
                  AppNavigation.navigateTo(context, TasksAdd());
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
            TextField(
              onChanged: (value) {
                _runFilter(value);
              },
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Görev Ara',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: _foundTask.isNotEmpty
                  ? ValueListenableBuilder(
                      valueListenable: TaskProvider(),
                      builder: (context, taskAll, child) {
                        return ListView.builder(
                          itemCount: _foundTask.length,
                          itemBuilder: (context, index) {
                            final task = taskAll[index];
                            return Dismissible(
                              onDismissed: (direction) {
                                TaskProvider().removeTasks(items: task);
                              },
                              key: ValueKey(task.id),
                              child: TasksCard(
                                taskName: task.taskName,
                                taskDescription: task.comment,
                                time: task.saat,
                                date: task.startDate,
                                status: task.levels,
                              ),
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
