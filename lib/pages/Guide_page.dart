
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Guides.dart';


class GuideScreen extends StatelessWidget {
  GuideScreen({required this.id});
  int id;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guide Screen')),
      body: Column(
        children: <Widget>[
          Text(guides[id].title),
          Text(guides[id].content),
          ElevatedButton(
            onPressed: () => context.go('/guides'),
            child: const Text('Go to the Guides screen'),
          ),
        ],
      ),
    );
  }
}
