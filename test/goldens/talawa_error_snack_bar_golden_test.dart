// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/widgets/talawa_error_snackbar.dart';

import 'golden_test_helpers.dart';

Widget buildSnackBarTrigger({
  required MessageType messageType,
  required ThemeMode themeMode,
}) {
  return themedWidget(
    Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: TalawaErrorSnackBar(
                errorMessage: 'Test message',
                messageType: messageType,
                duration: const Duration(seconds: 3),
              ),
              duration: const Duration(seconds: 3),
              padding: EdgeInsets.zero,
            ),
          );
        });
        return const SizedBox.shrink();
      },
    ),
    themeMode: themeMode,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => setUpGoldenTests());
  tearDownAll(() => tearDownGoldenTests());

  group('TalawaErrorSnackBar Golden Tests', () {
    // error
    testWidgets('error - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSnackBarTrigger(messageType: MessageType.error, themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorSnackBar),
        matchesGoldenFile(goldenFileName('talawa_error_snackbar', 'error', 'light')),
      );
    });

    testWidgets('error - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSnackBarTrigger(messageType: MessageType.error, themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorSnackBar),
        matchesGoldenFile(goldenFileName('talawa_error_snackbar', 'error', 'dark')),
      );
    });

    // warning
    testWidgets('warning - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSnackBarTrigger(messageType: MessageType.warning, themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorSnackBar),
        matchesGoldenFile(goldenFileName('talawa_error_snackbar', 'warning', 'light')),
      );
    });

    testWidgets('warning - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSnackBarTrigger(messageType: MessageType.warning, themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorSnackBar),
        matchesGoldenFile(goldenFileName('talawa_error_snackbar', 'warning', 'dark')),
      );
    });

    // info
    testWidgets('info - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSnackBarTrigger(messageType: MessageType.info, themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorSnackBar),
        matchesGoldenFile(goldenFileName('talawa_error_snackbar', 'info', 'light')),
      );
    });

    testWidgets('info - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSnackBarTrigger(messageType: MessageType.info, themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorSnackBar),
        matchesGoldenFile(goldenFileName('talawa_error_snackbar', 'info', 'dark')),
      );
    });

    // random
    testWidgets('random - light', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSnackBarTrigger(messageType: MessageType.random, themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorSnackBar),
        matchesGoldenFile(goldenFileName('talawa_error_snackbar', 'random', 'light')),
      );
    });

    testWidgets('random - dark', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildSnackBarTrigger(messageType: MessageType.random, themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorSnackBar),
        matchesGoldenFile(goldenFileName('talawa_error_snackbar', 'random', 'dark')),
      );
    });
  });
}
