import 'package:flutter/material.dart';

class ListDifferentTypes extends StatelessWidget {
  final List<ListItem> items;

  ListDifferentTypes({Key key, @required this.items}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Mixed List';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            if (item is HeadingItem) {
              return ListTile(
                title: Text(
                  item.heading,
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            } else if (item is MessageItem) {
              return ListTile(
                title: Text(item.sender),
                subtitle: Text(item.body),
              );
            }
          }
      ),
    );
  }
}

abstract class ListItem{}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
