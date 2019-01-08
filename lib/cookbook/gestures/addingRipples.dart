import 'package:flutter/material.dart';

class AddingRipples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding Ripples'),
      ),
      body: Center(child: InkWellButton(),),
    );
  }
}

class InkWellButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Tap')
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Text('RIPPLE BUTTON'),
      ),
    );
  }
}
