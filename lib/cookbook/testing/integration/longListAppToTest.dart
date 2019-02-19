import 'package:flutter/material.dart';

class LongListApp extends StatelessWidget {
  final List<String> items;

  LongListApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        key: Key('lstLong'),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${items[index]}',
              key: Key('txtItem$index'),
            ),
          );
        },
      ),
    );
  }
}
