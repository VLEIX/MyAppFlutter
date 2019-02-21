import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main () {
  group('Scrollable App', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('verifies the list contains a specific item', () async {
      final lstLong = find.byValueKey('lstLong');
      final txtItem = find.byValueKey('txtItem100');

      // Record a performance timeline as we scroll through the list of items
      final timeline = await driver.traceAction(() async {
        await driver.scrollUntilVisible(lstLong, txtItem, dyScroll: -800.0);

        expect(await driver.getText(txtItem), 'Item 100');
      });

      // Convert the Timeline into a TimelineSummary that's easier to read and understand
      final summary = new TimelineSummary.summarize(timeline);

      // Then, save the summary to disk
      summary.writeSummaryToFile('scrolling_summary', pretty: true);

      // Optionally, write the entire timeline to disk in a json format. This
      // file can be opened in the Chrome browser's tracing tools found by
      // navigating to chrome://tracing.
      summary.writeTimelineToFile('scrolling_timeline', pretty: true);
    });
  });
}