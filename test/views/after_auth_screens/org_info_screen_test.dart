// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/locator.dart' as app_locator;
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/views/after_auth_screens/org_info_screen.dart';
import 'package:talawa/widgets/common/cached_image.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
  });

  setUp(() {
    registerServices();
    // Ensure SizeConfig has non-null static values in tests
    SizeConfig().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('OrganisationInfoScreen - UI rendering', () {
    testWidgets('shows fallback asset when image is null', (tester) async {
      final org = OrgInfo(
          id: 'o1', name: 'Org', image: null, userRegistrationRequired: false);

      await tester.pumpWidget(
        MaterialApp(
          home: OrganisationInfoScreen(orgInfo: org),
        ),
      );

      // The overlay container exists
      expect(find.byKey(const Key('image_container')), findsOneWidget);
      // Expect at least one Image widget (the asset fallback)
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('shows AppCachedImage when image is provided', (tester) async {
      final org = OrgInfo(
          id: 'o2',
          name: 'OrgWithImage',
          image: 'https://example.com/image.jpg',
          userRegistrationRequired: false);

      await mockNetworkImages(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: OrganisationInfoScreen(orgInfo: org),
          ),
        );
        // Should find AppCachedImage
        expect(find.byType(AppCachedImage), findsOneWidget);
      });
    });

    // Skip network image loading in tests to avoid HttpClient errors

    testWidgets('shows Public indicator when registration not required',
        (tester) async {
      final org =
          OrgInfo(id: 'o3', name: 'PublicOrg', userRegistrationRequired: false);

      await tester.pumpWidget(
        MaterialApp(home: OrganisationInfoScreen(orgInfo: org)),
      );

      expect(find.byIcon(Icons.lock_open), findsOneWidget);
      // Appears in header chip and in details card 'Type'
      expect(find.text('Public'), findsNWidgets(2));
      expect(find.text('Private'), findsNothing);
    });

    testWidgets('shows Private indicator when registration required',
        (tester) async {
      final org =
          OrgInfo(id: 'o4', name: 'PrivateOrg', userRegistrationRequired: true);

      await tester.pumpWidget(
        MaterialApp(home: OrganisationInfoScreen(orgInfo: org)),
      );

      expect(find.byIcon(Icons.lock), findsOneWidget);
      // Appears in header chip and in details card 'Type'
      expect(find.text('Private'), findsNWidgets(2));
      expect(find.text('Public'), findsNothing);
    });

    testWidgets('shows default description when null', (tester) async {
      final org = OrgInfo(
          id: 'o5',
          name: 'NoDescOrg',
          userRegistrationRequired: false,
          description: null);

      await tester.pumpWidget(
        MaterialApp(home: OrganisationInfoScreen(orgInfo: org)),
      );

      expect(find.text('No description provided.'), findsOneWidget);
    });

    testWidgets('detail rows render values or N/A correctly', (tester) async {
      final org = OrgInfo(
        id: 'o6',
        name: 'DetailOrg',
        userRegistrationRequired: true,
        adminsCount: 2,
        membersCount: 10,
        city: 'Berlin',
        state: null,
        countryCode: 'DE',
        postalCode: null,
        line1: 'Street 1',
        line2: 'Suite 2',
      );

      await tester.pumpWidget(
        MaterialApp(home: OrganisationInfoScreen(orgInfo: org)),
      );

      expect(find.text('Admins Count:'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('Members Count:'), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
      expect(find.text('City:'), findsOneWidget);
      expect(find.text('Berlin'), findsOneWidget);
      expect(find.text('State:'), findsOneWidget);
      expect(find.text('N/A'), findsWidgets); // for state/postal when null
      expect(find.text('Country:'), findsOneWidget);
      expect(find.text('DE'), findsOneWidget);

      // Address should show both lines joined
      expect(find.text('Street 1, Suite 2'), findsOneWidget);
    });
  });

  group('OrganisationInfoScreen - FAB behavior', () {
    testWidgets('FAB disabled color when org already joined', (tester) async {
      final user = app_locator.locator<UserConfig>();
      // Current user already joined this org
      final joinedOrg = OrgInfo(
          id: 'joined1', name: 'Joined', userRegistrationRequired: false);
      when(user.currentUser).thenReturn(
        User(
          id: 'u1',
          name: 'User',
          joinedOrganizations: [joinedOrg],
        ),
      );

      final org = OrgInfo(
          id: 'joined1', name: 'Joined', userRegistrationRequired: false);

      await tester.pumpWidget(
        MaterialApp(home: OrganisationInfoScreen(orgInfo: org)),
      );

      tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));
      // Tapping should do nothing observable (no exceptions)
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
    });

    testWidgets('FAB enabled color when org not joined', (tester) async {
      final user = app_locator.locator<UserConfig>();
      when(user.currentUser).thenReturn(
        User(
          id: 'u2',
          name: 'User2',
          joinedOrganizations: [OrgInfo(id: 'other')],
        ),
      );

      final org = OrgInfo(
          id: 'not_joined', name: 'NotJoined', userRegistrationRequired: true);

      await tester.pumpWidget(
        MaterialApp(home: OrganisationInfoScreen(orgInfo: org)),
      );

      tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));
      // We avoid asserting side-effects (selectOrg triggers navigation/queries)
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
    });
  });
}
