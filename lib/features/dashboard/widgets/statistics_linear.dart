import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/core/themes/colors/app_colors.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/app_sizes.dart';
import 'package:freelancer_tracking_system/core/themes/sizing/border_sizes.dart';
import 'package:freelancer_tracking_system/providers/project.dart';
import 'package:provider/provider.dart';

class StatisticsLiner extends StatefulWidget {
  const StatisticsLiner({super.key});

  @override
  State<StatisticsLiner> createState() => _StatisticsLinerState();
}

class _StatisticsLinerState extends State<StatisticsLiner> {
  List<double> haftalikVeriler = ProjectProvider().weeklyResultChart();
  List<double> aylikVeriler = ProjectProvider().monthResultChart();
  List<double> yillikVeriler = ProjectProvider().yearResultChart();
  List<String> gunler = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
  List<String> aylar = [
    'Ocak',
    'Şbt',
    'Mart',
    'Nis',
    'May',
    'Haz',
    'Tem',
    'Ağst',
    'Eyl',
    'Eki',
    'Kas',
    'Arlk',
  ];
  List<String> yillar = [
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031',
    '2032',
  ];

  final double zeroK = 0;
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ProjectProvider(),
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 20, left: 10, top: 10),
          child: Column(
            spacing: AppSizes.size16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${ProjectProvider().totalMoney} ₺',
                    style: TextStyle(
                      fontSize: AppSizes.size20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    '% ${getSelectedIncreaseValue(ProjectProvider().selectedTime)}',
                    style: TextStyle(
                      fontSize: AppSizes.size12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(width: 10),

                  Text(
                    'Önceki ${getPeriodLabel(ProjectProvider().selectedTime)} Göre',
                    style: TextStyle(
                      fontSize: AppSizes.size12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey,
                    ),
                  ),
                ],
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
              final selectedTime = context.read<ProjectProvider>().selectedTime;
              int index = value.toInt();

              if (selectedTime == Time.haftalik.label) {
                if (index >= zeroK && index < gunler.length) {
                  return SideTitleWidget(
                    meta: meta,
                    child: Text(
                      gunler[index],
                      style: TextStyle(color: AppColors.black),
                    ),
                  );
                }
                return const SizedBox.shrink();
              } else if (selectedTime == Time.aylik.label) {
                if (index >= zeroK && index < aylar.length) {
                  return SideTitleWidget(
                    meta: meta,
                    child: Text(
                      aylar[index],
                      style: TextStyle(color: AppColors.black),
                    ),
                  );
                }
              } else if (selectedTime == Time.yillik.label) {
                if (index >= 0 && index < yillar.length) {
                  return SideTitleWidget(
                    meta: meta,
                    child: Text(
                      yillar[index],
                      style: TextStyle(color: AppColors.black),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      minX: zeroK,
      minY: zeroK,
      maxY: 200000,
      maxX: getSayi(ProjectProvider().selectedTime),
      backgroundColor: AppColors.white,
      gridData: FlGridData(show: true, drawVerticalLine: false),

      lineBarsData: [
        LineChartBarData(
          belowBarData: BarAreaData(
            show: true,
            color: const Color.fromARGB(222, 160, 135, 242),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 80, 78, 154),
                Color.fromARGB(150, 160, 160, 220),
                Colors.white,
              ],
            ),
          ),
          spots: List.generate(
            getSayi(ProjectProvider().selectedTime).toInt(),
            (index) => FlSpot(
              index.toDouble(),
              getVeri(ProjectProvider().selectedTime)[index],
            ),
          ),
          show: true, // Çubuk çizgisinini gösterilip Gösteriliceğini söyler.

          color: const Color.fromARGB(255, 80, 78, 154),
          barWidth: AppSizes.size4,
          isCurved: true,
          shadow: Shadow(color: AppColors.grey, blurRadius: AppRadius.r4),
          dotData: FlDotData(
            show: true, // Noktaları görünür yapıyoruz

            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 4,
                color: const Color.fromARGB(255, 80, 78, 154),
                strokeWidth: 0,
              );
            },
          ),
        ),
      ],
    );
  }

  List<double> getVeri(String time) {
    if (time == Time.haftalik.label) {
      return haftalikVeriler;
    } else if (time == Time.aylik.label) {
      return aylikVeriler;
    } else {
      return yillikVeriler;
    }
  }

  double getSayi(String time) {
    if (time == Time.haftalik.label) {
      return 7;
    } else if (time == Time.aylik.label) {
      return 12;
    } else {
      return 7;
    }
  }
}

String getPeriodLabel(String time) {
  if (ProjectProvider().selectedTime == Time.haftalik.label) {
    return "Haftaya";
  } else if (ProjectProvider().selectedTime == Time.aylik.label) {
    return "30 Gün'e ";
  } else {
    return "Yıl'a";
  }
}

String getSelectedIncreaseValue(String artis) {
  if (ProjectProvider().selectedTime == Time.haftalik.label) {
    return ProjectProvider().weeklyGrowthPercentage.toStringAsFixed(1);
  } else if (ProjectProvider().selectedTime == Time.aylik.label) {
    return ProjectProvider().last30DaysGrowthPercentage.toStringAsFixed(1);
  } else {
    return ProjectProvider().yearlyGrowthPercentage.toStringAsFixed(1);
  }
}
