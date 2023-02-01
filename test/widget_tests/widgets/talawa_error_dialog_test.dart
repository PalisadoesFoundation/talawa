import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/talawa_error_dialog.dart';

import '../../helpers/test_locator.dart';

Widget createTalawaErrorWidget({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
}) {
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
          navigationService.showTalawaErrorDialog("Test Error");
        },
      ),
    ),
  );
}

void main() {
  SizeConfig().test();
  testSetupLocator();
  group('Test for TalawaErrorWidget', () {
    testWidgets('Check if the Error Widget shows up', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);
    });

    testWidgets('Check if the close Button is working', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget());
      await tester.pump();

      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.textContaining('Close'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsNothing);
    });
  });
}
