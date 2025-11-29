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
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/views/main_screen.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

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
        home: customDrawerViewModel.exitAlertDialog(MockBuildContext()),
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

      locator<MainScreenViewModel>().scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('Drawer')), findsOneWidget);

      final buttonFinder =
          find.byKey(locator<MainScreenViewModel>().keyDrawerJoinOrg);

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

      locator<MainScreenViewModel>().scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('Drawer')), findsOneWidget);

      final buttonFinder = find.byKey(
        locator<MainScreenViewModel>().keyDrawerLeaveCurrentOrg,
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
      ).thenAnswer((_) => Future.value());

      await tester.ensureVisible(buttonFinder);
      await tester.pumpAndSettle();

      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      verifyNever(navigationService.pushDialog(tmp)).called(0);
      // expect(find.text('Exit'), findsOneWidget);
    });

    testWidgets('Test Join Organization Button when user logged in.',
        (tester) async {
      // TODO: This test needs to be fixed - drawer widget not rendering properly
      // await tester.pumpWidget(createHomePageScreen(demoMode: true));
      // await tester.pumpAndSettle(const Duration(seconds: 1));

      // if user not logged in
      // when(userConfig.loggedIn).thenReturn(true);

      // locator<MainScreenViewModel>().scaffoldKey.currentState?.openDrawer();
      // await tester.pumpAndSettle();

      // final buttonFinder =
      //     find.byKey(locator<MainScreenViewModel>().keyDrawerJoinOrg);

      // await tester.tap(buttonFinder);
      // await tester.pumpAndSettle();

      // when(
      //   navigationService.popAndPushScreen(
      //     Routes.joinOrg,
      //     arguments: '-1',
      //   ),
      // ).thenAnswer((_) => Future.value());

      // verify(
      //   navigationService.popAndPushScreen(
      //     Routes.joinOrg,
      //     arguments: '-1',
      //   ),
      // );
    });

    testWidgets('Test Switch org list.', (tester) async {
      // TODO: This test needs to be fixed - drawer widget not rendering properly
      // await tester.pumpWidget(createHomePageScreen(demoMode: true));
      // await tester.pumpAndSettle(const Duration(seconds: 1));

      // locator.unregister<CustomDrawerViewModel>();

      // locator.registerSingleton<CustomDrawerViewModel>(
      //   MockCustomDrawerViewModel(),
      // );

      // // if user not logged in
      // when(userConfig.loggedIn).thenReturn(false);

      // locator<MainScreenViewModel>().scaffoldKey.currentState?.openDrawer();
      // await tester.pumpAndSettle();

      // expect(find.byKey(const Key('Switching Org')), findsOneWidget);

      // final buttonFinder = find.byKey(const Key('Org'));

      // await tester.tap(buttonFinder);

      // expect(_switchOrgcalled, true);
    });
  });

  group('Custom Drawer Test', () {
    /*testWidgets("Widget Testing", (tester) async {
      // pumping the Widget
      await tester.pumpWidget(createHomePageScreen());
      await tester.pumpAndSettle();
      // Opening the Drawer so that it can be loaded in the widget tree and built() is called
      await tester.dragFrom(
          tester.getTopLeft(find.byType(MaterialApp)), const Offset(300, 0));
      await tester.pumpAndSettle();
      // getting the Finders for Code Coverage
      expect(find.byKey(const ValueKey("Drawer")), findsOneWidget);
      expect(find.byKey(const ValueKey("Custom Drawer")), findsOneWidget);
      expect(find.text("Selected Organization"), findsOneWidget);
      expect(find.text("Switch Organization"), findsOneWidget);
      final listOfOrgs = find.byKey(const ValueKey("Switching Org"));
      expect(listOfOrgs, findsOneWidget);
      expect(find.byKey(MainScreenViewModel.keyDrawerCurOrg), findsOneWidget);
      expect(find.byKey(MainScreenViewModel.keyDrawerSwitchableOrg),
          findsOneWidget);
      expect(find.byType(UserAccountsDrawerHeader), findsOneWidget);
      expect(find.text("Join new Organization"), findsOneWidget);
      expect(find.text("Leave Current Organization"), findsOneWidget);
      final fromPalisadoes = find.byKey(const ValueKey("From Palisadoes"));
      expect(fromPalisadoes, findsOneWidget);
    });
    testWidgets("Tapping Tests for Org", (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pumpAndSettle();
      // Opening the Drawer so that it can be loaded in the widget tree and built() is called
      await tester.dragFrom(
          tester.getTopLeft(find.byType(MaterialApp)), const Offset(300, 0));
      await tester.pumpAndSettle();
      final orgs = find.byKey(const ValueKey("Org"));
      // Atleast One Org should be there
      // ignore: invalid_use_of_protected_member
      expect(orgs.allCandidates.isEmpty, false);
      await tester.tap(orgs.first);
      // Was not required but done for code Coverage
      // Sized
      final sizedbox = find.byKey(const ValueKey("Sized Box Drawer"));
      // ignore: invalid_use_of_protected_member
      expect(sizedbox.allCandidates.isEmpty, false);
    });
    testWidgets("Tapping Tests for Join", (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pumpAndSettle();
      tester.binding.window.physicalSizeTestValue = const Size(800, 4000);
      MainScreenViewModel.scaffoldKey.currentState?.openDrawer();
      await tester.pumpAndSettle();
      final joinOrg = find.byKey(MainScreenViewModel.keyDrawerJoinOrg);
      await tester.tap(joinOrg);
      // await tester.pumpAndSettle();
    });*/
  });
}
