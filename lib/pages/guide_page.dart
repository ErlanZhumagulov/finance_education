
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Guides.dart';


class GuideScreen extends StatelessWidget {
  final int id;

  const GuideScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> contentMap = guides[id].content;

    return Scaffold(
      appBar: AppBar(title: Text(guides[id].title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: contentMap.length,
                itemBuilder: (context, index) {
                  final entry = contentMap[index];
                  final key = entry.keys.first;
                  final value = entry[key];

                  Widget contentWidget;

                  switch (key) {
                    case 'p':
                      contentWidget = ParagraphWidget(text: value!);
                      break;
                    case 'note':
                      contentWidget = NoteWidget(text: value!);
                      break;
                    default:
                      contentWidget = DefaultWidget(text: value!);
                      break;
                  }

                  return contentWidget;
                },
              ),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  context.goNamed('test', pathParameters: {'id': id.toString()});
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Решить тест!',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ParagraphWidget extends StatelessWidget {
  final String text;

  const ParagraphWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  final String text;

  const NoteWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );
  }
}

class DefaultWidget extends StatelessWidget {
  final String text;

  const DefaultWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic, color: Colors.black),
      ),
    );
  }
}
