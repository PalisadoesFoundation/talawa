// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/post_detailed_page.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

const longString =
    'iloveicecreamiloveicecreamiloveicecreamiloveicecreamiloveicecreamiloveicecreamiloveicecreamiloveicecreamiloveicecreamiloveicecreamiloveicecreamil888890';
const shortString = 'I love ice-cream';
Widget createDescriptionTextWidgetWithShortText() {
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
    home: const Scaffold(
      body: DescriptionTextWidget(
        text: shortString,
      ),
    ),
  );
}

Widget createDescriptionTextWidgetWithLongText() {
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
    home: const Scaffold(
      body: DescriptionTextWidget(
        text: longString,
      ),
    ),
  );
}

void main() {
  SizeConfig().test();
  locator.registerSingleton(NavigationService());

  setUp(() {
    registerServices();
    registerViewModels();
  });

  tearDown(() {
    unregisterViewModels();
    unregisterServices();
  });
  group('Description Widget test', () {
    testWidgets(
        "Test if Description text Widget is displayed with text less than 150",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createDescriptionTextWidgetWithShortText());
        await tester.pump();
        expect(find.byType(DescriptionTextWidget), findsOneWidget);
      });
    });
    testWidgets(
        "Test if Description text Widget is displayed with text more than 150",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createDescriptionTextWidgetWithLongText());
        await tester.pump();
        expect(find.byType(DescriptionTextWidget), findsOneWidget);
      });
    });
    testWidgets("Test if 1 text Widget is displayed with text less than 150",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createDescriptionTextWidgetWithShortText());
        await tester.pump();
        expect(find.byType(Text), findsNWidgets(1));
      });
    });

    testWidgets("Test if 2 text Widget is displayed with text more than 150",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createDescriptionTextWidgetWithLongText());
        await tester.pump();
        expect(find.byType(Text), findsNWidgets(2));
      });
    });

    testWidgets(
        "Test if text Widget display content properly with text more than 150",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createDescriptionTextWidgetWithLongText());
        await tester.pump();
        expect(find.text('${longString.substring(0, 150)}...'), findsOneWidget);
      });
    });

    testWidgets("Test if show more button is working",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createDescriptionTextWidgetWithLongText());
        await tester.pump();
        final showLessMore = find.byType(InkWell);
        await tester.tap(showLessMore);
        await tester.pump();
        //showing more
        expect(find.text(longString), findsOneWidget);
      });
    });
    testWidgets("Test if show less button is working",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createDescriptionTextWidgetWithLongText());
        await tester.pump();
        final showLessMore = find.byType(InkWell);
        await tester.tap(showLessMore);
        await tester.pump();

        await tester.tap(showLessMore);
        await tester.pump();
        //showing less
        expect(find.text('${longString.substring(0, 150)}...'), findsOneWidget);
      });
    });
  });
}
