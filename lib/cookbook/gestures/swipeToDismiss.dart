import 'package:flutter/material.dart';

class SwipeToDismiss extends StatefulWidget {
  final title = 'SwipeToDismiss';
  final List<String> items;

  SwipeToDismiss({Key key, @required this.items}) : super(key : key);

  @override
  _SwipeToDismissState createState() => _SwipeToDismissState();
}

class _SwipeToDismissState extends State<SwipeToDismiss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];

          return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                setState(() {
                  widget.items.removeAt(index);
                });

                String _textToSnackBar;
                if (direction == DismissDirection.endToStart) {
                  _textToSnackBar = 'dismissed';
                } else if (direction == DismissDirection.startToEnd) {
                  _textToSnackBar = 'saved';
                }

                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('$item $_textToSnackBar')
                ));
              },
              background: Container(color: Colors.red,),
              child: ListTile(
                title: Text('$item'),
              )
          );
        }
      ),
    );
  }
}
