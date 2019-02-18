import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {

  testWidgets('finds a text Widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Text('H'),
      ),
    ));

    expect(find.text('H'), findsOneWidget);
  });
  
  testWidgets('finds a Widget using a Key', (WidgetTester tester) async {
    final testKey = Key('K');

    await tester.pumpWidget(MaterialApp(
      key: testKey,
      home: Container(),
    ));

    expect(find.byKey(testKey), findsOneWidget);
  });
  
  testWidgets('finds a Widget using its specific instance', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(
      child: childWidget,
    ));
    
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}