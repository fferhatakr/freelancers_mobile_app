import 'package:flutter/material.dart';

class TasksCard extends StatefulWidget {
  final String taskName;
  final String taskDescription;
  final String? time;
  final String? date;
  final String? status;
  final String? value;

  const TasksCard({
    required this.taskName,
    required this.taskDescription,
    this.time,
    this.date,
    this.status,
    this.value,
    super.key,
  });

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  _Status? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final status = await showModalBottomSheet<_Status>(
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
                          Navigator.pop(context, _Status.devamEdiyor);
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Beklemede'),
                        onTap: () {
                          Navigator.pop(context, _Status.beklemede);
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Tamamlandı'),
                        onTap: () {
                          Navigator.pop(context, _Status.tamamlandi);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        setState(() {
          selectedStatus = status;
        });
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
                          color: levelColor(widget.status) ?? Colors.red,
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
                        widget.taskName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.taskDescription,
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
                            color: levelColor(widget.status) ?? Colors.red,
                            size: 16,
                          ),
                        ),

                        Container(
                          width: 75,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: checkColor(selectedStatus),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                selectedStatus?.label ?? 'Belirtilmedi',
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
                          Text(widget.time ?? '19.00'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text(widget.date ?? '12 Ağustos'),
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

dynamic checkColor(_Status? status) {
  if (status == _Status.devamEdiyor) {
    return Colors.blue;
  } else if (status == _Status.beklemede) {
    return Colors.amber;
  } else if (status == _Status.tamamlandi) {
    return Colors.green;
  } else {
    return Colors.blueGrey[100];
  }
}

dynamic checkStatus(_Status status) {
  if (status == _Status.devamEdiyor) {
    return _Status.devamEdiyor;
  } else if (status == _Status.tamamlandi) {
    return _Status.tamamlandi;
  } else {
    return _Status.beklemede;
  }
}

TextStyle _statusStyle() =>
    TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

enum _Status {
  tamamlandi('Tamamlandı'),
  beklemede('Beklemede'),
  devamEdiyor('Devam Ediyor');

  final String label;
  const _Status(this.label);
}
