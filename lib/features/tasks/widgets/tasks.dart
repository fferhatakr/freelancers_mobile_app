import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_style.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';

class TasksCards extends StatelessWidget {
  final String taskName;
  final String taskDescription;
  final String time;

  const TasksCards({
    required this.taskName,
    required this.taskDescription,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _CardFeatures.height,
      child: SizedBox(
        height: 100,
        child: Card(
          color: ActiveProjectStyle.activeProjectCardColor,
          shape: _cardShape(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: _CardFeatures.containerHeight,
                      width: _CardFeatures.containerWidht,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(212, 167, 44, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Icon(
                        Icons.screenshot_monitor_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskName,
                      style: TextStyle(
                        color: _CardFeatures.textColor,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.work_outline,
                          color: Color.fromRGBO(142, 147, 155, 1),
                        ),
                        SizedBox(width: 5),
                        Text(
                          taskDescription,
                          style: TextStyle(
                            color: Color.fromRGBO(142, 147, 155, 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 120,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(212, 167, 44, 1),
                      ),
                      child: Center(
                        child: Text(
                          '+++',
                          style: TextStyle(color: Colors.red[800]),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Color.fromRGBO(230, 193, 90, 1),
                        ),
                        SizedBox(width: 5),
                        Text(
                          time.toString(),
                          style: TextStyle(
                            color: Color.fromRGBO(230, 193, 90, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      print('Başlatiliyor');
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(230, 193, 90, 1),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.amberAccent[800],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
  static double height = 140;
  static double containerHeight = 48;
  static double containerWidht = 48;
  static Color textColor = Color.fromRGBO(245, 245, 245, 1);
}

enum Levels { kolay, orta, zor }
