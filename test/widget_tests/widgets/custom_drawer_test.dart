import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/main_screen.dart';
import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

Widget createHomePageScreen() {
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
      mainScreenArgs: MainScreenArgs(mainScreenIndex: 0),
    ),
  );
}

void main() {
  testSetupLocator();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
    locator<GraphqlConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });
  // MainScreenViewModel model = MainScreenViewModel();
  // const MaterialApp temp = MaterialApp();
  // temp.

  // group('Custom Drawer Test', () {
  testWidgets("Custom Drawer Test", (tester) async {
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
    final orgs = find.byKey(const ValueKey("Org"));

    // Atleast One Org should be there
    // ignore: invalid_use_of_protected_member
    expect(orgs.allCandidates.isEmpty, false);
    expect(listOfOrgs, findsOneWidget);

    expect(find.byKey(MainScreenViewModel.keyDrawerCurOrg), findsOneWidget);
    expect(
        find.byKey(MainScreenViewModel.keyDrawerSwitchableOrg), findsOneWidget);

    expect(find.byType(UserAccountsDrawerHeader), findsOneWidget);

    expect(find.text("Join new Organization"), findsOneWidget);
    expect(find.text("Leave Current Organization"), findsOneWidget);

    final fromPalisadoes = find.byKey(const ValueKey("From Palisadoes"));
    expect(fromPalisadoes, findsOneWidget);
  });
  // });
}
