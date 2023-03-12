// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/talawa_error_snackbar.dart';

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
          navigationService.showTalawaErrorSnackBar(
            "Test Error",
            MessageType.warning,
          );
        },
      ),
    ),
  );
}

Widget createTalawaErrorWidget2({
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
          navigationService.showTalawaErrorSnackBar(
            "Test Error",
            MessageType.error,
          );
        },
      ),
    ),
  );
}

Widget createTalawaErrorWidget3({
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
          navigationService.showTalawaErrorSnackBar(
            "Test Error",
            MessageType.info,
          );
        },
      ),
    ),
  );
}

void main() {
  SizeConfig().test();
  testSetupLocator();
  group('Test for TalawaErrorWidget', () {
    testWidgets('Check if the Snackbar shows up in warning form',
        (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget());
      await tester.pump();

      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorSnackBar), findsOneWidget);
    });
    testWidgets('Check if the Snackbar shows up in error form', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget2());
      await tester.pump();

      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorSnackBar), findsOneWidget);
    });
    testWidgets('Check if the Snackbar shows up in info form', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget3());
      await tester.pump();

      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorSnackBar), findsOneWidget);
    });
    testWidgets("Check if the Snackbar's text shows up in warning form",
        (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget());
      await tester.pump();

      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorSnackBar), findsOneWidget);

      final errorMesgFinder = find.text('Test Error');

      expect(errorMesgFinder, findsOneWidget);
    });
    testWidgets('Check if the Snackbar"s text shows up in error form',
        (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget2());
      await tester.pump();

      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorSnackBar), findsOneWidget);

      final errorMesgFinder = find.text('Test Error');

      expect(errorMesgFinder, findsOneWidget);
    });
    testWidgets('Check if the Snackbar"s text shows up in info form',
        (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget3());
      await tester.pump();

      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorSnackBar), findsOneWidget);

      final errorMesgFinder = find.text('Test Error');

      expect(errorMesgFinder, findsOneWidget);
    });

    testWidgets('Check if the Snackbar icon shows up in info form',
        (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget3());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorSnackBar), findsOneWidget);

      final iconFinder = find.byIcon(Icons.info_outline);

      expect(iconFinder, findsOneWidget);
    });

    testWidgets('Check if the Snackbar shows up in error form', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget2());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(TalawaErrorSnackBar), findsOneWidget);

      final iconFinder = find.byIcon(Icons.error);

      expect(iconFinder, findsOneWidget);
    });
    testWidgets('Check if the Snackbar shows up in warning form',
        (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorSnackBar), findsOneWidget);

      final iconFinder = find.byIcon(Icons.error);

      expect(iconFinder, findsOneWidget);
    });
  });
}
