
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../guides.dart';
import '../models/GuideModel.dart';

class GuidesSelectScreen extends StatelessWidget {
  const GuidesSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Узнаем новое!'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: guides.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListItem(guide: guides[index]);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Вернуться на главный экран'),
          ),
        ],
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
      onTap: () => context.goNamed('guide', pathParameters: {'id': guide.id.toString()}),
      child: ListTile(
        leading: Icon(Icons.book), // Иконка для каждого элемента списка
        title: Text(
          guide.title,
          style: TextStyle(fontSize: 16.0),
        ),
        subtitle: Text(
          guide.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
