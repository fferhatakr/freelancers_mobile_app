import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/localization/stopwatch_strings.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/padding_sizes.dart';
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
    content: Text(StopWatchStrings.noSelected),
    backgroundColor: AppColors.red,
  );
  final SnackBar _startStopWatch = SnackBar(
    content: Text(StopWatchStrings.startStopWatch),
    backgroundColor: AppColors.amber,
  );
  final SnackBar _selected = SnackBar(
    content: Text(StopWatchStrings.selectedSuccess),
    backgroundColor: AppColors.green,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StopWatchStrings.appBarTitle)),
      body: Column(
        children: [
          SizedBox(height: AppSizes.size108),
          WatchTime(),
        ],
      ),
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
                          padding: EdgeInsets.all(AppPadding.p10),
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context, (
                                task.bagliMusteri,
                                task.id,
                              ));
                            },
                            leading: Icon(
                              Icons.person_outline,
                              size: AppSizes.size32,
                            ),
                            title: Text(
                              task.taskName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${task.bagliMusteri} '),
                                Text(
                                  '${StopWatchStrings.totalDurationPrefix}${WatchRecord().formatDuration(WatchRecord().totalRecord[task.id] ?? Duration.zero)}',
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
          if (WatchProvider().stopWatch.elapsed != Duration.zero) {
            if (id != null && context.mounted) {
              WatchRecord().addTotalRecord(
                id!,
                WatchProvider().stopWatch.elapsed,
              );

              ScaffoldMessenger.of(context).showSnackBar(_selected);
              WatchProvider().reset();
            } else if (!context.mounted) {
              return;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(_noSelected);
            }
          } else if (!context.mounted) {
          } else {
            ScaffoldMessenger.of(context).showSnackBar(_startStopWatch);
          }
        },
        child: Text(
          StopWatchStrings.saveButton,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
