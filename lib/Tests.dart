import 'models/TaskModel.dart';
import 'models/TestModel.dart';

List<Test> tests = [
  Test(
    guideId: 0,
    tasks: [
      Task(question: "Кто живет на дне океана?", ans: 2, answers: [
        "губка для матья посуды",
        "губка боб",
        "губная гармошка"
      ]),
      Task(question: "Кто НЕ живет на дне океана?", ans: 1, answers: [
        "губка для матья посуды",
        "губка боб",
        "патрик"
      ]),
    ]
  )
];