import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';
import 'package:provider/provider.dart';

class ResultTask extends StatelessWidget {
  ResultTask({super.key});

  final DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final tasksItems = context.watch<TasksProvider>().tasksItems;

    return SizedBox(
      height: 100,
      child: Card(
        elevation: 10,
        color: Colors.blueGrey[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.article_outlined, color: Colors.black),
                  Text(tasksItems.length.toString(), style: _textStyle()),
                  Text('Toplam', style: _twoTextStyle()),
                ],
              ),
              VerticalDivider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_outlined, color: Colors.green),

                  Text('0', style: _textStyle()),
                  Text('Tamamlandı', style: _twoTextStyle()),
                ],
              ),
              VerticalDivider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.watch_later_outlined, color: Colors.amber),

                  Text('0', style: _textStyle()),
                  Text('Devam', style: _twoTextStyle()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _twoTextStyle() =>
      TextStyle(fontSize: 12, color: const Color.fromARGB(255, 3, 3, 3));

  TextStyle _textStyle() {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: const Color.fromARGB(255, 0, 0, 0),
    );
  }
}
