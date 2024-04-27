
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
  int taskInd;
  int selectedAns = -1;
  _TestScreen({required this.id, this.taskInd=0});

  @override
  Widget build(BuildContext context) {
    Test test = tests.where((test) => test.guideId == id).first;
    List<Task> tasks = test.tasks;
    Task task = tasks[taskInd];
    return Scaffold(
      appBar: AppBar(title: const Text('Test Screen')),
      body: Column(
        children: <Widget>[
          Text("тема " +(id+1).toString() + ": " + guides[id].title),
          Text("Вопрос " +(taskInd+1).toString() + ": " + task.question),
          Center(
            child: Column(
              children: task.answers.asMap().entries.map((entry) {
                int index = entry.key;
                String option = entry.value;
                return RadioListTile<int>(
                  title: Text(option),
                  value: index,
                  groupValue: selectedAns,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAns = value!;
                    });
                  },
                );
              }).toList(),
            )
          ),

          taskInd + 1 < tasks.length
          ? ElevatedButton(
            onPressed: () {
              taskInd += 1;
              answering();
              setState(() {
                selectedAns = -1;
              });
            },
            child: const Text('Go to the next question'),
          )
          : ElevatedButton(
            onPressed: () {
              answering();
              setState(() {
                selectedAns = -1;
              });
            },
            child: const Text('Посмотреть результат'),
          ),
        ],
      ),
    );
  }
}

void answering(){

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