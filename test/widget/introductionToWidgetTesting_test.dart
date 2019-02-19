import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:my_app/cookbook/testing/widget/widgetDemoToTest.dart';

void main() {

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: WidgetDemo(title: 'T', message: 'M',)));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsNWidgets(1));
  });
}