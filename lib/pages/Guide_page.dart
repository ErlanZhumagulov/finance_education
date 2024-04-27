
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Guides.dart';


class GuideScreen extends StatelessWidget {
  GuideScreen({required this.id});
  int id;

  @override
  Widget build(BuildContext context) {
    List<Map<String,String>> contentMap = guides[id].content;
    List<Widget> widgetList = [];

    for (var entry in contentMap){
      if (entry.entries.first.key == 'p') {
        widgetList.add(ParagraphWidget(text: entry.entries.first.value));
      } else if (entry.entries.first.key == 'note') {
        widgetList.add(NoteWidget(text: entry.entries.first.value));
      } else {
        widgetList.add(DefaultWidget(text: entry.entries.first.value));
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Guide Screen')),
      body: ListView(

        children: <Widget>[
          Text(guides[id].title),
          Column(
            children: widgetList,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical:25.0,horizontal: 5.0),
            child:
            ElevatedButton(
              onPressed: () => context.goNamed('test', pathParameters: {'id':id.toString()}),
              child: const Text('Решить тест!'),
            ),
          )
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
      margin: EdgeInsets.symmetric(vertical:10.0,horizontal: 5.0),
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