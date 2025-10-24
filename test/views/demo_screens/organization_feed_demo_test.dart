// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';

import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';

import 'package:talawa/views/demo_screens/organization_feed_demo.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

Widget createHomeScreen({required bool demoMode}) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    themeMode: ThemeMode.light,
    theme: TalawaTheme.lightTheme,
    home: const Scaffold(
      body: DemoOrganizationFeed(key: Key('DemoOrgFeed')),
      drawer: Drawer(
        key: Key("Drawer"),
        child: Text('Drawer'),
      ),
    ),
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
    locator<SizeConfig>().test();
    locator<GraphqlConfig>().test();
  });

  group('Home Page tests', () {
    testWidgets('Test for menu button.', (tester) async {
      await tester.pumpWidget(createHomeScreen(demoMode: true));

      await tester.pumpAndSettle(const Duration(seconds: 1));

      final menuButton = find.byIcon(Icons.menu);

      await tester.tap(menuButton);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("Drawer")), findsOneWidget);
    });
  });
}
