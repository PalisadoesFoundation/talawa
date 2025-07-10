// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/queries.dart';

import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';

import '../../helpers/test_helpers.dart';

class SelectOrganizationViewModelWidget extends StatelessWidget {
  const SelectOrganizationViewModelWidget({
    required this.qrKey,
    this.child,
    this.focusNode,
    this.autoFocus,
    super.key,
  });
  final GlobalKey qrKey;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          key: qrKey,
          child: child ??
              TextField(
                autofocus: autoFocus ?? false,
                focusNode: focusNode,
              ),
        ),
      ),
      navigatorKey: navigationService.navigatorKey,
    );
  }
}

User _user = User(
  joinedOrganizations: <OrgInfo>[],
);
bool _userLoggedIn = true;
const initialiseString = "Org Id";
late OrgInfo org;

class _MockUserConfig extends Mock implements UserConfig {
  @override
  Future<dynamic> updateUserMemberRequestOrg(List<OrgInfo>? orgDetails) =>
      Future.value(1);

  @override
  User get currentUser => _user;

  @override
  bool get loggedIn => true;

  @override
  Future<bool> userLoggedIn() async => _userLoggedIn;

  @override
  Future updateUserJoinedOrg(OrgInfo orgDetails) async => 1;

  @override
  int saveCurrentOrgInHive(OrgInfo saveOrgAsCurrent) => 1;
}

