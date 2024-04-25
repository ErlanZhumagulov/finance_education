
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class GuideScreen extends StatelessWidget {
  final int id;
  const GuideScreen({required this.id});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guide Screen')),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () => context.go('/details'),
            child: const Text('Go to the Details screen'),
          ),
          ElevatedButton(
            onPressed: () => context.go('/guides'),
            child: const Text('Go to the Guides screen'),
          ),
        ],
      ),
    );
  }
}
