import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/navigation/app_navigation.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/localization/task_strings.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';
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
            (task) => task.taskName.toLowerCase().toString().contains(
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
              TaskStrings.tasks,
              style: TextStyle(
                fontSize: AppSizes.size24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              TaskStrings.tasksSubtitle,
              style: TextStyle(fontSize: AppSizes.size14),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(AppPadding.p8),
            child: Container(
              width: AppSizes.size40,
              height: AppSizes.size40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grey,
              ),
              child: IconButton(
                onPressed: () {
                  AppNavigation.navigateTo(context, TasksAdd());
                },
                icon: Icon(Icons.add, color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                _runFilter(value);
              },
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.r10),
                ),
                hintText: TaskStrings.foundTask,
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
                            final task = _foundTask[index];
                            return Dismissible(
                              onDismissed: (direction) {
                                TaskProvider().removeTasks(items: task);
                              },
                              key: ValueKey(task.id),
                              child: TasksCard(task: task),
                            );
                          },
                        );
                      },
                    )
                  : Center(
                      child: const Text(
                        TaskStrings.foundTask,
                        style: TextStyle(fontSize: AppSizes.size24),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
