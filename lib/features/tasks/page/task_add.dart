import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/localization/task_strings.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/core/utils/date_formatter.dart';
import 'package:freelancer_tracking_system/features/date/page/date.dart';
import 'package:freelancer_tracking_system/features/tasks/widgets/task_add.dart';
import 'package:freelancer_tracking_system/providers/client.dart';
import 'package:freelancer_tracking_system/providers/project.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';

class TasksAdd extends StatefulWidget {
  const TasksAdd({super.key});

  @override
  State<TasksAdd> createState() => _TasksAddState();
}

final tasksNameController = TextEditingController();
final commentController = TextEditingController();
final noteController = TextEditingController();
final startDate = TextEditingController();
final endDate = TextEditingController();
final watchController = TextEditingController();
final statusController = TextEditingController();

class _TasksAddState extends State<TasksAdd> {
  String? selectedCustomerName;
  String? selectedProject;
  Levels? selectedLevel;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  final SnackBar requiredFields = SnackBar(
    content: Text('Zorunlu Alanları Giriniz'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.danger,
        title: Text(
          TaskStrings.appBarTitle,
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p20),
          child: Column(
            spacing: AppSpacing.sm,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskAdd(
                maxLength: 20,
                controller: tasksNameController,
                icon: Icons.add_task_outlined,
                title: TaskStrings.taskNameTitle,
                subtitle: TaskStrings.taskNameSubtitle,
              ),

              SelectionTask(
                iconColor: AppColors.danger,
                icon: Icons.person_2_outlined,
                title: TaskStrings.customerTitle,
                subtitle:
                    selectedCustomerName ?? TaskStrings.customerSubtitleDefault,
                onTap: () async {
                  final customerName = await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) {
                      return ValueListenableBuilder(
                        valueListenable: CustomerProvider(),
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              final customer = value[index];
                              return Padding(
                                padding: _paddingSize(),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context, customer.adSoyad);
                                  },
                                  child: Card(
                                    color: AppColors.white,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        child: Icon(Icons.person_2_outlined),
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            customer.adSoyad,
                                            style: TextStyle(
                                              fontSize: AppSizes.size14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            customer.email,
                                            style: TextStyle(
                                              fontSize: AppSizes.size14,
                                            ),
                                          ),
                                          Text(
                                            customer.telefon,
                                            style: TextStyle(
                                              fontSize: AppSizes.size14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                  setState(() {
                    selectedCustomerName =
                        customerName; //yenileyerek seçtiği ismi seçilen isme yansıtıyoruz.
                  });
                },
              ),
              SelectionTask(
                iconColor: AppColors.danger,
                icon: Icons.search,
                title: TaskStrings.projectTitle,
                subtitle: selectedProject ?? TaskStrings.projectSubtitleDefault,
                onTap: () async {
                  final projectName = await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,

                        child: ValueListenableBuilder(
                          valueListenable: ProjectProvider(),
                          builder: (context, projectIndex, child) {
                            return ListView.builder(
                              itemCount: projectIndex.length,
                              itemBuilder: (context, index) {
                                final project = projectIndex[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.pop(context, project.projectName);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppSizes.size12,
                                    ),
                                    child: Card(
                                      color: AppColors.greyLight,
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: AppColors.danger,
                                          child: Icon(
                                            Icons.work,
                                            color: AppColors.white,
                                          ),
                                        ),
                                        title: Text(project.projectName),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                  setState(() {
                    selectedProject = projectName;
                  });
                },
              ),
              DatePicture(
                iconColor: AppColors.danger,
                icon: Icons.calendar_month,
                title: TaskStrings.startDateTitle,
                title2:
                    toFormat(selectedStartDate) ??
                    TaskStrings.dateSubtitleDefault,
                onDateSelected: (date) {
                  setState(() {
                    selectedStartDate = date;
                  });
                },
              ),
              DatePicture(
                iconColor: Colors.red,
                icon: Icons.calendar_month,
                title: TaskStrings.endDateTitle,
                title2:
                    toFormat(selectedEndDate) ??
                    TaskStrings.dateSubtitleDefault,
                onDateSelected: (date) {
                  setState(() {
                    selectedEndDate = date;
                  });
                },
              ),

              TaskAdd(
                maxLength: 20,
                controller: noteController,
                icon: Icons.note_add,
                title: TaskStrings.noteTitle,
                subtitle: TaskStrings.noteSubtitle,
              ),
              TaskAdd(
                maxLength: 20,
                controller: commentController,
                icon: Icons.article,
                title: TaskStrings.commentTitle,
                subtitle: TaskStrings.commentSubtitle,
              ),
              SelectionTask(
                iconColor: AppColors.red,
                icon: Icons.flag,
                title: TaskStrings.levelTitle,
                subtitle:
                    selectedLevel?.label ?? TaskStrings.levelSubtitleDefault,
                onTap: () async {
                  final level = await showModalBottomSheet<Levels>(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSizes.size300,
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text(TaskStrings.levelKolay),
                              onTap: () {
                                Navigator.pop(context, Levels.kolay);
                              },
                            ),
                            ListTile(
                              title: Text(TaskStrings.levelOrta),
                              onTap: () {
                                Navigator.pop(context, Levels.orta);
                              },
                            ),
                            ListTile(
                              title: Text(TaskStrings.levelZor),
                              onTap: () {
                                Navigator.pop(context, Levels.zor);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );

                  setState(() {
                    selectedLevel = level;
                  });
                },
              ),

              ElevatedButton(
                onPressed: () {
                  final task = Task(
                    taskName: tasksNameController.text,
                    comment: commentController.text,
                    bagliMusteri: selectedCustomerName,
                    baglantiliProje: selectedProject,
                    saat: watchController.text,
                    levels: selectedLevel.toString(),
                    startDate: selectedStartDate,
                    endDate: selectedEndDate,
                  );
                  if (tasksNameController.text.trim().isEmpty ||
                      selectedStartDate == null ||
                      selectedCustomerName == null ||
                      selectedProject == null ||
                      selectedLevel == null) {
                    ScaffoldMessenger.of(context).showSnackBar(requiredFields);
                  } else {
                    TaskProvider().addTasks(items: task);
                    Navigator.pop(context);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save, color: Colors.red),
                    Text(
                      TaskStrings.saveButton,
                      style: TextStyle(color: Colors.red),
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

  EdgeInsets _paddingSize() {
    return EdgeInsets.symmetric(horizontal: AppSizes.size12);
  }
}

enum Levels {
  kolay('Kolay'),
  orta('Orta'),
  zor('Zor');

  final String label;
  const Levels(this.label);
}
