
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
  Map<int,int> selectedAnswers = {};
  _TestScreen({required this.id, this.taskInd=0});

  @override
  Widget build(BuildContext context) {
    Test test = tests.where((test) => test.guideId == id).first;
    List<Task> tasks = test.tasks;
    Task task = tasks[taskInd];
    return Scaffold(
      appBar: AppBar(title: Text("тема " +(id+1).toString() + ": " + guides[id].title)),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child:
            Text("Вопрос " +(taskInd+1).toString() + ": " + task.question, style: TextStyle(fontSize: 18.0)),
          ),
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
          ElevatedButton(
            onPressed: () {
              answering();
              taskInd += 1;
            },
            child: const Text('Ответить'),
          )
        ],
      ),
    );
  }

  void answering(){
    selectedAnswers[taskInd] = selectedAns;
    List<Task> tasks = tests[id].tasks;
    if (taskInd +1 >= tasks.length){
      int score = 0;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          for (int i = 0; i < tasks.length; i++) {
            if(tasks[i].ans == selectedAnswers[i]) score +=1;
          }

          return AlertDialog(
            title: Text('Тестирование окончено!'),
            content: Text('ваш результат ' + score.toString() + " из " + tasks.length.toString()),
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
      });
    }
    else if (selectedAns != tests[id].tasks[taskInd].ans){
      showDialog(
          context: context,
          builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Неверно!'),
          content: Text('Правильный ответ: ' + tests[id].tasks[taskInd].answers[tests[id].tasks[taskInd].ans]),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  selectedAns = -1;
                });
              },
              child: Text('OK'),
            ),
          ],
        );
      });
    }
    else {
      setState(() {
        selectedAns = -1;
      });
    }
  }
}


//
// class ListItemTask extends StatelessWidget {
//   final Task task;
//
//   ListItemTask({required this.task});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[ Text(task.question),
//         Center(
//           child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: task.answers.length,
//               itemBuilder: (context, index) {
//             return ListItemAnswers(task: task, index: index);
//           })
//         )
//     ]);
//   }
// }
//
// class ListItemAnswers extends StatelessWidget {
//   final Task task;
//   final int index;
//
//   ListItemAnswers({required this.task, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: Text(task.answers[index]),
//     );
//   }
// }