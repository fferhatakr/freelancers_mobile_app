import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/localization/task_strings.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_spacing.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/padding_sizes.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';
import 'package:freelancer_tracking_system/providers/watch_record.dart';
import 'package:freelancer_tracking_system/core/utils/date_formatter.dart';

class TasksCard extends StatefulWidget {
  final Task task;

  const TasksCard({required this.task, super.key});

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: WatchRecord(),
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.all(AppPadding.p10),
          child: InkWell(
            onTap: () async {
              final taskStatus = await showModalBottomSheet<TaskStatus>(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: AppSizes.size300,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                          Card(
                            color: AppColors.surfaceBlueGreyLight,
                            child: ListTile(
                              title: Text(TaskStrings.onGoing),
                              onTap: () {
                                Navigator.pop(context, TaskStatus.devamEdiyor);
                              },
                            ),
                          ),
                          Card(
                            color: AppColors.surfaceBlueGreyLight,
                            child: ListTile(
                              title: Text(TaskStrings.pending),
                              onTap: () {
                                Navigator.pop(context, TaskStatus.bekliyor);
                              },
                            ),
                          ),
                          Card(
                            color: AppColors.surfaceBlueGreyLight,
                            child: ListTile(
                              title: Text(TaskStrings.completed),
                              onTap: () {
                                Navigator.pop(context, TaskStatus.tamamlandi);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );

              if (taskStatus != null) {
                TaskProvider().updateStatus(
                  id: widget.task.id,
                  taskStatus: taskStatus,
                );
              }
            },
            child: Card(
              color: AppColors.surfaceBlueGreyLight,
              shape: _cardShape(),
              child: Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: Column(
                  spacing: AppSpacing.lg,
                  children: [
                    Row(
                      spacing: AppSpacing.sm,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.task.taskName,
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: AppSizes.size16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: AppSizes.size4),
                            Text(
                              widget.task.bagliMusteri ??
                                  TaskStrings.selectCustomer,
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: AppSizes.size14,
                              ),
                            ),
                            Text(
                              widget.task.baglantiliProje ??
                                  TaskStrings.noSelectedProject,
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: AppSizes.size14,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            spacing: AppSpacing.sm,
                            children: [
                              Container(
                                width: AppSizes.size80,
                                height: AppSizes.size36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.r10),
                                  ),
                                  color: AppColors.greyLight,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    spacing: AppSpacing.xs,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Zorluk',
                                        style: TextStyle(
                                          color: AppColors.realBlack,
                                        ),
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color:
                                            levelColor(
                                              widget.task.taskStatus.toString(),
                                            ) ??
                                            AppColors.red,
                                        size: AppSizes.size16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Container(
                                width: AppSizes.size80,
                                height: AppSizes.size32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppRadius.r10),
                                  ),
                                  color: checkColor(
                                    widget.task.taskStatus.toString(),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Text(
                                      widget.task.taskStatus?.label
                                              .toString() ??
                                          TaskStrings.noSelected,
                                      style: _statusStyle(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: AppSizes.size200,
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                Text(
                                  'Toplam Süre: ${WatchRecord().formatDuration(WatchRecord().getDurationById(widget.task.id))}',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppSizes.size108,
                            child: Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Text(' ${toFormat(widget.task.startDate)}'),
                              ],
                            ),
                          ),
                        ],
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
  }

  RoundedRectangleBorder _cardShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.r20)),
    );
  }
}

enum Levels { kolay, orta, zor }

dynamic levelColor(String? status) {
  if (status == Levels.zor.toString()) {
    return Color.fromRGBO(255, 69, 69, 1);
  } else if (status == Levels.orta.toString()) {
    return Color.fromRGBO(255, 153, 0, 1);
  } else if (status == Levels.kolay.toString()) {
    return Color.fromRGBO(76, 175, 80, 1);
  }
}

dynamic checkColor(String? status) {
  if (status == TaskStatus.devamEdiyor.toString()) {
    return Colors.blue;
  } else if (status == TaskStatus.bekliyor.toString()) {
    return Colors.amber;
  } else if (status == TaskStatus.tamamlandi.toString()) {
    return Colors.green;
  } else {
    return Colors.blueGrey[100];
  }
}

dynamic checkStatus(TaskStatus status) {
  if (status == TaskStatus.devamEdiyor) {
    return TaskStatus.devamEdiyor;
  } else if (status == TaskStatus.tamamlandi) {
    return TaskStatus.tamamlandi;
  } else {
    return TaskStatus.bekliyor;
  }
}

TextStyle _statusStyle() => TextStyle(
  fontSize: AppSizes.size12,
  fontWeight: FontWeight.bold,
  color: AppColors.black,
);
