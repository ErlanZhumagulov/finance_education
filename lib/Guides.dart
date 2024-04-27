import 'models/GuideModel.dart';

List<Guide> guides = [
  Guide(
    id: 0,
    title: "Первый гайд",
    content: {"p":"Содержимое первого",
        "note":"Заметка"},
    blocked: false,
    status: "not readed"
  ),
  Guide(
      id: 1,
      title: "Второй гайд",
      content: {"p":"Содержимое Второго",
        "note":"Заметка2"},
      blocked: false,
      status: "not readed"
  )
];