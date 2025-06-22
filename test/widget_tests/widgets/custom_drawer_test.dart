// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/graphql_config.dart';
// import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
// import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/main_screen.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
// import 'package:talawa/widgets/custom_alert_dialog.dart';
import '../../helpers/test_helpers.dart';
// import '../../helpers/test_helpers.mocks.dart';
import '../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

bool _switchOrgcalled = false;

class MockCustomDrawerViewModel extends Mock implements CustomDrawerViewModel {
  final _scrollController = ScrollController();
  @override
  ScrollController get controller => _scrollController;
  @override
  List<OrgInfo> get switchAbleOrg {
    print("hi");
    return [OrgInfo(id: 'test1', name: 'name')];
  }

  @override
  OrgInfo get selectedOrg => OrgInfo(id: 'test1', name: 'name');
  @override
  void switchOrg(OrgInfo orginfo) {
    _switchOrgcalled = true;
  }
}

class MockScrollController extends Mock implements ScrollController {
  @override
  ScrollPosition get position => MockScrollPosition();
}

class MockScrollPosition extends Mock implements ScrollPosition {}

Widget createHomePageScreen({required bool demoMode}) {
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
        mainScreenIndex: 0,
        fromSignUp: false,
        toggleDemoMode: demoMode,
      ),
    ),
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();

    locator<SizeConfig>().test();
    locator<GraphqlConfig>().test();
    registerServices();
  });
  // setUp(() {
  // });

  tearDownAll(() {
    unregisterServices();
  });

  group('Exit Button', () {
    testWidgets("Tapping Tests for Exit", (tester) async {
      final customDrawerViewModel = CustomDrawerViewModel();

      final Widget buildAlertDialog = MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        themeMode: ThemeMode.light,
        theme: TalawaTheme.lightTheme,
        home: customDrawerViewModel.exitAlertDialog(),
      );

      await tester.pumpWidget(buildAlertDialog);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final exitDialog = find.byKey(const Key("Exit?"));
      await tester.tap(find.text('Exit'));

      expect(exitDialog, findsOneWidget);
    });
  });

  group('Test Organization action Buttons', () {
    testWidgets('Test Join Organization Button when user not logged in.',
        (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // if user not logged in
      when(userConfig.loggedIn).thenReturn(false);

      MainScreenViewModel.scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('Drawer')), findsOneWidget);

      final buttonFinder = find.byKey(MainScreenViewModel.keyDrawerJoinOrg);

      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      when(
        navigationService.popAndPushScreen(
          Routes.setUrlScreen,
          arguments: '',
        ),
      ).thenAnswer((_) async {});

      verify(
        navigationService.popAndPushScreen(
          Routes.setUrlScreen,
          arguments: '',
        ),
      );
    });

    testWidgets('Test leave current Organization Button.', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // if user not logged in
      when(userConfig.loggedIn).thenReturn(true);

      MainScreenViewModel.scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('Drawer')), findsOneWidget);

      final buttonFinder = find.byKey(
        MainScreenViewModel.keyDrawerLeaveCurrentOrg,
      );

      final tmp = CustomAlertDialog(
        key: const Key("Exit?"),
        reverse: true,
        dialogSubTitle: 'Are you sure you want to exit this organization?',
        successText: 'Exit',
        success: () {
          //Exit org
        },
      );

      when(
        navigationService.pushDialog(tmp),
      ).thenAnswer((realInvocation) {});

      await tester.ensureVisible(buttonFinder);
      await tester.pumpAndSettle();

      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      verifyNever(navigationService.pushDialog(tmp)).called(0);
      // expect(find.text('Exit'), findsOneWidget);
    });

    testWidgets('Test Join Organization Button when user logged in.',
        (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // if user not logged in
      when(userConfig.loggedIn).thenReturn(true);

      MainScreenViewModel.scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();

      final buttonFinder = find.byKey(MainScreenViewModel.keyDrawerJoinOrg);

      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      when(
        navigationService.popAndPushScreen(
          Routes.joinOrg,
          arguments: '-1',
        ),
      ).thenAnswer((_) async {});

      verify(
        navigationService.popAndPushScreen(
          Routes.joinOrg,
          arguments: '-1',
        ),
      );
    });

    testWidgets('Test Switch org list.', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      locator.unregister<CustomDrawerViewModel>();

      locator.registerSingleton<CustomDrawerViewModel>(
        MockCustomDrawerViewModel(),
      );

      // if user not logged in
      when(userConfig.loggedIn).thenReturn(false);

      MainScreenViewModel.scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('Switching Org')), findsOneWidget);

      final buttonFinder = find.byKey(const Key('Org'));

      await tester.tap(buttonFinder);

      expect(_switchOrgcalled, true);
    });
  });
}
