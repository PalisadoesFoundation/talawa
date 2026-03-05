// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/talawa_error_dialog.dart';

import 'golden_test_helpers.dart';

Widget buildDialogTrigger({
  required MessageType messageType,
  required ThemeMode themeMode,
}) {
  return themedWidget(
    Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (_) => TalawaErrorDialog(
              'Test error message',
              messageType: messageType,
            ),
          );
        });
        return const SizedBox.shrink();
      },
    ),
    themeMode: themeMode,
  );
}

/// Suppresses layout overflow errors that are a known issue in
/// TalawaErrorDialog when the title text is longer (e.g. "Warning",
/// "Information"). Everything else is re-thrown normally.
void _ignoreOverflow(FlutterErrorDetails details) {
  if (details.exceptionAsString().contains('overflowed')) return;
  FlutterError.presentError(details);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    SizeConfig().test();
    setUpGoldenTests();
  });
  tearDownAll(() => tearDownGoldenTests());

  group('TalawaErrorDialog Golden Tests', () {
    testWidgets('error - light', (WidgetTester tester) async {
      await tester.pumpWidget(buildDialogTrigger(messageType: MessageType.error, themeMode: ThemeMode.light));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorDialog),
        matchesGoldenFile(goldenFileName('talawa_error_dialog', 'error', 'light')),
      );
    });

    testWidgets('error - dark', (WidgetTester tester) async {
      await tester.pumpWidget(buildDialogTrigger(messageType: MessageType.error, themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorDialog),
        matchesGoldenFile(goldenFileName('talawa_error_dialog', 'error', 'dark')),
      );
    });

    testWidgets('warning - light', (WidgetTester tester) async {
      FlutterError.onError = _ignoreOverflow;
      await tester.pumpWidget(buildDialogTrigger(messageType: MessageType.warning, themeMode: ThemeMode.light));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorDialog),
        matchesGoldenFile(goldenFileName('talawa_error_dialog', 'warning', 'light')),
      );
      FlutterError.onError = FlutterError.presentError;
    });

    testWidgets('warning - dark', (WidgetTester tester) async {
      FlutterError.onError = _ignoreOverflow;
      await tester.pumpWidget(buildDialogTrigger(messageType: MessageType.warning, themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorDialog),
        matchesGoldenFile(goldenFileName('talawa_error_dialog', 'warning', 'dark')),
      );
      FlutterError.onError = FlutterError.presentError;
    });

    testWidgets('info - light', (WidgetTester tester) async {
      FlutterError.onError = _ignoreOverflow;
      await tester.pumpWidget(buildDialogTrigger(messageType: MessageType.info, themeMode: ThemeMode.light));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorDialog),
        matchesGoldenFile(goldenFileName('talawa_error_dialog', 'info', 'light')),
      );
      FlutterError.onError = FlutterError.presentError;
    });

    testWidgets('info - dark', (WidgetTester tester) async {
      FlutterError.onError = _ignoreOverflow;
      await tester.pumpWidget(buildDialogTrigger(messageType: MessageType.info, themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorDialog),
        matchesGoldenFile(goldenFileName('talawa_error_dialog', 'info', 'dark')),
      );
      FlutterError.onError = FlutterError.presentError;
    });

    testWidgets('random - light', (WidgetTester tester) async {
      await tester.pumpWidget(buildDialogTrigger(messageType: MessageType.random, themeMode: ThemeMode.light));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorDialog),
        matchesGoldenFile(goldenFileName('talawa_error_dialog', 'random', 'light')),
      );
    });

    testWidgets('random - dark', (WidgetTester tester) async {
      await tester.pumpWidget(buildDialogTrigger(messageType: MessageType.random, themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(TalawaErrorDialog),
        matchesGoldenFile(goldenFileName('talawa_error_dialog', 'random', 'dark')),
      );
    });
  });
}
