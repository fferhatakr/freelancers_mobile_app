import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';

class TasksCard extends StatefulWidget {
  final Task task;

  const TasksCard({required this.task, super.key});

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final taskStatus = await showModalBottomSheet<TaskStatus>(
          context: context,
          builder: (context) {
            return SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text('Devam Ediyor'),
                        onTap: () {
                          Navigator.pop(context, TaskStatus.devamEdiyor);
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Beklemede'),
                        onTap: () {
                          Navigator.pop(context, TaskStatus.bekliyor);
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Tamamlandı'),
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
        color: Colors.blueAccent[50],
        shape: _cardShape(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            children: [
              Row(
                spacing: 10,
                children: [
                  Column(
                    children: [
                      Container(
                        height: _CardFeatures.containerHeight,
                        width: _CardFeatures.containerWidht,
                        decoration: BoxDecoration(
                          color:
                              levelColor(widget.task.taskStatus.toString()) ??
                              Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Icon(
                          Icons.screenshot_monitor_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.taskName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.task.taskName,
                        style: TextStyle(
                          color: Color.fromRGBO(47, 47, 49, 1),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      spacing: 10,
                      children: [
                        Container(
                          width: 75,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blueGrey[100],
                          ),
                          child: Icon(
                            Icons.circle,
                            color:
                                levelColor(widget.task.taskStatus.toString()) ??
                                Colors.red,
                            size: 16,
                          ),
                        ),

                        Container(
                          width: 75,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: checkColor(
                              widget.task.taskStatus.toString(),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(
                                widget.task.taskStatus?.label.toString() ??
                                    'Seçilmedi',
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
                      width: 150,
                      child: Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          Text(widget.task.saat ?? 'Belirtilmedi'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text(widget.task.startDate.toString()),
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
    );
  }

  BeveledRectangleBorder _cardShape() {
    return BeveledRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    );
  }
}

class _CardFeatures {
  static double containerHeight = 48;
  static double containerWidht = 48;
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

TextStyle _statusStyle() =>
    TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

enum TaskStatus {
  tamamlandi('Tamamlandı'),
  bekliyor('Beklemede'),
  devamEdiyor('Devam Ediyor');

  final String label;
  const TaskStatus(this.label);
}
