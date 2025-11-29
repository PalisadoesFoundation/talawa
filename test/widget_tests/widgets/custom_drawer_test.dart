// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/views/main_screen.dart';
import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {
  @override
  DiagnosticsNode describeElement(
    String name, {
    DiagnosticsTreeStyle style = DiagnosticsTreeStyle.errorProperty,
  }) {
    return DiagnosticsNode.message('');
  }

  @override
  Widget get widget => const SizedBox();

  @override
  bool get debugDoingBuild => false;
}

class MockMainScreenViewModel extends Mock implements MainScreenViewModel {}

class MockCustomDrawerViewModel extends Mock implements CustomDrawerViewModel {
  final List<OrgInfo> switchAbleOrgValue = [];
  OrgInfo? selectedOrgValue;
  final ScrollController controllerValue = ScrollController();

  @override
  List<OrgInfo> get switchAbleOrg => switchAbleOrgValue;

  @override
  OrgInfo? get selectedOrg => selectedOrgValue;

  @override
  ScrollController get controller => controllerValue;
}

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

  tearDownAll(() {
    unregisterServices();
  });

  group('Test Organization action Buttons', () {
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
    testWidgets('Test main screen renders with drawer capability',
        (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify main screen rendered
      expect(find.byKey(const Key('MainScreen')), findsOneWidget);
    });

    testWidgets('Test main screen with demo mode enabled', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify main screen rendered in demo mode
      expect(find.byType(MainScreen), findsOneWidget);
    });

    testWidgets('Test main screen initializes scaffold', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify scaffold exists for drawer functionality
      // MainScreen contains a Scaffold with key 'MainScaffold'
      expect(find.byKey(const Key('MainScaffold')), findsOneWidget);
    });

    testWidgets('Test main screen with custom arguments', (tester) async {
      await tester.pumpWidget(createHomePageScreen(demoMode: true));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify MaterialApp renders
      expect(find.byType(MaterialApp), findsOneWidget);
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
