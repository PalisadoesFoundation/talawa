import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

bool success = false;
bool cancelled = false;

void onSuccess() {
  success = true;
}

void onCancel() {
  cancelled = true;
}

Widget createCustomAlertDialog({bool reverse = false, String? dialogTitle}) {
  return MaterialApp(
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
    home: CustomAlertDialog(
      success: onSuccess,
      secondaryButtonTap: onCancel,
      dialogSubTitle: 'Yes Boi',
      reverse: reverse,
    ),
  );
}

void main() {
  SizeConfig().test();
  group('Test for CustomAlertDialog', () {
    testWidgets('Check if the AlertDialog shows up', (tester) async {
      await tester.pumpWidget(createCustomAlertDialog());
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('Check for the RaisedRoundedButtons', (tester) async {
      await tester.pumpWidget(createCustomAlertDialog());
      await tester.pump();

      expect(find.byType(RaisedRoundedButton), findsNWidgets(2));
    });

    testWidgets('Check if the buttons work', (tester) async {
      await tester.pumpWidget(createCustomAlertDialog());
      await tester.pump();

      final buttonFinder = find.byType(RaisedRoundedButton);
      // final primaryButton = tester.firstWidget(buttonFinder);

      // await tester.tap(buttonFinder.first);
      await tester.tap(buttonFinder.last);
      await tester.pump();

      expect(success, true);
    });
  });
}
