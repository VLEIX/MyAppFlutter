import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoringData extends StatefulWidget {
  final title = 'Storing Data';

  @override
  _StoringDataState createState() => _StoringDataState();
}

class _StoringDataState extends State<StoringData> {
  static const KEY_COUNTER = 'counter';
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt(KEY_COUNTER) ?? 0);
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt(KEY_COUNTER) ?? 0) + 1;
      prefs.setInt(KEY_COUNTER, _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
      )
    );
  }
}
