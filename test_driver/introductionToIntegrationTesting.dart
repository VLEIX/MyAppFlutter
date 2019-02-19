import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:my_app/cookbook/testing/integration/counterAppToTest.dart';

void main() {

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  runApp(makeTestableWidget(child: CounterApp()));
}