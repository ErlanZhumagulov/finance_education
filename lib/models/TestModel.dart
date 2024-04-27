import 'TaskModel.dart';

class Test {
  int guideId;
  List<Task> tasks; //<Тег, контент>
  String? status;

  Test({
    required this.guideId,
    required this.tasks,
    this.status = "not solved",
  });
}