import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/main.dart' as realmain;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (methodCall) async {
    return Directory.systemTemp.path;
  });
  test('main method', () async {
    try {
      await realmain.main();
    } catch (e) {
      expect(e, isA<AssertionError>());
    }
  });
}
