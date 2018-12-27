import 'package:flutter/material.dart';

class FormStyle extends StatefulWidget {
  final title = 'Style';

  @override
  _FormStyleState createState() => _FormStyleState();
}

class _FormStyleState extends State<FormStyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Please enter a search term',
                suffixIcon: Icon(Icons.search)
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your username'
              ),
            )
          ],
        ),
      )
    );
  }
}
