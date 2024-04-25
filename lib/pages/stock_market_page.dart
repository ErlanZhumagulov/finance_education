import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';



class StockPriceChart extends StatefulWidget {
  @override
  _StockPriceChartState createState() => _StockPriceChartState();
}

class _StockPriceChartState extends State<StockPriceChart> {
  List<double> _stockPrices = List.generate(10, (index) => 50.0); // Изначальные цены акций
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Запускаем таймер для обновления данных каждые 5 секунд
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      updateStockPrices();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void updateStockPrices() {
    setState(() {
      // Генерируем новые случайные цены акций
      _stockPrices = List.generate(10, (index) => Random().nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 200,
        padding: EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: _stockPrices.asMap().entries.map((entry) {
                  return FlSpot(entry.key.toDouble(), entry.value);
                }).toList(),
                isCurved: true,
                color: Colors.blue,
                barWidth: 4,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: true, border: Border.all(color: Colors.grey)),
            minX: 0,
            maxX: 9,
            minY: 0,
            maxY: 100,
          ),
        ),
      ),
    );
  }
}
