import 'TaskModel.dart';

class Test {
  int guideId;
  String title;
  List<Task> tasks; //<Тег, контент>
  String? status;

  Test({
    required this.guideId,
    required this.title,
    required this.tasks,
    this.status = "not solved",
  });
}