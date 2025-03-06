// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
// import 'package:talawa/views/after_auth_screens/add_post_page.dart';
// import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
// import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
// import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/views/main_screen.dart';
// import 'package:talawa/widgets/custom_drawer.dart';

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
            localizationsDelegates: [
              const AppLocalizationsDelegate(isTest: true),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
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

class MockMainScreenViewModel extends Mock implements MainScreenViewModel {
  @override
  int get currentPageIndex => 0;

  @override
  List<StatelessWidget> get pages => [const Test(key: Key('key'))];

  @override
  List<BottomNavigationBarItem> get navBarItems => [
        const BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'label1'),
        const BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'label2'),
      ];
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

void main() async {
  setUpAll(() async {
    testSetupLocator();
    registerServices();
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();

    locator.unregister<MainScreenViewModel>();
    locator
        .registerFactory<MainScreenViewModel>(() => MockMainScreenViewModel());
  });

  tearDownAll(() {
    unregisterServices();
  });

  group("Test for main_screen.dart", () {
    testWidgets('Test join org banner.', (tester) async {
      MainScreenViewModel.demoMode = true;
      await tester.pumpWidget(createMainScreen());
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final bannerFinder = find.byKey(const Key('banner'));

      await tester.tap(bannerFinder);

      verify(navigationService.pushScreen(Routes.setUrlScreen, arguments: ''));
    });

    testWidgets("Test if Join Org banner not visible.", (tester) async {
      MainScreenViewModel.demoMode = false;
      await tester
          .pumpWidget(createMainScreen(demoMode: MainScreenViewModel.demoMode));
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
    //
    //   // Don't call pumpAndSettle as the BottomNavigationBar
    //   // of this widget builds itself repeatedly, causing an infinite
    //   // loop; making the test never stop
    //
    //   // await tester.pumpAndSettle();
    //
    //   expect(find.byType(MainScreen), findsOneWidget);
    // });

    //
    // testWidgets("Check if changing pages works", (tester) async {
    //   mockNetworkImages(() async {
    //     await tester.pumpWidget(createMainScreen());
    //     await tester.pump();
    //
    //     await tester.tap(find.byIcon(Icons.home));
    //     await tester.pump();
    //     expect(mainScreenViewModel.currentPageIndex, 0);
    //
    //     await tester.tap(find.byIcon(Icons.event_note));
    //     await tester.pump();
    //     // expect(mainScreenViewModel.currentIndex, 1);
    //
    //     await tester.tap(find.byIcon(Icons.add_box));
    //     await tester.pump();
    //     // expect(mainScreenViewModel.currentIndex, 2);
    //
    //     await tester.tap(find.byIcon(Icons.chat_outlined));
    //     await tester.pump();
    //     // expect(mainScreenViewModel.currentIndex, 3);
    //
    //     await tester.tap(find.byIcon(Icons.account_circle));
    //     await tester.pump();
    //     // expect(mainScreenViewModel.currentIndex, 4);
    //   });
    // });
  });
}
