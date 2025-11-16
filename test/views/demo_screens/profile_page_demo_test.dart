import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/demo_screens/profile_page_demo.dart';
import 'package:talawa/widgets/custom_avatar.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

Widget createDemoProfileScreen() {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: const [
      AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    themeMode: ThemeMode.light,
    theme: TalawaTheme.lightTheme,
    home: const Scaffold(
      key: Key('TestScaffold'),
      body: DemoProfilePage(),
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

  tearDownAll(() {
    unregisterServices();
  });

  group('Demo Profile Page tests', () {
    testWidgets('renders DemoProfilePage correctly', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen());
      await tester.pumpAndSettle();

      // Check if the AppBar is rendered
      expect(find.byKey(const Key("DemoProfilePageAppBar")), findsOneWidget);

      // Check if Profile title is displayed
      expect(find.text('Profile'), findsOneWidget);

      // Check if menu icon is present
      expect(find.byIcon(Icons.menu), findsOneWidget);

      // Check if settings icon is present
      expect(find.byIcon(Icons.settings), findsOneWidget);

      // Check if user avatar is displayed
      expect(find.byType(CustomAvatar), findsOneWidget);

      // Check if user name is displayed
      expect(find.text('User'), findsOneWidget);

      // Check if donate button is present
      expect(find.byKey(const Key('DonateUsButton')), findsOneWidget);
      expect(find.textContaining('Donate to the Community'), findsOneWidget);
    });

    testWidgets('Test for donate button opens drawer', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen());
      await tester.pumpAndSettle();

      final donateButton = find.byKey(const Key('DonateUsButton'));
      expect(donateButton, findsOneWidget);

      await tester.tap(donateButton);
      await tester.pumpAndSettle();

      // Verify drawer is opened
      expect(find.byKey(const Key("Drawer")), findsOneWidget);
    });

    testWidgets('Test for menu button opens drawer', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen());
      await tester.pumpAndSettle();

      final menuButton = find.byIcon(Icons.menu);
      expect(menuButton, findsOneWidget);

      await tester.tap(menuButton);
      await tester.pumpAndSettle();

      // Verify drawer is opened
      expect(find.byKey(const Key("Drawer")), findsOneWidget);
    });

    testWidgets('Test settings icon navigates to settings page',
        (tester) async {
      await tester.pumpWidget(createDemoProfileScreen());
      await tester.pumpAndSettle();

      final settingsIcon = find.byKey(const Key('settingIcon'));
      expect(settingsIcon, findsOneWidget);

      await tester.tap(settingsIcon);
      await tester.pumpAndSettle();

      // Verify navigation service was called
      verify(navigationService.pushScreen('/appSettingsPage')).called(1);
    });

    testWidgets('Test AppBar has correct styling', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen());
      await tester.pumpAndSettle();

      final appBar = tester.widget<AppBar>(
        find.byKey(const Key("DemoProfilePageAppBar")),
      );

      expect(appBar.backgroundColor, Colors.green);
      expect(appBar.elevation, 0.0);
      expect(appBar.centerTitle, true);
    });

    testWidgets('Test Posts tab is present', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen());
      await tester.pumpAndSettle();

      // Check if Posts tab exists
      expect(find.text('Posts'), findsOneWidget);
    });
  });
}
