import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:freelancer_tracking_system/core/theme/app_style.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/providers/project.dart';

class StatisticsLiner extends StatelessWidget {
  const StatisticsLiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Haftalık Kazanç',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: ActiveProjectStyle.activeProjectCardColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 250,
            width: double.infinity,

            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 20,
                bottom: 8,
                left: 20,
              ),

              child: ValueListenableBuilder<List<Project>>(
                valueListenable: ProjectProvider(),
                builder: (context, project, child) {
                  final completadProjects = project.where(
                    (project) => project.status == 'Tamamlandı',
                  );
                  double total = 0;
                  for (final project in completadProjects) {
                    total += project.projectAmount ?? 0;
                  }
                  return Text(
                    'Toplam: $total Tl',
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
