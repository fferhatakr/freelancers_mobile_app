import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';
import 'package:freelancer_tracking_system/core/theme/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/theme/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/providers/project.dart';

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
    return Padding(
      padding: const EdgeInsets.only(right: 11, left: 0, top: 10),
      child: Column(
        spacing: AppSizes.size12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DashboardStrings.haftaliKazanc,
            style: TextStyle(
              fontSize: AppSizes.size16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.size12)),
            ),
            height: AppSizes.size250,
            width: double.infinity,

            child: Padding(
              padding: const EdgeInsets.only(top: AppSizes.size12),

              child: LineChart(
                duration: Duration(milliseconds: 150),
                curve: Curves.linear,

                _lineChartData(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _lineChartData() {
    return LineChartData(
      borderData: FlBorderData(
        show: true,
        border: Border(
          left: BorderSide(width: AppSizes.size2),
          bottom: BorderSide(width: AppSizes.size2),
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
                return SideTitleWidget(meta: meta, child: Text(gunler[index]));
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
      gridData: FlGridData(show: true),

      lineBarsData: [
        LineChartBarData(
          belowBarData: BarAreaData(
            show: true,
            color: AppColors.surfaceBlueGreyLight,
          ),
          spots: List.generate(
            7,
            (index) => FlSpot(index.toDouble(), veriler[index]),
          ),
          show: true, // Çubuk çizgisinini gösterilip Gösteriliceğini söyler.
          gradient: LinearGradient(
            colors: [AppColors.black, AppColors.red, AppColors.purple],
          ),
          barWidth: AppSizes.size4,
          isCurved: true,
          shadow: Shadow(color: AppColors.grey, blurRadius: AppRadius.r4),
        ),
      ],
    );
  }
}
