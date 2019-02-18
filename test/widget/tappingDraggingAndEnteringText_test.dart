import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:my_app/cookbook/testing/widget/todoList.dart';

void main() {

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Add and remove a todo', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: TodoList()));

    await tester.enterText(find.byType(TextField), 'hi');

    await tester.tap(find.byType(FloatingActionButton));

    // Rebuild the Widget after the state has changed
    await tester.pump();

    expect(find.text('hi'), findsOneWidget);

    await tester.drag(find.byType(Dismissible), Offset(1000.0, 0.0));

    // Build the Widget until the dismiss animation ends
    await tester.pumpAndSettle();

    expect(find.text('hi'), findsNothing);
  });
}