import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/after_auth_screens/join_org_after_auth/join_organisation_after_auth.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/organization_list.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createJoinOrgAfterAuth({
  String orgId = "fake_id",
}) {
  return BaseView<SelectOrganizationViewModel>(
    builder: (context, model, child) {
      return MaterialApp(
        navigatorKey: navigationService.navigatorKey,
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
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    testSetupLocator();
    locator<GraphqlConfig>().test();
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('JoinOrganisationAfterAuth Widget Tests', () {
    testWidgets('should render complete widget structure and styling correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(createJoinOrgAfterAuth());
      await tester.pumpAndSettle();

      // Verify basic structure
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byKey(const Key('JoinOrgScreen')), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Join Organisation'), findsOneWidget);
      expect(find.byType(OrganizationList), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Expanded), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);

      // Verify AppBar styling
      final AppBar appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.centerTitle, isTrue);

      final Text titleText =
          tester.widget<Text>(find.text('Join Organisation'));
      expect(titleText.style?.fontWeight, FontWeight.w600);
      expect(titleText.style?.fontSize, 20);

      // Verify Divider properties
      final Divider divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.color, Colors.grey);
      expect(divider.thickness, 2.0);

      // Verify OrganizationList has correct model
      final OrganizationList orgList = tester.widget<OrganizationList>(
        find.byType(OrganizationList),
      );
      expect(orgList.model, isA<SelectOrganizationViewModel>());

      // Verify widget hierarchy
      expect(
        find.descendant(
          of: find.byType(Scaffold),
          matching: find.byType(AppBar),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(Expanded),
          matching: find.byType(OrganizationList),
        ),
        findsOneWidget,
      );
    });

    testWidgets('should handle different orgId values correctly',
        (WidgetTester tester) async {
      // Test with custom orgId
      const String testOrgId = 'test-org-123';
      await tester.pumpWidget(createJoinOrgAfterAuth(orgId: testOrgId));
      await tester.pumpAndSettle();

      final JoinOrganisationAfterAuth widget =
          tester.widget<JoinOrganisationAfterAuth>(
        find.byType(JoinOrganisationAfterAuth),
      );
      expect(widget.orgId, testOrgId);
      expect(find.byType(JoinOrganisationAfterAuth), findsOneWidget);

      // Test with empty orgId
      await tester.pumpWidget(createJoinOrgAfterAuth(orgId: ''));
      await tester.pumpAndSettle();
      expect(find.byType(JoinOrganisationAfterAuth), findsOneWidget);
    });
  });
}
