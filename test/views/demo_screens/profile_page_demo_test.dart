// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/main_screen.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

Widget createProfileScreen({required bool demoMode}) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    themeMode: ThemeMode.light,
    theme: TalawaTheme.lightTheme,
    home: MainScreen(
      key: const Key('MainScreen'),
      mainScreenArgs: MainScreenArgs(
        mainScreenIndex: 2,
        fromSignUp: false,
        toggleDemoMode: demoMode,
      ),
    ),
  );
}

void main() async {
  testSetupLocator();

  group('Profile Page tests', () {
    setUpAll(() {
      registerServices();
      locator<SizeConfig>().test();
      locator<GraphqlConfig>().test();
    });
    testWidgets('Test for donate button.', (tester) async {
      await tester.pumpWidget(createProfileScreen(demoMode: true));

      await tester.pumpAndSettle(const Duration(seconds: 1));

      final donateButton = find.textContaining('Donate to the Community');

      await tester.tap(donateButton);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("Drawer")), findsOneWidget);
    });

    testWidgets('Test for menu button.', (tester) async {
      await tester.pumpWidget(createProfileScreen(demoMode: true));

      await tester.pumpAndSettle(const Duration(seconds: 1));

      final menuButton = find.byIcon(Icons.menu);

      await tester.tap(menuButton);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("Drawer")), findsOneWidget);
    });

    testWidgets('check if settings page is opening up', (tester) async {
      await tester.pumpWidget(
        createProfileScreen(
          demoMode: true,
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final settingsIcon = find.byKey(const Key('settingIcon'));
      await tester.tap(settingsIcon);
      verify(navigationService.pushScreen('/appSettingsPage'));
    });
  });
}
