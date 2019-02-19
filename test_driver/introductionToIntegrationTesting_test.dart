import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final txtCounter = find.byValueKey('txtCounter');
    final fabIncrement = find.byValueKey('fabIncrement');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      expect(await driver.getText(txtCounter), '0');
    });

    test('increments the counter', () async {
      await driver.tap(fabIncrement);
      
      expect(await driver.getText(txtCounter), '1');
    });
  });
}