import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
              color: Color(0xFF2C3E50),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 250,
            width: double.infinity,

            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 20, bottom: 8),
              child: LineChart(
                LineChartData(
                  backgroundColor: Colors.transparent,
                  minX: 0,
                  maxX: 6,
                  maxY: 10000,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1000),
                        FlSpot(1, 2000),
                        FlSpot(3, 3000),
                      ],
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 50,
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
                          return Text(gunler[value.toInt()]);
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
