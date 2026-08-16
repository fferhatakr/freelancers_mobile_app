import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsLiner extends StatelessWidget {
  const StatisticsLiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 11, left: 0, top: 10),
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
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 250,
            width: double.infinity,

            child: Padding(
              padding: const EdgeInsets.only(top: 10),

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
          left: BorderSide(width: 2),
          bottom: BorderSide(width: 2),
          top: BorderSide.none,
          right: BorderSide.none,
        ),
      ),
      clipData: FlClipData.horizontal(),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          axisNameSize: 20,

          sideTitleAlignment: SideTitleAlignment.outside,

          sideTitles: SideTitles(showTitles: true, reservedSize: 40),
        ),

        bottomTitles: AxisTitles(
          sideTitleAlignment: SideTitleAlignment.outside,
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              List<String> gunler = [
                'Pzt',
                'Sal',
                'Çar',
                'Per',
                'Cum',
                'Cmt',
                'Paz',
              ];
              int index = value.toInt();
              if (index >= 0 && index < gunler.length) {
                return SideTitleWidget(meta: meta, child: Text(gunler[index]));
              }
              return SizedBox.shrink();
            },
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      minX: 0,
      minY: 0,
      maxY: 10000,
      maxX: 6,
      backgroundColor: Colors.white,
      gridData: FlGridData(show: true),

      lineBarsData: [
        LineChartBarData(
          belowBarData: BarAreaData(
            show: true,
            color: const Color.fromARGB(135, 114, 114, 114),
          ),
          spots: [
            FlSpot(0, 1000),
            FlSpot(1, 3000),
            FlSpot(2, 4000),
            FlSpot(3, 6000),
            FlSpot(5, 7000),
            FlSpot(6, 8000),
          ],
          show: true, // Çubuk çizgisinini gösterilip Gösteriliceğini söyler.
          gradient: LinearGradient(
            colors: [Colors.black, Colors.red, Colors.purple],
          ),
          barWidth: 4,
          isCurved: true,
          shadow: Shadow(color: Colors.blueGrey, blurRadius: 4),
        ),
      ],
    );
  }
}
