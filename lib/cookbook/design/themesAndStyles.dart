import 'package:flutter/material.dart';

class ThemesAndStyles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes And Styles'),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).accentColor,
          child: Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.orange),
          child: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
          )
      ),
    );
  }
}
