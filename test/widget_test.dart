// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiver/testing/async.dart';

void main() {
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.resetEpoch();
  });

  test('WidgetBinding build rendering tree and warm up frame back to back', () {
    final FakeAsync fakeAsync = FakeAsync();
    fakeAsync.run((FakeAsync async) {
      runApp(
        const MaterialApp(
          home: Material(
            child: Text('test'),
          ),
        ),
      );
      // Rendering tree is not built synchronously.
      expect(WidgetsBinding.instance.renderViewElement, isNull);
      fakeAsync.flushTimers();
      expect(WidgetsBinding.instance.renderViewElement, isNotNull);
    });
  });
}