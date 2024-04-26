import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';



class PlanBuyScreen extends StatefulWidget {
  @override
  _PlanBuyScreenState createState() => _PlanBuyScreenState();
}

class _PlanBuyScreenState extends State<PlanBuyScreen> {
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
        child: Text("Делать здесь")
      ),
    );
  }
}
