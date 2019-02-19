import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:my_app/cookbook/testing/integration/longListAppToTest.dart';

void main() {

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  enableFlutterDriverExtension();

  runApp(makeTestableWidget(child: LongListApp(
      items: List<String>.generate(10000, (i) => 'Item $i')
  )));
}