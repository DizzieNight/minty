import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  int _index = 0;
  NewsCard ({Key? key,}) : super(key: key);
  NewsCard.card (int i, {Key? key}) : super(key: key) {
    _index = ++i;
  }

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.article),
            title: Text('News Article ${widget._index}'),
            subtitle: const Text('This is a news article in the sliver list'),
          )
        ],
      ),
    );
  }
}

