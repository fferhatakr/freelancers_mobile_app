import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/features/time_tracking/widget/watch_time.dart';
import 'package:freelancer_tracking_system/providers/tasks.dart';
import 'package:freelancer_tracking_system/providers/watch.dart';
import 'package:freelancer_tracking_system/providers/watch_record.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});
  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  String? selectedCustomer;
  String? id;
  String? resultTime;
  final SnackBar _noSelected = SnackBar(
    content: Text('Görev Seçilmedi'),
    backgroundColor: Colors.red.shade600,
  );
  final SnackBar _startStopWatch = SnackBar(
    content: Text('Kronometre Başlatılmadı'),
    backgroundColor: const Color.fromARGB(255, 251, 201, 22),
  );
  final SnackBar _selected = SnackBar(
    content: Text('Görev Başarıyla Eklendi'),
    backgroundColor: Colors.green,
  );
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
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${task.bagliMusteri} '),
                                Text(
                                  'Toplam Süre:${WatchRecord().formatDuration(WatchRecord().totalRecord[task.id] ?? Duration.zero)}',
                                ),
                              ],
                            ),
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
            selectedCustomer = task?.$1;
            id = task?.$2;
          });
          if (WatchProvider().formattedText != '00:00:00') {
            if (id != null && context.mounted) {
              WatchRecord().addTotalRecord(
                id!,
                WatchProvider().stopWatch.elapsed,
              );

              ScaffoldMessenger.of(context).showSnackBar(_selected);
              WatchProvider().reset();
            }
            if (!context.mounted) {
            } else {
              ScaffoldMessenger.of(context).showSnackBar(_noSelected);
            }
          }
          if (!context.mounted) {
          } else {
            ScaffoldMessenger.of(context).showSnackBar(_startStopWatch);
          }
        },
        child: Text(
          'Save',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
