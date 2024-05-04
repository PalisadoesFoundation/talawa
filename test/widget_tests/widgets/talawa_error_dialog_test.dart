// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/talawa_error_dialog.dart';

import '../../helpers/test_locator.dart';

Widget createTalawaErrorWidget1({
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
          navigationService.showTalawaErrorDialog(
            "Test Error",
            MessageType.error,
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
          navigationService.showTalawaErrorDialog(
            "Test Error",
            MessageType.warning,
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
          navigationService.showTalawaErrorDialog(
            "Test Error",
            MessageType.info,
          );
        },
      ),
    ),
  );
}

Widget createTalawaErrorWidget4({
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
          navigationService.showTalawaErrorDialog(
            "Test Error",
            MessageType.random,
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
    testWidgets('Check if the Error Widget shows up(error)', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget1());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);
    });
    testWidgets('Check if the Error Widget shows up(random)', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget4());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);
    });
    testWidgets('Check if the Error title shows up(error)', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget1());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);

      final finder = find.text('Error');
      expect(finder, findsOneWidget);
    });

    testWidgets('Check if the Error Widget text shows up(error)',
        (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget1());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);

      final finder = find.text('Test Error');
      expect(finder, findsOneWidget);
    });

    testWidgets('Check if the Error Widget icon shows up(error)',
        (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget1());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);

      final finder = find.byType(SvgPicture);
      expect(finder, findsOneWidget);
    });

    testWidgets('Check if the close Button is working', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget1());
      await tester.pump();

      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.textContaining('Dismiss'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsNothing);
    });
    testWidgets('Check if the Error text shows up(warning)', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget2());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);
    });
    testWidgets('Check if the Error text shows up(warning)', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget2());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);

      final finder = find.text('Warning');
      expect(finder, findsOneWidget);
    });
    testWidgets('Check if the Error Widget text shows up(warning)',
        (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget2());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);

      final finder = find.text('Test Error');
      expect(finder, findsOneWidget);
    });
    testWidgets('Check if the Error Widget icon shows up(warning)',
        (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget2());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);

      final finder = find.byType(SvgPicture);
      expect(finder, findsOneWidget);
    });

    testWidgets('Check if the close Button is working', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget2());
      await tester.pump();

      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.textContaining('Dismiss'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsNothing);
    });
    testWidgets('Check if the Error Widget shows up (info)', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget3());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);
    });
    testWidgets('Check if the Error Widget shows up (info)', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget3());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);
      final finder = find.text('Information');
      expect(finder, findsOneWidget);
    });
    testWidgets('Check if the Error Widget shows up (info)', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget3());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);

      final finder = find.text('Test Error');

      expect(finder, findsOneWidget);
    });

    testWidgets('Check if the Error Widget icon shows up (info)',
        (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget3());
      await tester.pump();
      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsOneWidget);

      final finder = find.byType(SvgPicture);
      expect(finder, findsOneWidget);
    });

    testWidgets('Check if the close Button is working', (tester) async {
      await tester.pumpWidget(createTalawaErrorWidget3());
      await tester.pump();

      await tester.tap(find.textContaining('Open'));
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.textContaining('Close'));
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TalawaErrorDialog), findsNothing);
    });
  });
}
