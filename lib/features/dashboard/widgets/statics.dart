import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:freelancer_tracking_system/core/theme/app_theme.dart';

class staticsLineChart extends StatelessWidget {
  const staticsLineChart({super.key});

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
              color: AppColors.activeProjectCardColor,
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
              child: LineChart(
                LineChartData(
                  backgroundColor: Colors.transparent,
                  minX: 0,
                  maxX: 6,
                  maxY: 10000,
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.white, width: 2),
                  ),

                  lineBarsData: [
                    LineChartBarData(
                      color: Colors.blueGrey,
                      spots: [
                        FlSpot(0, 1000),
                        FlSpot(1, 2000),
                        FlSpot(3, 3000),
                        FlSpot(4, 4000),
                        FlSpot(5, 7000),
                      ],
                    ),
                  ],

                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 9),
                          );
                        },
                        showTitles: false,
                        reservedSize: 0,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        reservedSize: 20,

                        getTitlesWidget: (value, meta) {
                          final gunler = [
                            'Pzt',
                            'Sal',
                            'Çar',
                            'Per',
                            'Cum',
                            'Cmt',
                            'Paz',
                          ];

                          return Text(
                            gunler[value.toInt()],
                            style: TextStyle(color: Colors.white),
                          );
                        },
                      ),
                    ),

                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
