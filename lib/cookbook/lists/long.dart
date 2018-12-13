import 'package:flutter/material.dart';

class LongList extends StatelessWidget {
  final List<String> items = List<String>.generate(100000, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
            );
          }),
    );
  }
}
