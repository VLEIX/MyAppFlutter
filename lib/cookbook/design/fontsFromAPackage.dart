import 'package:flutter/material.dart';

class FontsFromAPackage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fonts From A Package'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Just Smile',
              style: TextStyle(fontFamily: 'Ubuntu', fontSize: 28.0),
            ),
            Text(
              'Just Smile',
              style: TextStyle(fontFamily: 'Ubuntu', fontSize: 28.0, fontStyle: FontStyle.italic),
            ),
            Text(
              'Just Smile',
              style: TextStyle(fontFamily: 'Ubuntu', fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Just Smile',
              style: TextStyle(fontFamily: 'Ubuntu', fontSize: 28.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
