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

      await driver.scrollUntilVisible(lstLong, txtItem, dyScroll: -800.0);

      expect(await driver.getText(txtItem), 'Item 100');
    });
  });
}