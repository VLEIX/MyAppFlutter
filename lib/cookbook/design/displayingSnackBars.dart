import 'package:flutter/material.dart';

class DisplayingSnackBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Displaying SnackBars'),
      ),
      body: Builder(builder: (context) => Center(
        child: RaisedButton(
            child: Text('Show SnackBar'),
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('Yay! A SnackBar!'),
                action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      print('Action SnackBar Pressed');
                    }
                ),
              );

              Scaffold.of(context).showSnackBar(snackBar);
            }
        ),
      )),
    );
  }
}
