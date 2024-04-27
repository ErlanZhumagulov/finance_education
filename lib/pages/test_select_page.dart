
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Tests.dart';
import '../models/TestModel.dart';

class TestSelectScreen extends StatefulWidget {
  const TestSelectScreen({super.key});

  @override
  State<TestSelectScreen> createState() => _TestSelectScreen();
}

class _TestSelectScreen extends State<TestSelectScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Проверим знания!')),
      body: Center(
        //crossAxisAlignment: CrossAxisAlignment.start,
        // children: <Widget>[
        // ElevatedButton(
        //   onPressed: () => context.go('/'),
        //   child: const Text('Go back to the Home screen'),
        // ),
        child:
        ListView.builder(
          itemCount: tests.length,
          itemBuilder: (context, index) {
            return ListItem(
                test: tests[index]
            );
          },
        ),
      ),
    );
  }
}


class ListItem extends StatelessWidget {
  final Test test;

  ListItem({required this.test});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(test.title),
      ),
      onTap: () => context.goNamed('test', pathParameters: {"id":test.guideId.toString()}),
    );
  }
}
