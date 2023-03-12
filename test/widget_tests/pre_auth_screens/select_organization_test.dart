// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/pre_auth_screens/select_organization.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/organization_list.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/signup_progress_indicator.dart';

import '../../helpers/test_helpers.dart';

void main() {
  const Key selectOrgKey = Key("selectOrgKey");
  const String orgID = "-1";
  Widget createSelectOrgPage({String? customorgID}) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      themeMode: ThemeMode.light,
      theme: TalawaTheme.lightTheme,
      home: SelectOrganization(
        key: selectOrgKey,
        selectedOrgId: customorgID ?? orgID,
      ),
    );
  }

  SizeConfig().test();

  group("Select Organization Test", () {
    setUp(() {
      registerViewModels();
      registerServices();
      locator.registerFactory(() => Queries());
    });

    tearDown(() {
      unregisterViewModels();
      unregisterServices();
      locator.unregister<Queries>();
    });

    testWidgets("Test if SelectOrganization Page is displayed ",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createSelectOrgPage());
        await tester.pump();
        final selectOrgFinder = find.byKey(selectOrgKey);
        expect(selectOrgFinder, findsOneWidget);
      });
    });

    testWidgets("Test if back-arrow is present", (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createSelectOrgPage());
        await tester.pump();

        final orgFinder = find.byKey(selectOrgKey);
        final appBarFinder =
            find.descendant(of: orgFinder, matching: find.byType(AppBar));
        expect(appBarFinder, findsOneWidget);

        // final appBarWidget = tester.firstWidget(appBarFinder) as AppBar;

        // expect(
        //   appBarWidget.leading,
        //   isA<IconButton>().having(
        //     (icon) => icon.icon,
        //     "icon",
        //     Icons.arrow_back,
        //   ),
        // );
      });
    });
    testWidgets("Test if back-arrow in Scaffold is functional",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        final mocknavservice = getAndRegisterNavigationService();
        await tester.pumpWidget(createSelectOrgPage());
        await tester.pump();

        final orgFinder = find.byKey(selectOrgKey);
        final appBarFinder =
            find.descendant(of: orgFinder, matching: find.byType(AppBar));
        expect(appBarFinder, findsOneWidget);

        final appBarWidget = tester.firstWidget(appBarFinder) as AppBar;

        final iconbutton = appBarWidget.leading! as IconButton;

        await tester.tap(find.byWidget(iconbutton));

        verify(mocknavservice.pop());
      });
    });

    testWidgets("Test Page when organization id is -1",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createSelectOrgPage());
        await tester.pump();
        final selectOrgfinder = find.byKey(selectOrgKey);

        final columnFinder = find
            .descendant(of: selectOrgfinder, matching: find.byType(Column))
            .first;

        expect(columnFinder, findsOneWidget);

        final columnWidget = tester.firstWidget(columnFinder) as Column;

        expect(columnWidget.mainAxisAlignment, MainAxisAlignment.start);
        expect(columnWidget.crossAxisAlignment, CrossAxisAlignment.center);

        expect(columnWidget.children[0], isA<SignupProgressIndicator>());
        expect(columnWidget.children[1], isA<SizedBox>());
        expect(columnWidget.children[2], isA<SizedBox>());
        expect(columnWidget.children[3], isA<Padding>());
        expect(
          columnWidget.children[4],
          isA<Expanded>().having(
            (ex) => ex.child,
            "child",
            isA<OrganizationList>(),
          ),
        );
        expect(columnWidget.children[5], isA<SizedBox>());
        expect(columnWidget.children[6], isA<RaisedRoundedButton>());
        expect(columnWidget.children[7], isA<SizedBox>());
      });
    });

    testWidgets("Test Page when organization id is not  -1",
        (WidgetTester tester) async {
      final SelectOrganizationViewModel customViewModel =
          SelectOrganizationViewModel();
      locator.unregister<SelectOrganizationViewModel>();
      locator.registerLazySingleton(() => customViewModel);

      await tester.runAsync(() async {
        await tester.pumpWidget(createSelectOrgPage(customorgID: "-1"));
        await tester.pump();
        customViewModel.selectedOrganization.id = "3";
        customViewModel.selectedOrganization = OrgInfo(
          name: "JamRock",
          creatorInfo: User(firstName: "Patrick", lastName: "Witter"),
          isPublic: true,
        );
        customViewModel.notifyListeners();
        await tester.pump();
        final selectOrgfinder = find.byKey(selectOrgKey);

        final columnFinder = find
            .descendant(of: selectOrgfinder, matching: find.byType(Column))
            .first;

        expect(columnFinder, findsOneWidget);

        final columnWidget = tester.firstWidget(columnFinder) as Column;

        expect(columnWidget.mainAxisAlignment, MainAxisAlignment.start);
        expect(columnWidget.crossAxisAlignment, CrossAxisAlignment.center);

        expect(columnWidget.children[0], isA<SignupProgressIndicator>());
        expect(columnWidget.children[1], isA<Padding>());
        expect(columnWidget.children[2], isA<CustomListTile>());
        expect(columnWidget.children[3], isA<Padding>());
        expect(
          columnWidget.children[4],
          isA<Expanded>().having(
            (ex) => ex.child,
            "child",
            isA<OrganizationList>(),
          ),
        );
        expect(columnWidget.children[5], isA<SizedBox>());
        expect(columnWidget.children[6], isA<RaisedRoundedButton>());
        expect(columnWidget.children[7], isA<SizedBox>());
      });
    });

    testWidgets("Test onTapOrgInfo for CustomListTile",
        (WidgetTester tester) async {
      final SelectOrganizationViewModel customViewModel =
          SelectOrganizationViewModel();
      locator.unregister<SelectOrganizationViewModel>();
      locator.registerLazySingleton(() => customViewModel);

      final OrgInfo orgInfo = OrgInfo(
        name: "JamRock",
        creatorInfo: User(firstName: "Patrick", lastName: "Witter"),
        isPublic: true,
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(createSelectOrgPage(customorgID: "-1"));
        await tester.pump();
        customViewModel.selectedOrganization.id = "3";
        customViewModel.selectedOrganization = orgInfo;
        customViewModel.notifyListeners();
        await tester.pump();
        final selectOrgfinder = find.byKey(selectOrgKey);

        final columnFinder = find
            .descendant(of: selectOrgfinder, matching: find.byType(Column))
            .first;

        final columnWidget = tester.firstWidget(columnFinder) as Column;

        await tester.tap(find.byWidget(columnWidget.children[2]));

        verify(
          locator<SelectOrganizationViewModel>().selectOrg(orgInfo),
        );
      });
    });
  });
}
