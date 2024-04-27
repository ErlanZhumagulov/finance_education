
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
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
          ElevatedButton(
            onPressed: () => context.go('/testSelect'),
            child: const Text('Go to the Tests screen'),
          ),
          ElevatedButton(
            onPressed: () => context.go('/plan-buy'),
            child: const Text('Страница учета средств'),
          ),
        ],
      ),
    );
  }
}
