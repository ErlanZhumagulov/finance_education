import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../tests.dart';
import '../models/TestModel.dart';

class TestSelectScreen extends StatelessWidget {
  const TestSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Проверим знания!')),
      body: ListView.builder(
        itemCount: tests.length,
        itemBuilder: (context, index) {
          return TestListItem(test: tests[index]);
        },
      ),
    );
  }
}

class TestListItem extends StatelessWidget {
  final Test test;

  const TestListItem({required this.test});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed('test', pathParameters: {"id": test.guideId.toString()});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.blue, width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    test.title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
