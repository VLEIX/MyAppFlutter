import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 4,
          children: List.generate(100, (index) {
            return Center(
              child: Container(
                decoration: new BoxDecoration(
                    color: Colors.blue,
                    border: new Border.all(width: 4.0, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    'index $index',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ),
            );
          }),
        ),
      ),
    );
  }
}
