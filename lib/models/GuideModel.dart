// To parse this JSON data, do
//
//     final guide = guideFromJson(jsonString);

import 'dart:convert';
//
// Guide guideFromJson(String str) => Guide.fromMap(json.decode(str));
//
// String guideToJson(Guide data) => json.encode(data.toMap());

class Guide {
  int id;
  String title;
  List<Map<String, String>> content; //<Тег, контент>
  bool blocked;
  String status;

  Guide({
    required this.id,
    required this.title,
    required this.content,
    required this.blocked,
    this.status = "not readed",
  });
  //
  // factory Guide.fromMap(Map<String, dynamic> json) => Guide(
  //   id: json["id"],
  //   title: json["title"],
  //   content: json["content"],
  //   blocked: json["blocked"],
  //   status: json["status"],
  // );
  //
  // Map<String, dynamic> toMap() => {
  //   "id": id,
  //   "title": title,
  //   "content": content,
  //   "blocked": blocked,
  //   "status": status,
  // };
}
