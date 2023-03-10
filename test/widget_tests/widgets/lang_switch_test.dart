// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/views/pre_auth_screens/select_language.dart';
import 'package:talawa/widgets/lang_switch.dart';

import '../../helpers/test_locator.dart';

Widget createLanguageTile() {
  return BaseView<AppLanguage>(
    onModelReady: (_) => _.initialize(),
    builder: (_, __, ___) => MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      home: const Scaffold(
        body: LanguageTile(),
      ),
    ),
  );
}

void main() {
  testSetupLocator();
  sizeConfig.test();
  group('Test for LanguageTile', () {
    testWidgets('Check if LanguageTile widget shows up', (tester) async {
      await tester.pumpWidget(createLanguageTile());
      await tester.pump();

      expect(find.byType(ListTile), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('Tapping on TextButton pushes SelectLanguage widget',
        (tester) async {
      await tester.pumpWidget(createLanguageTile());
      await tester.pump();

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(find.byType(SelectLanguage), findsOneWidget);
    });
  });
}
