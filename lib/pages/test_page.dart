import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Guides.dart';
import '../Tests.dart';
import '../models/TaskModel.dart';
import '../models/TestModel.dart';

class TestScreen extends StatefulWidget {
  final int id;

  const TestScreen({required this.id});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int taskIndex = 0;
  int? selectedAnswer;
  Map<int, int> selectedAnswers = {};

  late Test test;
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    test = tests.firstWhere((test) => test.guideId == widget.id);
    tasks = test.tasks;
  }

  @override
  Widget build(BuildContext context) {
    Task currentTask = tasks[taskIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Тема ${widget.id + 1}: ${guides[widget.id].title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Вопрос ${taskIndex + 1}: ${currentTask.question}",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20),
            Column(
              children: currentTask.answers.asMap().entries.map((entry) {
                int index = entry.key;
                String option = entry.value;
                return RadioListTile<int>(
                  title: Text(option),
                  value: index,
                  groupValue: selectedAnswer,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAnswer = value!;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            SizedBox( // Wrap ElevatedButton with SizedBox to control its width
              width: double.infinity, // Stretch button to full width
              child: ElevatedButton(
                onPressed: () {
                  _handleAnswer();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0), // Increase vertical padding
                  textStyle: TextStyle(fontSize: 20.0), // Increase font size
                ),
                child: Text(
                  'Ответить',
                  style: TextStyle(fontSize: 20.0), // Increase font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleAnswer() {
    selectedAnswers[taskIndex] = selectedAnswer ?? -1;

    if (taskIndex + 1 >= tasks.length) {
      int score = 0;
      for (int i = 0; i < tasks.length; i++) {
        if (tasks[i].ans == selectedAnswers[i]) score += 1;
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Тестирование окончено!'),
            content: Text('Ваш результат: $score из ${tasks.length}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.goNamed("testSelect");
                },
                child: Text('Ок, вернуться к тестам'),
              ),
            ],
          );
        },
      );
    } else {
      bool isCorrect = selectedAnswer == tasks[taskIndex].ans;
      String rightAnswer = tasks[taskIndex].answers[tasks[taskIndex].ans];

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: isCorrect ? Text('Правильно!') : Text('Неверно!'),
            content: isCorrect ? null : Text('Правильный ответ: $rightAnswer'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    selectedAnswer = null;
                    taskIndex++;
                  });
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
