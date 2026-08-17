import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/time_tracking/widget/watch_time.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';
import 'package:freelancer_tracking_system/providers/watch.dart';

class StopWatch extends StatefulWidget {
  String? selectedCustomer;
  String? id;
  String? resultTime;
  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kronometre Başlat')),
      body: Column(children: [SizedBox(height: 100), WatchTime()]),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          final task = await showModalBottomSheet<(String?, String?)>(
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
                              Navigator.pop(context, (
                                task.bagliMusteri,
                                task.id,
                              ));
                            },
                            leading: Icon(Icons.person_outline, size: 30),
                            title: Text(
                              task.taskName,
                              style: TextStyle(fontWeight: FontWeight.bold),
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
            widget.selectedCustomer = task?.$1;
            widget.id = task?.$2;
          });
          print(widget.id);
          print(widget.selectedCustomer);
          print(WatchProvider().tumSaatler);
          WatchProvider().reset();
        },
        child: Text(
          'Save',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
