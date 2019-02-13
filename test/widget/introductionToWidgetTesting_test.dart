import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/cookbook/testing/widget/widgetDemo.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(WidgetDemo(title: 'T', message: 'M',));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsNWidgets(1));
  });
}