// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/after_auth_screens/join_org_after_auth/join_organisation_after_auth.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/organization_search_list.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';
import '../../../helpers/test_locator.dart';

Widget createJoinOrgAfterAuth({
  String orgId = "fake_id",
}) {
  return BaseView<SelectOrganizationViewModel>(
    onModelReady: (model) => model.initialise(orgId),
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
    testWidgets('QR Scan Test', (WidgetTester tester) async {
      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode(
          ' ' + '?orgid=6737904485008f171cf29924',
          BarcodeFormat.qrcode,
          null,
        );
      });
      when(controller.stopCamera())
          .thenAnswer((realInvocation) => Future.value());

      await tester.pumpWidget(
        createJoinOrgAfterAuth(),
      );

      await tester.pumpAndSettle(const Duration(seconds: 6));

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
      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);
    });
    testWidgets('QR Scan Test when url != GraphqlConfig.orgURI',
        (WidgetTester tester) async {
      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode(
          '1' + '?orgid=6737904485008f171cf29924',
          BarcodeFormat.qrcode,
          null,
        );
      });
      when(controller.stopCamera())
          .thenAnswer((realInvocation) => Future.value());

      await tester.pumpWidget(
        createJoinOrgAfterAuth(),
      );

      await tester.pumpAndSettle(const Duration(seconds: 6));

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
      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);
    });
    testWidgets('Test _onQRViewCreated when throwing exception',
        (WidgetTester tester) async {
      final controller = MockQRViewController();
      when(controller.scannedDataStream).thenAnswer((_) async* {
        yield Barcode(
          ' ' + '?orgid=6737904485008f171cf29924',
          BarcodeFormat.qrcode,
          null,
        );
      });
      when(controller.stopCamera())
          .thenAnswer((realInvocation) => Future.value());

      await tester.pumpWidget(
        createJoinOrgAfterAuth(),
      );
      when(controller.stopCamera()).thenThrow(Exception("exception"));

      await tester.pumpAndSettle(const Duration(seconds: 6));

      await tester.tap(find.byIcon(Icons.qr_code_scanner));
      await tester.pumpAndSettle();

      (tester.widget(find.byType(QRView)) as QRView)
          .onQRViewCreated(controller);
    });
    testWidgets(
      "Check if JoinOrganizationsAfterAuth shows up",
      (tester) async {
        await tester.pumpWidget(createJoinOrgAfterAuth());
        await tester.pumpAndSettle(const Duration(seconds: 6));

        expect(find.byType(JoinOrganisationAfterAuth), findsOneWidget);
      },
    );

    testWidgets(
      "Check if children show up correctly",
      (tester) async {
        await tester.pumpWidget(createJoinOrgAfterAuth());
        await tester.pumpAndSettle(const Duration(seconds: 6));

        expect(
          find.byWidgetPredicate(
            (widget) => widget is Scaffold && widget.body is Column,
          ),
          findsOneWidget,
        );

        // expect(
        //   find.byWidgetPredicate(
        //     (widget) =>
        //         widget is Column &&
        //         widget.children[0] is Padding &&
        //         widget.children[1] is ColoredBox &&
        //         widget.children[2] is Padding &&
        //         widget.children[3] is Expanded &&
        //         widget.children[4] is SizedBox &&
        //         widget.children[5] is Column,
        //   ),
        //   findsOneWidget,
        // );

        // expect(
        //   find.byWidgetPredicate(
        //     (widget) =>
        //         widget is Column &&
        //         widget.children[0] is RaisedRoundedButton &&
        //         (widget.children[0] as RaisedRoundedButton).buttonLabel ==
        //             "Join selected organisation" &&
        //         widget.children[1] is SizedBox,
        //   ),
        //   findsOneWidget,
        // );
      },
    );
  });

  group("Tests for JoinOrganizationAfterAuth - widgets", () {
    testWidgets("Check if QR bottom model sheet shows up", (tester) async {
      await tester.pumpWidget(createJoinOrgAfterAuth());
      await tester.pumpAndSettle(const Duration(seconds: 6));

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

    /// Search is No-Longer is a feature, if it gets implemented in future use this test
    /// Really good test to learn from so not deleting
    testWidgets("Check if model related functions work", (tester) async {
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
      await tester.pumpAndSettle(const Duration(seconds: 6));

      // This button comes from CupertinoSearchTextField
      // await tester.tap(find.byType(CupertinoButton));
      // await tester.pumpAndSettle(const Duration(seconds: 6));

      // Checking for text change
      selectOrgInfoVM.setState(ViewState.busy);
      selectOrgInfoVM.searchController.text = "tmmmext";
      await tester.pumpAndSettle(const Duration(seconds: 6));

      // expect(find.text("tmmmext"), findsOneWidget);

      // Checking for Org selection

      expect(selectOrgInfoVM.organizations, []);

      selectOrgInfoVM.organizations = [
        orgOne,
        orgTwo,
      ];

      selectOrgInfoVM.selectedOrganization = orgOne;

      selectOrgInfoVM.notifyListeners();
      await tester.pumpAndSettle(const Duration(seconds: 6));

      selectOrgInfoVM.searching = true;
      selectOrgInfoVM.notifyListeners();

      expect(find.byType(OrganizationSearchList), findsNothing);
    });
  });
}
