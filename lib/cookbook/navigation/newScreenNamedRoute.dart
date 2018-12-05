import 'package:flutter/material.dart';

StatefulWidget initialScreenWithNamedRoute() {
  return MaterialApp(
    title: 'Navigation Named Route',
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      '/second' : (context) => SecondScreen(),
    },
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
            textColor: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, '/second');
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
            splashColor: Colors.green,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
