import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/custom_alert_dialog_with_checkbox.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

import '../../helpers/test_locator.dart';

/// Test fixture for all the variables used to test the widget.
class TestFixture {
  /// success variable for checkBox.
  bool success = false;

  /// cancellation variable for checkBox.
  bool cancelled = false;

  /// true when check box is ticked and false when check is not ticked.
  bool checkboxValue = false;

  /// Function to reset all values.
  ///
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None

  void reset() {
    success = false;
    cancelled = false;
    checkboxValue = false;
  }

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
    checkboxValue = value ?? false;
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
}

/// Function to run on pressing cancellation.
///
/// Running this function will idicate that cancel is chosed and cancellation is working properly.
///
/// **params**:
/// * `fixture`: fixture of variable for testing
/// * `reverse`: Indicates whether the order of action buttons should be reversed.
/// * `dialogTitle`: Title displayed in the dialog.
/// * `initialCheckboxValue`: Initial value for the checkbox.
/// * `passSecondaryFunc`: Indicates whether to pass secondary function.
///
/// **returns**:
/// * `Widget`: Widget that we will be using for testing
Widget createCustomAlertDialogWithCheckbox({
  required TestFixture fixture,
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
              success: fixture.onSuccess,
              secondaryButtonTap: passSecondaryFunc ? fixture.onCancel : null,
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
  final fixture = TestFixture();

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
  });

  setUp(() {
    fixture.reset();
  });

  group('Test for CustomAlertDialogWithCheckbox', () {
    testWidgets('Check if the AlertDialog shows up', (tester) async {
      await tester
          .pumpWidget(createCustomAlertDialogWithCheckbox(fixture: fixture));
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('Check for the RaisedRoundedButtons', (tester) async {
      await tester
          .pumpWidget(createCustomAlertDialogWithCheckbox(fixture: fixture));
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(RaisedRoundedButton), findsNWidgets(2));
    });

    testWidgets('Check if the Confirm button works', (tester) async {
      await tester
          .pumpWidget(createCustomAlertDialogWithCheckbox(fixture: fixture));
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      final buttonFinder = find.byType(RaisedRoundedButton);

      await tester.tap(buttonFinder.last);
      await tester.pump();

      expect(fixture.success, true);
    });

    testWidgets('Check if the Cancel button works (with secondary func)',
        (tester) async {
      await tester
          .pumpWidget(createCustomAlertDialogWithCheckbox(fixture: fixture));
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
        createCustomAlertDialogWithCheckbox(
          fixture: fixture,
          passSecondaryFunc: false,
        ),
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
        createCustomAlertDialogWithCheckbox(
          fixture: fixture,
          initialCheckboxValue: false,
        ),
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
        createCustomAlertDialogWithCheckbox(
          fixture: fixture,
          initialCheckboxValue: false,
        ),
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

      expect(fixture.checkboxValue, true);
    });

    testWidgets('Check if reverse parameter changes button order',
        (tester) async {
      await tester.pumpWidget(
        createCustomAlertDialogWithCheckbox(
          fixture: fixture,
          reverse: true,
        ),
      );
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      final buttons = find.byType(RaisedRoundedButton);
      expect(buttons, findsNWidgets(2));

      // When reversed, the Confirm button should be first and Close button second
      expect(
        find.descendant(
          of: buttons.first,
          matching: find.text('Confirm'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: buttons.last,
          matching: find.text('Close'),
        ),
        findsOneWidget,
      );
    });
  });
}