void main() {
  SizeConfig().test();
  setUp(() {
    org = OrgInfo(
      id: '3',
      name: 'test org 3',
      userRegistrationRequired: false,
    );
    locator.registerSingleton(Queries());
    registerServices();
    locator.unregister<UserConfig>();
  });

  tearDown(() async {
    await locator.unregister<Queries>();
    unregisterServices();
  });

  group('Test for select organization view model - ', () {
    testWidgets('Test for search Active function when focusNode has focus',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();
      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
          focusNode: selectOrganizationViewModel.searchFocus,
          autoFocus: true,
        ),
      );
      selectOrganizationViewModel.searchFocus.requestFocus();
      expect(selectOrganizationViewModel.searchFocus.hasFocus, true);
      selectOrganizationViewModel.searchActive();

      expect(selectOrganizationViewModel.organizations, []);
      expect(selectOrganizationViewModel.searching, true);
      expect(selectOrganizationViewModel.isBusy, false);
    });

    testWidgets(
        'Test for search Active function when focusNode does not have focus',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();
      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
          focusNode: selectOrganizationViewModel.searchFocus,
        ),
      );
      expect(selectOrganizationViewModel.searchFocus.hasFocus, false);
      selectOrganizationViewModel.searchActive();

      expect(selectOrganizationViewModel.organizations, []);
      expect(selectOrganizationViewModel.searching, false);
      expect(selectOrganizationViewModel.isBusy, false);
    });
    testWidgets('Test for successful initialise function',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();
      _user = User(refreshToken: '');

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      when(databaseFunctions.fetchOrgById(initialiseString))
          .thenAnswer((realInvocation) async => org);

      await selectOrganizationViewModel.initialise(initialiseString);
      verify(
        navigationService.pushScreen(
          Routes.signupDetailScreen,
          arguments: org,
        ),
      );

      expect(selectOrganizationViewModel.isBusy, false);
    });
    testWidgets('Test for initialise function when initialise data contains -1',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await selectOrganizationViewModel.initialise('-1 $initialiseString');
      verifyNever(
        navigationService.pushScreen(
          Routes.signupDetailScreen,
          arguments: org,
        ),
      );

      expect(selectOrganizationViewModel.isBusy, false);
    });
    testWidgets(
        'Test for initialise function when fetch.runtimeType is != OrgInfo',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      when(databaseFunctions.fetchOrgById(initialiseString))
          .thenAnswer((realInvocation) async => 'hey');

      await selectOrganizationViewModel.initialise(initialiseString);

      verifyNever(
        navigationService.pushScreen(
          Routes.signupDetailScreen,
          arguments: org,
        ),
      );

      expect(selectOrganizationViewModel.isBusy, false);
    });
    testWidgets('Test for initialise function when refreshToken is not empty',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();
      _userLoggedIn = false;
      _user = User(
        refreshToken: '',
        joinedOrganizations: [
          OrgInfo(
            id: '1',
          ),
        ],
        membershipRequests: [
          OrgInfo(
            id: '1',
          ),
        ],
      );

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      print(initialiseString);

      when(databaseFunctions.fetchOrgById(initialiseString))
          .thenAnswer((realInvocation) async {
        return org;
      });

      await selectOrganizationViewModel.initialise(initialiseString);

      verify(
        navigationService.pushScreen(
          Routes.signupDetailScreen,
          arguments: org,
        ),
      );

      expect(selectOrganizationViewModel.isBusy, false);
    });

    testWidgets(
        'Test for successful selectOrg function when org requires userRegistration',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );
      org.userRegistrationRequired = true;
      selectOrganizationViewModel.selectedOrganization = org;

      when(
        databaseFunctions.gqlAuthMutation(
          queries.joinOrgById(),
          variables: {
            'organizationId': org.id,
          },
        ),
      ).thenAnswer((realInvocation) async {
        final data = {
          'joinPublicOrganization': {
            'joinedOrganizations': [],
          },
        };

        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(
            document: gql(
              queries.joinOrgById(),
            ),
            variables: {
              'organizationId': org.id,
            },
          ),
        );
      });

      _userLoggedIn = true;
      _user = User(
        joinedOrganizations: [
          OrgInfo(
            id: '1',
          ),
        ],
        membershipRequests: [
          OrgInfo(
            id: '1',
          ),
        ],
      );

      await selectOrganizationViewModel.selectOrg(org);

      expect(selectOrganizationViewModel.selectedOrganization, org);
    });

    testWidgets(
        'Test for selectOrg function when orgAlreadyJoined is true and orgRequestAlreadyPresent is false',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );
      _user = User(
        joinedOrganizations: [org],
        membershipRequests: [
          OrgInfo(
            id: '1',
          ),
        ],
      );
      _userLoggedIn = true;

      await selectOrganizationViewModel.selectOrg(org);

      final orgTest = selectOrganizationViewModel.selectedOrganization;
      expect(orgTest?.id, '-1');
      verify(
        navigationService.showTalawaErrorSnackBar(
          'Organisation already joined',
          MessageType.warning,
        ),
      );
    });
    testWidgets(
        'Test for selectOrg function when orgAlreadyJoined is false and orgRequestAlreadyPresent is true',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );
      _userLoggedIn = true;
      _user = User(
        joinedOrganizations: [
          OrgInfo(
            id: '1',
          ),
        ],
        membershipRequests: [org],
      );

      await selectOrganizationViewModel.selectOrg(org);

      final orgTest = selectOrganizationViewModel.selectedOrganization;
      expect(orgTest?.id, '-1');
      verify(
        navigationService.showTalawaErrorSnackBar(
          'Membership request already sent',
          MessageType.warning,
        ),
      );
    });
    testWidgets('Test for successful onTapContinue function',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      selectOrganizationViewModel.selectedOrganization = org;

      selectOrganizationViewModel.onTapContinue();

      verify(
        navigationService.pushScreen(
          Routes.signupDetailScreen,
          arguments: org,
        ),
      );
    });
    testWidgets(
        'Test for successful onTapContinue function when selected organization id is -1',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      selectOrganizationViewModel.selectedOrganization = OrgInfo(id: '-1');

      selectOrganizationViewModel.onTapContinue();

      verify(
        navigationService.showTalawaErrorSnackBar(
          'Select one organization to continue',
          MessageType.warning,
        ),
      );
    });

    testWidgets('Test for organization list', (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      Map<String, dynamic>? expected;

      selectOrganizationViewModel.fetchMoreHelper(
        (FetchMoreOptions options) {
          expected = options.updateQuery(
            <String, dynamic>{
              "organizationsConnection": [
                {"one": 1},
                {"two": 2},
              ],
            },
            <String, dynamic>{
              "organizationsConnection": [
                {"three": 3},
                {"four": 4},
              ],
            },
          );
          return Future.value(
            QueryResult(
              source: QueryResultSource.network,
              options: QueryOptions(document: gql(queries.fetchJoinInOrg)),
            ),
          );
        },
        [],
      );

      expect(expected, {
        'organizationsConnection': [
          {"one": 1},
          {"two": 2},
          {"three": 3},
          {"four": 4},
        ],
      });
    });
  });
}
