import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/app_theme.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/providers/project.dart';
import 'package:freelancer_tracking_system/providers/theme.dart';

class StatisticsLiner extends StatefulWidget {
  const StatisticsLiner({super.key});

  @override
  State<StatisticsLiner> createState() => _StatisticsLinerState();
}

class _StatisticsLinerState extends State<StatisticsLiner> {
  List<double> veriler = ProjectProvider().resultChart();
  List<String> gunler = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
  final double zeroK = 0;
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeProvider(),
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 20, left: 0, top: 10),
          child: Column(
            spacing: AppSizes.size12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  DashboardStrings.haftaliKazanc,
                  style: TextStyle(
                    fontSize: AppSizes.size16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSizes.size16),
                  ),
                ),
                height: AppSizes.size250,
                width: double.infinity,

                child: LineChart(
                  duration: Duration(milliseconds: 150),
                  curve: Curves.linear,

                  _lineChartData(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  LineChartData _lineChartData() {
    return LineChartData(
      borderData: FlBorderData(
        show: true,
        border: Border(
          left: BorderSide(width: AppSizes.size2, color: AppColors.black),
          bottom: BorderSide(width: AppSizes.size2, color: AppColors.black),
          top: BorderSide.none,
          right: BorderSide.none,
        ),
      ),
      clipData: FlClipData.horizontal(),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          axisNameSize: AppSizes.size20,

          sideTitleAlignment: SideTitleAlignment.outside,

          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: AppSizes.size48,
            getTitlesWidget: (value, meta) {
              return SideTitleWidget(
                meta: meta,
                child: Text(
                  '${(value ~/ 1000).toString()}K',
                  style: TextStyle(color: AppColors.black),
                ),
              );
            },
          ),
        ),

        bottomTitles: AxisTitles(
          sideTitleAlignment: SideTitleAlignment.outside,
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: AppSizes.size28,
            interval: 1,
            getTitlesWidget: (value, meta) {
              int index = value.toInt();
              if (index >= zeroK && index < gunler.length) {
                return SideTitleWidget(
                  meta: meta,
                  child: Text(
                    gunler[index],
                    style: TextStyle(color: AppColors.black),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      minX: zeroK,
      minY: zeroK,
      maxY: 200000,
      maxX: 6,
      backgroundColor: AppColors.white,
      gridData: FlGridData(show: true, drawVerticalLine: false),

      lineBarsData: [
        LineChartBarData(
          belowBarData: BarAreaData(
            show: true,
            color: Color.fromRGBO(0, 230, 118, 0.2),
          ),
          spots: List.generate(
            7,
            (index) => FlSpot(index.toDouble(), veriler[index]),
          ),
          show: true, // Çubuk çizgisinini gösterilip Gösteriliceğini söyler.
          gradient: LinearGradient(colors: [AppColors.white, AppColors.black]),
          barWidth: AppSizes.size4,
          isCurved: true,
          shadow: Shadow(color: AppColors.grey, blurRadius: AppRadius.r4),
        ),
      ],
    );
  }
}
