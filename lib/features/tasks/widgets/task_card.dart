import 'package:flutter/material.dart';

class TasksCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
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
                        color: levelColor(status) ?? Colors.red,
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
                      taskName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      taskDescription,
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
                  child: GestureDetector(
                    onTap: () {
                      print('Başlatiliyor');
                    },
                    child: Container(
                      width: 75,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blueGrey[100],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: levelColor(status) ?? Colors.red,
                            size: 16,
                          ),
                          Text(
                            status ?? 'Zor',
                            style: TextStyle(
                              color: levelColor(status) ?? Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                SizedBox(
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: LinearProgressIndicator(
                      minHeight: 3,
                      value: double.parse(value ?? '90') / 100,
                      color: levelColor(status) ?? Colors.amber,
                    ),
                  ),
                ),

                Text(
                  '${value ?? 90}%',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Icon(Icons.watch_later_outlined),
                      Text(time ?? '19.00'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month),
                      Text(date ?? '12 Ağustos'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Başlatiliyor');
                  },
                  child: CircleAvatar(
                    backgroundColor: levelColor(status) ?? Colors.red,
                    child: Icon(Icons.play_arrow_rounded, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
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
  if (status == 'Zor') {
    return Color.fromRGBO(255, 69, 69, 1);
  } else if (status == 'Orta') {
    return Color.fromRGBO(255, 153, 0, 1);
  } else if (status == 'Kolay') {
    return Color.fromRGBO(76, 175, 80, 1);
  } else {
    print('Derece Belirtin');
  }
}
