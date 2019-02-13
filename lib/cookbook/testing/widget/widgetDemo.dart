import 'package:flutter/material.dart';

class WidgetDemo extends StatelessWidget {
  final String title;
  final String message;

  const WidgetDemo({Key key, @required this.title, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
