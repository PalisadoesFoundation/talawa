// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/after_auth_screens/join_organisation_after_auth.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/organization_search_list.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

Widget createJoinOrgAfterAuth({String orgId = "fake_id"}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: JoinOrganisationAfterAuth(
          orgId: orgId,
        ),
      );
    },
  );
}

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group("Tests for JoinOrganizationAfterAuth - widgets", () {
    testWidgets(
      "Check if JoinOrganizationsAfterAuth shows up",
      (tester) async {
        await tester.pumpWidget(createJoinOrgAfterAuth());
        await tester.pumpAndSettle();

        expect(find.byType(JoinOrganisationAfterAuth), findsOneWidget);
      },
    );

    testWidgets(
      "Check if children show up correctly",
      (tester) async {
        await tester.pumpWidget(createJoinOrgAfterAuth());
        await tester.pumpAndSettle();

        expect(
          find.byWidgetPredicate(
            (widget) => widget is Scaffold && widget.body is Column,
          ),
          findsOneWidget,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Column &&
                widget.children[0] is Padding &&
                widget.children[1] is ColoredBox &&
                widget.children[2] is Padding &&
                widget.children[3] is Expanded &&
                widget.children[4] is SizedBox &&
                widget.children[5] is Column,
          ),
          findsOneWidget,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Column &&
                widget.children[0] is RaisedRoundedButton &&
                (widget.children[0] as RaisedRoundedButton).buttonLabel ==
                    "Join selected organisation" &&
                widget.children[1] is SizedBox,
          ),
          findsOneWidget,
        );
      },
    );
  });

  group("Tests for JoinOrganizationAfterAuth - widgets", () {
    testWidgets("Check if QR bottom model sheet shows up", (tester) async {
      await tester.pumpWidget(createJoinOrgAfterAuth());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.qr_code_scanner));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is ClipRRect &&
              widget.child is Container &&
              (widget.child! as Container).child is Column,
        ),
        findsOneWidget,
      );
    });

    // If you happen to add more tests below this one, make sure to
    // re-register SelectOrganizationViewModel in that test as it will
    // be disposed once this test ends, or better, write any new tests
    // before this one.
    testWidgets("Check if model related functions work", (tester) async {
      // Registers a singleton, which means that every instance of
      // SelectOrganizationViewModel will be the same.
      locator.unregister<SelectOrganizationViewModel>();
      locator.registerSingleton<SelectOrganizationViewModel>(
        SelectOrganizationViewModel(),
      );

      final orgOne = OrgInfo(
        name: "org_one",
        creatorInfo: User(
          firstName: "ravidi",
          lastName: "shaikh",
        ),
        isPublic: false,
      );
      final orgTwo = OrgInfo(
        name: "org_two",
        creatorInfo: User(
          firstName: "ravidi",
          lastName: "shaikh",
        ),
        isPublic: false,
      );

      final selectOrgInfoVM = locator.get<SelectOrganizationViewModel>();

      await tester.pumpWidget(createJoinOrgAfterAuth());
      await tester.pumpAndSettle();

      // This button comes from CupertinoSearchTextField
      await tester.tap(find.byType(CupertinoButton));
      await tester.pumpAndSettle();

      // Checking for text change
      selectOrgInfoVM.setState(ViewState.busy);
      selectOrgInfoVM.searchController.text = "tmmmext";
      await tester.pumpAndSettle();

      expect(find.text("tmmmext"), findsOneWidget);

      // Checking for Org selection

      expect(selectOrgInfoVM.organizations, []);

      selectOrgInfoVM.organizations = [
        orgOne,
        orgTwo,
      ];

      selectOrgInfoVM.selectedOrganization = orgOne;

      selectOrgInfoVM.notifyListeners();
      await tester.pumpAndSettle();

      selectOrgInfoVM.searching = true;
      selectOrgInfoVM.notifyListeners();

      expect(find.byType(OrganizationSearchList), findsNothing);
    });
  });
}
