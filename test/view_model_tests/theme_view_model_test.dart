// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  testSetupLocator();

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('Theme View Model Tests', () {
    test("test initialize function", () async {
      final model = AppTheme();
      final prefs = await SharedPreferences.getInstance();
      model.initialize();
      expect(model.isdarkTheme, prefs.getBool("DynamicTheme") ?? true);
    });

    test("test switch theme function", () async {
      final model = AppTheme();
      model.initialize();
      model.switchTheme(isOn: false);
      expect(model.isdarkTheme, false);

      model.switchTheme(isOn: true);
      expect(model.isdarkTheme, true);
    });
  });
}
