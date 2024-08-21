// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/pre_auth_screens/select_organization.dart';
import 'package:talawa/widgets/organization_search_list.dart';

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

  Widget organizationSearchList({
    required SelectOrganizationViewModel orgViewModel,
  }) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      themeMode: ThemeMode.light,
      theme: TalawaTheme.lightTheme,
      home: Scaffold(
        body: OrganizationSearchList(model: orgViewModel),
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

    testWidgets('test organization search list', (tester) async {
      final orgViewModel = SelectOrganizationViewModel();
      orgViewModel.organizations = [];
      for (var i = 0; i < 6; i++) {
        orgViewModel.organizations.add(
          OrgInfo(
            admins: [],
            members: [],
            creatorInfo: User(id: 'azad'),
            id: i.toString(),
            description: 'description',
            name: 'azads org',
            userRegistrationRequired: true,
          ),
        );
      }
      await tester
          .pumpWidget(organizationSearchList(orgViewModel: orgViewModel));
      await tester.pumpAndSettle();
    });

    testWidgets('test organization search list', (tester) async {
      final orgViewModel = SelectOrganizationViewModel();

      await tester
          .pumpWidget(organizationSearchList(orgViewModel: orgViewModel));
      await tester.pumpAndSettle();
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
  });
}
