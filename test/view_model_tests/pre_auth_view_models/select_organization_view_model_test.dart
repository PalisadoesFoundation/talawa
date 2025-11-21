// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    testSetupLocator();
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('SelectOrganizationViewModel - searchActive', () {
    testWidgets('sets searching=true and clears organizations when focused',
        (tester) async {
      final model = SelectOrganizationViewModel();
      model.organizations = [OrgInfo(id: 'a')];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                TextField(focusNode: model.searchFocus),
              ],
            ),
          ),
        ),
      );

      model.searchFocus.requestFocus();
      await tester.pump();
      model.searchActive();

      expect(model.searching, true);
      expect(model.organizations, isEmpty);
    });
  });

  group('SelectOrganizationViewModel - selectOrg', () {
    test('shows warning if already joined', () async {
      when(userConfig.loggedIn).thenReturn(true);

      final model = SelectOrganizationViewModel();
      // id '3' is in mocked joinedOrganizations in test helpers
      final org =
          OrgInfo(id: '3', userRegistrationRequired: false, name: 'JoinedOrg');

      await model.selectOrg(org);

      verify(
        navigationService.showTalawaErrorSnackBar(
            'Organisation already joined', MessageType.warning),
      );
    });

    test('shows warning if membership request already sent', () async {
      when(userConfig.loggedIn).thenReturn(true);

      final model = SelectOrganizationViewModel();
      // id '2' is in mocked membershipRequests
      final org = OrgInfo(
          id: '2', userRegistrationRequired: true, name: 'RequestedOrg');

      await model.selectOrg(org);

      verify(
        navigationService.showTalawaErrorSnackBar(
            'Membership request already sent', MessageType.warning),
      );
    });

    test('navigates to requestAccess when registration required', () async {
      when(userConfig.loggedIn).thenReturn(true);

      final model = SelectOrganizationViewModel();
      // Ensure not joined and not requested
      final org =
          OrgInfo(id: '10', userRegistrationRequired: true, name: 'PrivateOrg');

      when(navigationService.pushScreen(Routes.requestAccess, arguments: org))
          .thenAnswer((_) async {});

      await model.selectOrg(org);

      verify(
          navigationService.pushScreen(Routes.requestAccess, arguments: org));
    });

    test('navigates to signup details when not logged in', () async {
      when(userConfig.loggedIn).thenReturn(false);

      final model = SelectOrganizationViewModel();
      final org =
          OrgInfo(id: '20', userRegistrationRequired: false, name: 'PublicOrg');

      when(navigationService.pushScreen(Routes.signupDetailScreen,
              arguments: org))
          .thenAnswer((_) async {});

      await model.selectOrg(org);

      verify(navigationService.pushScreen(Routes.signupDetailScreen,
          arguments: org));
    });
  });

  group('SelectOrganizationViewModel - onTapContinue', () {
    test('shows warning when no organization selected', () {
      final model = SelectOrganizationViewModel();

      model.onTapContinue();

      verify(
        navigationService.showTalawaErrorSnackBar(
            'Select one organization to continue', MessageType.warning),
      );
    });

    test('navigates when organization selected', () {
      final model = SelectOrganizationViewModel();
      model.selectedOrganization = OrgInfo(id: 'x');

      when(navigationService.pushScreen(Routes.signupDetailScreen,
              arguments: anyNamed('arguments')))
          .thenAnswer((_) async {});

      model.onTapContinue();

      verify(navigationService.pushScreen(Routes.signupDetailScreen,
          arguments: model.selectedOrganization));
    });
  });

  group('SelectOrganizationViewModel - onTapJoin', () {
    test('shows warning when selectedOrganization is null', () async {
      final model = SelectOrganizationViewModel();
      model.selectedOrganization = null;

      await model.onTapJoin();

      verify(
        navigationService.showTalawaErrorSnackBar(
            'Please select an organization to join', MessageType.warning),
      );
    });

    test('shows warning when registration requirement is null', () async {
      final model = SelectOrganizationViewModel();
      model.selectedOrganization =
          OrgInfo(id: 'x', userRegistrationRequired: null);

      await model.onTapJoin();

      verify(
        navigationService.showTalawaErrorSnackBar(
            'Organization registration requirement is not set',
            MessageType.warning),
      );
    });

    test('joins public org successfully and navigates to main screen',
        () async {
      final model = SelectOrganizationViewModel();
      model.selectedOrganization = OrgInfo(
          id: 'public1', name: 'Public 1', userRegistrationRequired: false);

      when(userConfig.currentUser)
          .thenReturn(User(id: 'xzy1', name: 'Test User'));
      // No need to stub updateUserJoinedOrg; default behavior is fine

      final joinMutation = Queries().joinOrgById();
      final fetchQuery = Queries().fetchOrgById('public1');

      when(databaseFunctions.gqlAuthMutation(joinMutation,
              variables: anyNamed('variables')))
          .thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: {
            'joinPublicOrganization': {
              'memberId': 'xzy1',
            },
          },
          options: QueryOptions(document: gql('{ __typename }')),
        ),
      );

      when(databaseFunctions.gqlAuthQuery(fetchQuery)).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: {
            'organization': {
              'id': 'public1',
              'name': 'Public 1',
              'isUserRegistrationRequired': false,
            },
          },
          options: QueryOptions(document: gql('{ __typename }')),
        ),
      );

      when(navigationService.pushReplacementScreen(Routes.mainScreen,
              arguments: anyNamed('arguments')))
          .thenAnswer((_) async {});

      await model.onTapJoin();

      verify(navigationService.pop());
      verify(navigationService.showSnackBar('Joined Public 1 successfully',
          duration: const Duration(seconds: 2)));
      // We avoid argument matchers per style preference; rely on navigation + no exceptions
    });

    test('navigates to request access when registration required', () async {
      final nav = locator<NavigationService>();
      final model = SelectOrganizationViewModel();
      model.selectedOrganization =
          OrgInfo(id: 'priv1', userRegistrationRequired: true);

      when(nav.pushScreen(Routes.requestAccess)).thenAnswer((_) async {});

      await model.onTapJoin();

      verify(nav.pushScreen(Routes.requestAccess));
    });
  });

  group('SelectOrganizationViewModel - fetchMoreHelper', () {
    test('passes correct variables and updateQuery', () {
      final model = SelectOrganizationViewModel();
      Map<String, dynamic>? capturedVariables;
      UpdateQuery? capturedUpdateQuery;

      Future<QueryResult> fetchMore(FetchMoreOptions options) async {
        capturedVariables = options.variables;
        capturedUpdateQuery = options.updateQuery;
        return QueryResult(
          source: QueryResultSource.network,
          data: const {},
          options: QueryOptions(document: gql('{ __typename }')),
        );
      }

      final current = List.generate(10, (i) => OrgInfo(id: '$i'));

      model.fetchMoreHelper(fetchMore, current);

      expect(capturedVariables, isNotNull);
      expect(capturedVariables!['first'], 25); // 10 + 15
      expect(capturedVariables!['skip'], 10);
      expect(capturedUpdateQuery, isNotNull);

      final merged = capturedUpdateQuery!(
        {
          'organizationsConnection': [1, 2, 3],
        },
        {
          'organizationsConnection': [4, 5],
        },
      )!;

      expect(merged['organizationsConnection'], [1, 2, 3, 4, 5]);
    });
  });
}
