
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Guides.dart';
import '../Tests.dart';
import '../models/TaskModel.dart';
import '../models/TestModel.dart';

class TestScreen extends StatefulWidget {
  TestScreen({required this.id});
  int id;

  @override
  State<TestScreen> createState() => _TestScreen(id: id);
}

class _TestScreen extends State<TestScreen> {
  final int id;
  _TestScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    Test test = tests.where((test) => test.guideId == id).first;
    List<Task> tasks = test.tasks;
    return Scaffold(
      appBar: AppBar(title: const Text('Test Screen')),
      body: Column(
        children: <Widget>[
          Text("тема " +(id+1).toString() + ": " + guides[id].title),
          Center(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListItemTask(
                    task: tasks[index]
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => context.go('/testSelect'),
            child: const Text('Go to the Tests screen'),
          ),
        ],
      ),
    );
  }
}


class ListItemTask extends StatelessWidget {
  final Task task;

  ListItemTask({required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[ Text(task.question),
        Center(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: task.answers.length,
              itemBuilder: (context, index) {
            return ListItemAnswers(task: task, index: index);
          })
        )
    ]);
  }
}

class ListItemAnswers extends StatelessWidget {
  final Task task;
  final int index;

  ListItemAnswers({required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(task.answers[index]),
    );
  }
}