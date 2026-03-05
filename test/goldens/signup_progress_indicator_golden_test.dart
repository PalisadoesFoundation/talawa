// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/signup_progress_indicator.dart';

import 'golden_test_helpers.dart';

Widget buildSignupProgressIndicator({
  required int currentPageIndex,
  required ThemeMode themeMode,
}) {
  return themedWidget(
    SignupProgressIndicator(
      key: const Key('pgIndicator'),
      currentPageIndex: currentPageIndex,
    ),
    themeMode: themeMode,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    SizeConfig().test();
    setUpGoldenTests();
  });

  tearDownAll(() => tearDownGoldenTests());

  group('SignupProgressIndicator Golden Tests', () {
    // step 0: only first dot green
    testWidgets('step_0 - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSignupProgressIndicator(currentPageIndex: 0, themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(SignupProgressIndicator),
        matchesGoldenFile(goldenFileName('signup_progress_indicator', 'step_0', 'light')),
      );
    });

    testWidgets('step_0 - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSignupProgressIndicator(currentPageIndex: 0, themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(SignupProgressIndicator),
        matchesGoldenFile(goldenFileName('signup_progress_indicator', 'step_0', 'dark')),
      );
    });

    // step 1: first two dots green
    testWidgets('step_1 - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSignupProgressIndicator(currentPageIndex: 1, themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(SignupProgressIndicator),
        matchesGoldenFile(goldenFileName('signup_progress_indicator', 'step_1', 'light')),
      );
    });

    testWidgets('step_1 - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSignupProgressIndicator(currentPageIndex: 1, themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(SignupProgressIndicator),
        matchesGoldenFile(goldenFileName('signup_progress_indicator', 'step_1', 'dark')),
      );
    });

    // step 2: all three dots green
    testWidgets('step_2 - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSignupProgressIndicator(currentPageIndex: 2, themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(SignupProgressIndicator),
        matchesGoldenFile(goldenFileName('signup_progress_indicator', 'step_2', 'light')),
      );
    });

    testWidgets('step_2 - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSignupProgressIndicator(currentPageIndex: 2, themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(SignupProgressIndicator),
        matchesGoldenFile(goldenFileName('signup_progress_indicator', 'step_2', 'dark')),
      );
    });
  });
}
