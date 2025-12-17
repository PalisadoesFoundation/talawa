import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/custom_theme.dart';

import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/app_config_service.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/views/main_screen.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

Widget createMainScreen({bool demoMode = true}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return BaseView<AppTheme>(
        onModelReady: (model) => model.initialize(),
        builder: (context, themeModel, child) {
          return MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: const [
              AppLocalizationsDelegate(isTest: true),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en', '')],
            key: const Key('Root'),
            theme: Provider.of<AppTheme>(context, listen: true).isdarkTheme
                ? TalawaTheme.darkTheme
                : TalawaTheme.lightTheme,
            home: Scaffold(
              body: MainScreen(
                mainScreenArgs: MainScreenArgs(
                  fromSignUp: false,
                  mainScreenIndex: 0,
                  toggleDemoMode: demoMode,
                ),
              ),
            ),
            navigatorKey: locator<NavigationService>().navigatorKey,
            onGenerateRoute: router.generateRoute,
          );
        },
      );
    },
  );
}

void main() {
  late MockMainScreenViewModel mockViewModel;

  setUpAll(() {
    testSetupLocator();
    if (!locator.isRegistered<AppConfigService>()) {
      locator.registerSingleton(AppConfigService());
    }
    registerServices();
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();
  });

  setUp(() {
    mockViewModel = MockMainScreenViewModel();
    locator.unregister<MainScreenViewModel>();
    locator.registerFactory<MainScreenViewModel>(() => mockViewModel);
  });

  tearDownAll(() {
    unregisterServices();
  });

  group("Test for main_screen.dart", () {
    testWidgets('Test MainScreen renders DemoHomeView in demo mode',
        (tester) async {
      var prev = appConfig.isDemoMode;
      try {
        appConfig.isDemoMode = true;

        // Stubbing
        when(mockViewModel.pages)
            .thenReturn([Container(key: const Key('DemoHomeView'))]);
        when(mockViewModel.navBarItems).thenReturn([
          const BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'label1'),
          const BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'label2'),
        ]);
        when(mockViewModel.currentPageIndex).thenReturn(0);
        when(mockViewModel.scaffoldKey).thenReturn(GlobalKey<ScaffoldState>());
        // Stub methods to do nothing
        // We can't easily stub void methods with Mockito 5 without generate mocks, but 'Mock' class allows it if we don't call verify?
        // Actually, if it's a manual mock extending Mock, it returns null for void methods by default (or throws if strict).
        // But MockMainScreenViewModel extends Mock (Mockito).
        // We need to make sure it doesn't throw.

        await tester.pumpWidget(createMainScreen(demoMode: true));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('DemoHomeView')), findsOneWidget);
      } finally {
        appConfig.isDemoMode = prev;
      }
    });

    testWidgets('Testing Main Screen for normal mode',
        (WidgetTester tester) async {
      appConfig.isDemoMode = false;

      // Stubbing for normal mode
      when(mockViewModel.pages)
          .thenReturn([Container(key: const Key('HomeView'))]);
      when(mockViewModel.navBarItems).thenReturn([
        const BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'label1'),
        const BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'label2'),
      ]);
      when(mockViewModel.currentPageIndex).thenReturn(0);
      when(mockViewModel.scaffoldKey).thenReturn(GlobalKey<ScaffoldState>());

      await tester.pumpWidget(createMainScreen(demoMode: appConfig.isDemoMode));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final bannerFinder = find.byKey(const Key('banner'));
      expect(bannerFinder, findsNothing);
    });
  });
}
