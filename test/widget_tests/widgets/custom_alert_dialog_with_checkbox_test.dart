import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/custom_alert_dialog_with_checkbox.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

import '../../helpers/test_locator.dart';

/// success variable for checkBox.
bool success = false;

/// cancellation variabe for checkBox.
bool cancelled = false;

/// Checkbox variable.
bool checkboxValue = false;

/// Function to run on pressing success.
///
/// Running this function will idicate that success is chosed and success is working properly.
///
/// **params**:
/// * `value`: Represents the new value of check
///
/// **returns**:
///   None
void onSuccess(bool? value) {
  success = true;
  checkboxValue = value!;
}

/// Function to run on pressing cancellation.
///
/// Running this function will idicate that cancel is chosed and cancellation is working properly.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void onCancel() {
  cancelled = true;
}

/// Function to run on pressing cancellation.
///
/// Running this function will idicate that cancel is chosed and cancellation is working properly.
///
/// **params**:
/// * `reverse`: Indicates whether the order of action buttons should be reversed.
/// * `dialogTitle`: Title displayed in the dialog.
/// * `initialCheckboxValue`: Initial value for the checkbox.
/// * `passSecondaryFunc`: Indicates whether to pass secondary function.
///
/// **returns**:
/// * `Widget`: Widget that we will be using for testing
Widget createCustomAlertDialogWithCheckbox({
  bool reverse = false,
  String? dialogTitle,
  bool initialCheckboxValue = false,
  bool passSecondaryFunc = true,
}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
    navigatorObservers: [],
    locale: const Locale('en'),
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('es', 'ES'),
      Locale('fr', 'FR'),
      Locale('hi', 'IN'),
      Locale('zh', 'CN'),
      Locale('de', 'DE'),
      Locale('ja', 'JP'),
      Locale('pt', 'PT'),
    ],
    localizationsDelegates: const [
      AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: TextButton(
        child: const Text('Open'),
        onPressed: () {
          navigationService.pushDialog(
            CustomAlertDialogWithCheckbox(
              success: onSuccess,
              secondaryButtonTap: passSecondaryFunc ? onCancel : null,
              dialogSubTitle: 'This is a subtitle',
              checkboxLabel: 'Remember me',
              reverse: reverse,
              initialCheckboxValue: initialCheckboxValue,
            ),
          );
        },
      ),
    ),
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
  });

  group('Test for CustomAlertDialogWithCheckbox', () {
    testWidgets('Check if the AlertDialog shows up', (tester) async {
      await tester.pumpWidget(createCustomAlertDialogWithCheckbox());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('Check for the RaisedRoundedButtons', (tester) async {
      await tester.pumpWidget(createCustomAlertDialogWithCheckbox());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(RaisedRoundedButton), findsNWidgets(2));
    });

    testWidgets('Check if the Confirm button works', (tester) async {
      await tester.pumpWidget(createCustomAlertDialogWithCheckbox());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      final buttonFinder = find.byType(RaisedRoundedButton);

      await tester.tap(buttonFinder.last);
      await tester.pump();

      expect(success, true);
    });

    testWidgets('Check if the Cancel button works (with secondary func)',
        (tester) async {
      await tester.pumpWidget(createCustomAlertDialogWithCheckbox());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      final buttonFinder = find.byType(RaisedRoundedButton);

      await tester.tap(buttonFinder.first);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('Check if the Cancel button works (without secondary func)',
        (tester) async {
      await tester.pumpWidget(
        createCustomAlertDialogWithCheckbox(passSecondaryFunc: false),
      );
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      final buttonFinder = find.byType(RaisedRoundedButton);

      await tester.tap(buttonFinder.first);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('Check if the checkbox is present and clickable',
        (tester) async {
      await tester.pumpWidget(
        createCustomAlertDialogWithCheckbox(initialCheckboxValue: false),
      );
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      final checkboxFinder = find.byType(Checkbox);

      expect(checkboxFinder, findsOneWidget);

      await tester.tap(checkboxFinder);
      await tester.pump();

      final checkbox = tester.firstWidget<Checkbox>(checkboxFinder);
      expect(checkbox.value, true);
    });

    testWidgets('Check if the checkbox value is passed to success function',
        (tester) async {
      await tester.pumpWidget(
        createCustomAlertDialogWithCheckbox(initialCheckboxValue: false),
      );
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      final checkboxFinder = find.byType(Checkbox);
      await tester.tap(checkboxFinder);
      await tester.pump();

      final buttonFinder = find.byType(RaisedRoundedButton);
      await tester.tap(buttonFinder.last);
      await tester.pump();

      expect(checkboxValue, true);
    });
  });
}
