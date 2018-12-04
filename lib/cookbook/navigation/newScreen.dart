import 'package:flutter/material.dart';

StatefulWidget initialScreen() {
  return MaterialApp(
    title: 'Navigation Basics',
    home: FirstScreen(),
  );
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('LAUNCH SCREEN'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          }
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('GO BACK!'),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            splashColor: Colors.red,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
