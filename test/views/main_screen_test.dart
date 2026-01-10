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
      final prev = appConfig.isDemoMode;
      try {
        appConfig.isDemoMode = true;

        // Stubbing (navBarItems and scaffoldKey are handled by MockMainScreenViewModel overrides)
        when(mockViewModel.pages)
            .thenReturn([Container(key: const Key('DemoHomeView'))]);
        when(mockViewModel.currentPageIndex).thenReturn(0);

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

      // Stubbing (navBarItems and scaffoldKey are handled by MockMainScreenViewModel overrides)
      when(mockViewModel.pages)
          .thenReturn([Container(key: const Key('HomeView'))]);
      when(mockViewModel.currentPageIndex).thenReturn(0);

      await tester.pumpWidget(createMainScreen(demoMode: appConfig.isDemoMode));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final bannerFinder = find.byKey(const Key('banner'));
      expect(bannerFinder, findsNothing);
    });
  });
}
