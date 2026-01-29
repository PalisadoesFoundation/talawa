// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';

import '../helpers/test_locator.dart';
import 'golden_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    testSetupLocator();
    locator<SizeConfig>().test();
    setUpGoldenTests();
  });

  tearDownAll(() => tearDownGoldenTests());

  Widget createAlertDialogForGolden({
    required ThemeMode themeMode,
    String? dialogTitle,
    String? dialogSubTitle,
    String? successText,
    String? secondaryButtonText,
    bool reverse = false,
  }) {
    return themedWidget(
      Builder(
        builder: (context) {
          // Show dialog immediately for golden test
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                dialogTitle: dialogTitle ?? 'Confirmation',
                dialogSubTitle:
                    dialogSubTitle ?? 'Are you sure you want to proceed?',
                successText: successText ?? 'Confirm',
                secondaryButtonText: secondaryButtonText ?? 'Close',
                reverse: reverse,
                success: () {},
              ),
            );
          });
          return Container();
        },
      ),
      themeMode: themeMode,
    );
  }

  group('CustomAlertDialog Golden Tests', () {
    testWidgets('custom_alert_dialog default - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogForGolden(themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_alert_dialog', 'default', 'light'),
        ),
      );
    });

    testWidgets('custom_alert_dialog default - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogForGolden(themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_alert_dialog', 'default', 'dark'),
        ),
      );
    });

    testWidgets('custom_alert_dialog custom text - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogForGolden(
          themeMode: ThemeMode.light,
          dialogTitle: 'Delete Item',
          dialogSubTitle: 'This action cannot be undone. Continue?',
          successText: 'Delete',
          secondaryButtonText: 'Cancel',
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_alert_dialog', 'custom_text', 'light'),
        ),
      );
    });

    testWidgets('custom_alert_dialog reversed buttons - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogForGolden(
          themeMode: ThemeMode.light,
          reverse: true,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_alert_dialog', 'reversed', 'light'),
        ),
      );
    });

    testWidgets('custom_alert_dialog long text - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogForGolden(
          themeMode: ThemeMode.light,
          dialogTitle: 'Important Notice',
          dialogSubTitle:
              'This is a very long message that explains the consequences of the action. '
              'Please read carefully before proceeding. This action will affect multiple '
              'items and cannot be reversed once completed.',
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_alert_dialog', 'long_text', 'light'),
        ),
      );
    });
  });
}
