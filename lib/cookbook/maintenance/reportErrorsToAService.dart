import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sentry/sentry.dart';

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return false;
}

final SentryClient _sentryClient = new SentryClient(dsn: 'https://270c1204c6a3485292b1a13b2b494348:b5b4d700105a486a8e69741a5e4fa193@sentry.io/1367736');

Future<void> reportError(dynamic error, dynamic stackTrace) async {
  print('Caught error: $error');

  if (isInDebugMode) {
    print(stackTrace);
    print('Sentry: In dev mode. Not sending report to Sentry.io.');
    return;
  }

  print('Sentry: Reporting to Sentry.io...');

  final SentryResponse response = await _sentryClient.captureException(
    exception: error,
    stackTrace: stackTrace,
  );

  if (response.isSuccessful) {
    print('Sentry: Success! Event ID: ${response.eventId}');
  } else {
    print('Sentry: Failed to report to Sentry.io: ${response.error}');
  }
}

class ReportErrorsToAService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Errors To A Service'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Dart exception'),
              elevation: 1.0,
              onPressed: () {
                throw new StateError('This is Dart exception.');
              }
            ),
            RaisedButton(
              child: Text('async Dart exception'),
              elevation: 1.0,
              onPressed: () async {
                foo() async {
                  throw new StateError('This is an async Dart exception.');
                }

                bar() async {
                  await foo();
                }

                await bar();
              }
            ),
            RaisedButton(
              child: Text('Java exception'),
              elevation: 1.0,
              onPressed: () async {
                final channel = const MethodChannel('crashy-custom-channel');
                await channel.invokeMethod('blah');
              }
            )
          ],
        ),
      ),
    );
  }
}
