import 'package:flutter/material.dart';

class HandlingTaps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Handling Taps'),
      ),
      body: Center(child: GestureButton(),),
    );
  }
}

class GestureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Tap')
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Text('GESTURE BUTTON'),
      ),
    );
  }
}

