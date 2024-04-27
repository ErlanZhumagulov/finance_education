
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Guides.dart';


class GuideScreen extends StatelessWidget {
  GuideScreen({required this.id});
  int id;

  @override
  Widget build(BuildContext context) {
    Map<String,String> contentMap = guides[id].content;
    return Scaffold(
      appBar: AppBar(title: const Text('Guide Screen')),
      body: Column(
        children: <Widget>[
          Text(guides[id].title),
          Column(
            children: contentMap.entries.map((entry) {
              if (entry.key == 'p') {
                return ParagraphWidget(text: entry.value);
              } else if (entry.key == 'note') {
                return NoteWidget(text: entry.value);
              } else {
                return DefaultWidget(text: entry.value);
              }
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () => context.go('/guidesSelect'),
            child: const Text('Go to the Guides screen'),
          ),
        ],
      ),
    );
  }
}


class ParagraphWidget extends StatelessWidget {
  final String text;

  ParagraphWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  final String text;

  NoteWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class DefaultWidget extends StatelessWidget {
  final String text;

  DefaultWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
      ),
    );
  }
}