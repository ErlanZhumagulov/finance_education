
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Guides.dart';
import '../models/GuideModel.dart';

class GuidesScreen extends StatefulWidget {
  const GuidesScreen({super.key});

  @override
  State<GuidesScreen> createState() => _GuidesScreen();
}

class _GuidesScreen extends State<GuidesScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('guide Screen')),
      body: Center(
        //crossAxisAlignment: CrossAxisAlignment.start,
        // children: <Widget>[
        // ElevatedButton(
        //   onPressed: () => context.go('/'),
        //   child: const Text('Go back to the Home screen'),
        // ),
        child:
        ListView.builder(
          itemCount: guides.length,
          itemBuilder: (context, index) {
            return ListItem(
              guide: guides[index]
            );
          },
        ),
      ),
    );
  }
}


class ListItem extends StatelessWidget {
  final Guide guide;

  ListItem({required this.guide});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(guide.title),
      ),
      onTap: () => context.goNamed('guide', pathParameters: {}),
    );
  }
}
