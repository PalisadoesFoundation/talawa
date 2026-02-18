// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/custom_alert_dialog_with_checkbox.dart';

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

  Widget createAlertDialogWithCheckboxForGolden({
    required ThemeMode themeMode,
    String? dialogTitle,
    String? dialogSubTitle,
    String? checkboxLabel,
    String? successText,
    String? secondaryButtonText,
    bool initialCheckboxValue = false,
    bool reverse = false,
  }) {
    return themedWidget(
      Builder(
        builder: (context) {
          // Show dialog immediately for golden test
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialogWithCheckbox(
                dialogTitle: dialogTitle ?? 'Confirmation',
                dialogSubTitle:
                    dialogSubTitle ?? 'Are you sure you want to proceed?',
                checkboxLabel: checkboxLabel ?? 'Remember my choice',
                successText: successText ?? 'Confirm',
                secondaryButtonText: secondaryButtonText ?? 'Close',
                initialCheckboxValue: initialCheckboxValue,
                reverse: reverse,
                success: (bool? value) {},
              ),
            );
          });
          return Container();
        },
      ),
      themeMode: themeMode,
    );
  }

  group('CustomAlertDialogWithCheckbox Golden Tests', () {
    testWidgets('custom_alert_dialog_with_checkbox unchecked - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogWithCheckboxForGolden(themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName(
            'custom_alert_dialog_with_checkbox',
            'unchecked',
            'light',
          ),
        ),
      );
    });

    testWidgets('custom_alert_dialog_with_checkbox unchecked - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogWithCheckboxForGolden(themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName(
            'custom_alert_dialog_with_checkbox',
            'unchecked',
            'dark',
          ),
        ),
      );
    });

    testWidgets('custom_alert_dialog_with_checkbox checked - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogWithCheckboxForGolden(
          themeMode: ThemeMode.light,
          initialCheckboxValue: true,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName(
            'custom_alert_dialog_with_checkbox',
            'checked',
            'light',
          ),
        ),
      );
    });

    testWidgets('custom_alert_dialog_with_checkbox custom text - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogWithCheckboxForGolden(
          themeMode: ThemeMode.light,
          dialogTitle: 'Delete Item',
          dialogSubTitle: 'This action cannot be undone. Continue?',
          checkboxLabel: 'Do not ask again',
          successText: 'Delete',
          secondaryButtonText: 'Cancel',
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName(
            'custom_alert_dialog_with_checkbox',
            'custom_text',
            'light',
          ),
        ),
      );
    });

    testWidgets('custom_alert_dialog_with_checkbox reversed - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogWithCheckboxForGolden(
          themeMode: ThemeMode.light,
          reverse: true,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName(
            'custom_alert_dialog_with_checkbox',
            'reversed',
            'light',
          ),
        ),
      );
    });

    testWidgets(
        'custom_alert_dialog_with_checkbox checkbox interaction - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogWithCheckboxForGolden(
          themeMode: ThemeMode.light,
          initialCheckboxValue: false,
        ),
      );
      await tester.pumpAndSettle();

      // Tap the checkbox to check it
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName(
            'custom_alert_dialog_with_checkbox',
            'after_interaction',
            'light',
          ),
        ),
      );
    });

    testWidgets('custom_alert_dialog_with_checkbox long text - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAlertDialogWithCheckboxForGolden(
          themeMode: ThemeMode.light,
          dialogTitle: 'Important Notice',
          dialogSubTitle:
              'This is a very long message that explains the consequences of the action. '
              'Please read carefully before proceeding. This action will affect multiple '
              'items and cannot be reversed once completed.',
          checkboxLabel: 'I understand and agree to proceed',
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName(
            'custom_alert_dialog_with_checkbox',
            'long_text',
            'light',
          ),
        ),
      );
    });
  });
}
