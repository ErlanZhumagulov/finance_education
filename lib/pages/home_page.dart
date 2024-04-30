import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Домашняя страница'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/guides'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                textStyle: const TextStyle(fontSize: 18.0),
              ),
              child: const Text('Узнать новое'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => context.go('/testSelect'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                textStyle: const TextStyle(fontSize: 18.0),
              ),
              child: const Text('Проверить знания'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => context.go('/plan-buy'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                textStyle: const TextStyle(fontSize: 18.0),
              ),
              child: const Text('Страница учета средств'),
            ),
          ],
        ),
      ),
    );
  }
}
