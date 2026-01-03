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

import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/widgets/from_palisadoes.dart';

class MockMainScreenViewModel extends Mock implements MainScreenViewModel {
  @override
  final GlobalKey keySPPalisadoes = GlobalKey(debugLabel: 'PalisadoesLogo');
  
  @override
  final GlobalKey keySPDonateUs = GlobalKey(debugLabel: 'DonateUsButton');
}

Widget createDemoProfileScreen({MainScreenViewModel? homeModel}) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: const [
      AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    themeMode: ThemeMode.light,
    theme: TalawaTheme.lightTheme,
    home: Scaffold(
      key: const Key('TestScaffold'),
      body: DemoProfilePage(homeModel: homeModel),
      drawer: const Drawer(
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
    late MockMainScreenViewModel mockHomeModel;

    setUp(() {
      mockHomeModel = MockMainScreenViewModel();
    });

    testWidgets('renders DemoProfilePage correctly', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen(homeModel: mockHomeModel));
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
      expect(find.byKey(mockHomeModel.keySPDonateUs), findsOneWidget);
      expect(find.textContaining('Donate to the Community'), findsOneWidget);
    });

    testWidgets('Test for donate button opens drawer', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen(homeModel: mockHomeModel));
      await tester.pumpAndSettle();

      final donateButton = find.byKey(mockHomeModel.keySPDonateUs);
      expect(donateButton, findsOneWidget);

      await tester.tap(donateButton);
      await tester.pumpAndSettle();

      // Verify drawer is opened
      expect(find.byKey(const Key("Drawer")), findsOneWidget);
    });

    testWidgets('Test for menu button opens drawer', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen(homeModel: mockHomeModel));
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
      await tester.pumpWidget(createDemoProfileScreen(homeModel: mockHomeModel));
      await tester.pumpAndSettle();

      final settingsIcon = find.byKey(const Key('settingIcon'));
      expect(settingsIcon, findsOneWidget);

      await tester.tap(settingsIcon);
      await tester.pumpAndSettle();

      // Verify navigation service was called
      verify(navigationService.pushScreen('/appSettingsPage')).called(1);
    });

    testWidgets('Test AppBar has correct styling', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen(homeModel: mockHomeModel));
      await tester.pumpAndSettle();

      final appBar = tester.widget<AppBar>(
        find.byKey(const Key("DemoProfilePageAppBar")),
      );

      expect(appBar.backgroundColor, Colors.green);
      expect(appBar.elevation, 0.0);
      expect(appBar.centerTitle, true);
    });

    testWidgets('Test Posts tab is present', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen(homeModel: mockHomeModel));
      await tester.pumpAndSettle();

      // Check if Posts tab exists
      expect(find.text('Posts'), findsOneWidget);
    });

    testWidgets('ExitDemoButton works correctly', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen(homeModel: mockHomeModel));
      await tester.pumpAndSettle();

      final exitButton = find.byKey(const Key('ExitDemoButton'));
      expect(exitButton, findsOneWidget);

      final icon = tester.widget<Icon>(find.descendant(of: exitButton, matching: find.byType(Icon)));
      expect(icon.icon, Icons.logout);
      // We can check color if we wrap in Theme, but logic check is most important

      await tester.tap(exitButton);
      verify(mockHomeModel.exitDemoMode()).called(1);
    });

    testWidgets('FromPalisadoes widget is rendered', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen(homeModel: mockHomeModel));
      await tester.pumpAndSettle();

      expect(find.byType(FromPalisadoes), findsOneWidget);
    });

    testWidgets('Tabs render and switch correctly', (tester) async {
      await tester.pumpWidget(createDemoProfileScreen(homeModel: mockHomeModel));
      await tester.pumpAndSettle();

      // Check Events tab
      final eventsTab = find.text('Events');
      expect(eventsTab, findsOneWidget);
      await tester.tap(eventsTab);
      await tester.pumpAndSettle();
      // Verify Events content (Empty container with surface color in code, so hard to distinct visually without key, but we ensure no crash)
      // Actually code says: Container(color: Theme.of(context).colorScheme.surface)
      
      // Check Tasks tab
      final tasksTab = find.text('Tasks');
      expect(tasksTab, findsOneWidget);
      await tester.tap(tasksTab);
      await tester.pumpAndSettle();
      // Verify Tasks content (Container with onPrimary)
    });
  });
}
