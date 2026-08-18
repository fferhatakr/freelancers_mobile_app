import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_tracking_system/providers/project.dart';

class StatisticsLiner extends StatefulWidget {
  const StatisticsLiner({super.key});

  @override
  State<StatisticsLiner> createState() => _StatisticsLinerState();
}

class _StatisticsLinerState extends State<StatisticsLiner> {
  List<double> veriler = ProjectProvider().resultChart();

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
          SizedBox(height: 10),
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

          sideTitles: SideTitles(showTitles: true, reservedSize: 50),
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
      maxY: 200000,
      maxX: 6,
      backgroundColor: Colors.white,
      gridData: FlGridData(show: true),

      lineBarsData: [
        LineChartBarData(
          belowBarData: BarAreaData(
            show: true,
            color: const Color.fromARGB(135, 114, 114, 114),
          ),
          spots: List.generate(
            7,
            (index) => FlSpot(index.toDouble(), veriler[index]),
          ),
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
