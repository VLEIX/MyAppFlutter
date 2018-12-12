import 'package:flutter/material.dart';

class FadeInOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Opacity Demo';

    return MyHomePage(title: appTitle);
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key : key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;

    Container _container = Container(
      width: _screenWidth * 0.5,
      height: _screenWidth * 0.5,
      decoration: new BoxDecoration(
        color: Colors.purple,
        border: new Border.all(width: 4.0, color: Colors.deepPurple),
        borderRadius: new BorderRadius.all(Radius.circular(_screenWidth * 0.25))
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: _container,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toogle Opacity',
        child: Icon(Icons.flip),
      ),
    );
  }
}
