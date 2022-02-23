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
import 'package:talawa/widgets/custom_drawer.dart';
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

  group('Custom Drawer Test', () {
    testWidgets("Testing if Custom Drawer Opens", (tester) async {
      await tester.pumpWidget(createHomePageScreen());
      await tester.pumpAndSettle();

      await tester.dragFrom(
          tester.getTopLeft(find.byType(MaterialApp)), const Offset(300, 0));
      await tester.pumpAndSettle();

      final whatsapp = find.byKey(const ValueKey("Drawer"));

      print(whatsapp);
      // expect(find.byType(BottomNavigationBar), findsOneWidget);
    });
  });

  // group('Custom Drawer Model testing -', () {
  //   test('check if switchOrg is working with mock joined orgs', () async {
  //     //Intializing a mock model with mockBuildContext
  //     await model.initialize(mainscreenModel, mockBuildContext);
  //     //Storing the first switchable org in mockOrgInfo
  //     final OrgInfo mockChangeOrgTo = model.switchAbleOrg.first;

  //     //Calling the switchOrg function
  //     model.switchOrg(mockChangeOrgTo);

  //     //expecting the selected org will be equal to the mockChangeOrgto returns true
  //     expect(model.selectedOrg, mockChangeOrgTo);
  //   });
  // });

  // test('check if switchOrg is working with zero switchable orgs', () async {
  //   print(userConfig.currentOrg);
  // }
}
