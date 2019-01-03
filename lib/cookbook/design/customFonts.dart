import 'package:flutter/material.dart';

class CustomFonts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Fonts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Live the life',
              style: TextStyle(fontFamily: 'IndieFlower', fontSize: 28.0),
            ),
            Text(
              'Live the life',
              style: TextStyle(fontFamily: 'RobotoMono', fontSize: 28.0),
            ),
            Text(
              'Live the life',
              style: TextStyle(fontFamily: 'RobotoMono', fontSize: 28.0, fontStyle: FontStyle.italic),
            ),
            Text(
              'Live the life',
              style: TextStyle(fontFamily: 'RobotoMono', fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Live the life',
              style: TextStyle(fontFamily: 'RobotoMono', fontSize: 28.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ),
    );
  }
}
