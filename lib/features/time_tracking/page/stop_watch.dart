import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/time_tracking/widget/watch_time.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  String? _selectedTaskName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kronometre Başlat')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                final task = await showModalBottomSheet<String>(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      width: double.infinity,
                      child: ValueListenableBuilder(
                        valueListenable: TaskProvider(),
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              final task = value[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context, task.taskName);
                                  },
                                  leading: Icon(Icons.person_outline, size: 30),
                                  title: Text(
                                    task.taskName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text('${task.bagliMusteri} '),
                                  trailing: Icon(Icons.add),
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
                  _selectedTaskName = task;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blueGrey[100],
                ),
                height: 70,
                child: ListTile(
                  leading: Icon(Icons.person_outline, size: 30),
                  title: Text(
                    'Görev Seç',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    _selectedTaskName?.toString() ?? 'Seçilen Görev',
                  ),
                  trailing: Icon(Icons.list),
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
          WatchTime(),
        ],
      ),
    );
  }
}
