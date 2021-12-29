import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:talawa/locator.dart' as loc;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

import '../../helpers/test_locator.dart';

bool success = false;
bool cancelled = false;

void onSuccess() {
  success = true;
}

void onCancel() {
  cancelled = true;
}

Widget createCustomAlertDialog(
    {bool reverse = false,
    String? dialogTitle,
    bool passSecondaryFunc = true}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
    navigatorObservers: [],
    locale: const Locale('en'),
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('es', 'ES'),
      const Locale('fr', 'FR'),
      const Locale('hi', 'IN'),
      const Locale('zh', 'CN'),
      const Locale('de', 'DE'),
      const Locale('ja', 'JP'),
      const Locale('pt', 'PT'),
    ],
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: TextButton(
        child: const Text('Open'),
        onPressed: () {
          navigationService.pushDialog(
            CustomAlertDialog(
              success: onSuccess,
              secondaryButtonTap: passSecondaryFunc ? onCancel : null,
              dialogSubTitle: 'Yes Boi',
              reverse: reverse,
            ),
          );
        },
      ),
    ),
  );
}

void main() {
  SizeConfig().test();
  testSetupLocator();
  group('Test for CustomAlertDialog', () {
    testWidgets('Check if the AlertDialog shows up', (tester) async {
      await tester.pumpWidget(createCustomAlertDialog());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('Check for the RaisedRoundedButtons', (tester) async {
      await tester.pumpWidget(createCustomAlertDialog());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(RaisedRoundedButton), findsNWidgets(2));
    });

    testWidgets('Check if the Confirm button works', (tester) async {
      await tester.pumpWidget(createCustomAlertDialog());
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
      await tester.pumpWidget(createCustomAlertDialog());
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
      await tester
          .pumpWidget(createCustomAlertDialog(passSecondaryFunc: false));
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      final buttonFinder = find.byType(RaisedRoundedButton);

      await tester.tap(buttonFinder.first);
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
