// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
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
    Key? key,
  }) : super(key: key);
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

const initialiseString = "Org Id";
late OrgInfo org;

class _MockUserConfig extends Mock implements UserConfig {
  @override
  Future<dynamic> updateUserMemberRequestOrg(List<OrgInfo>? orgDetails) async =>
      Future.value(1);

  @override
  User get currentUser => _user;

  @override
  Future<bool> userLoggedIn() async => _userLoggedIn;

  @override
  Future updateUserJoinedOrg(List<OrgInfo> orgDetails) async => 1;

  @override
  int saveCurrentOrgInHive(OrgInfo saveOrgAsCurrent) => 1;
}

User _user = User();
bool _userLoggedIn = true;

void main() {
  SizeConfig().test();
  setUp(() async {
    org = OrgInfo(
      id: '3',
      name: 'test org 3',
      isPublic: true,
      creatorInfo: User(firstName: 'test', lastName: '1'),
    );
    locator.registerSingleton(Queries());
    registerServices();
    locator.unregister<UserConfig>();
    _user = User();
    _userLoggedIn = true;
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
      _user = User(refreshToken: 'testtoken');
      _userLoggedIn = false;

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      when(databaseFunctions.fetchOrgById(initialiseString))
          .thenAnswer((realInvocation) async => org);

      await selectOrganizationViewModel.initialise(initialiseString);

      verifyNever(
        navigationService.pushScreen(
          Routes.signupDetailScreen,
          arguments: org,
        ),
      );

      expect(selectOrganizationViewModel.isBusy, false);
    });
    testWidgets('Test for successful selectOrg function',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();
      _userLoggedIn = true;
      _user = User(
        joinedOrganizations: [
          OrgInfo(
            id: '1',
          )
        ],
        membershipRequests: [
          OrgInfo(
            id: '1',
          )
        ],
      );

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      await selectOrganizationViewModel.selectOrg(org);

      expect(selectOrganizationViewModel.selectedOrganization, org);
    });
    testWidgets('Test for selectOrg function when userLoggedIn is false',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );
      _userLoggedIn = false;

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
          )
        ],
      );
      _userLoggedIn = true;

      await selectOrganizationViewModel.selectOrg(org);

      final orgTest = selectOrganizationViewModel.selectedOrganization;
      expect(orgTest.id, '-1');
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
          )
        ],
        membershipRequests: [org],
      );

      await selectOrganizationViewModel.selectOrg(org);

      final orgTest = selectOrganizationViewModel.selectedOrganization;
      expect(orgTest.id, '-1');
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
          duration: const Duration(milliseconds: 750),
        ),
      );
    });
    testWidgets('Test for successful onTapJoin function',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      selectOrganizationViewModel.selectedOrganization = org;

      when(databaseFunctions.gqlAuthMutation(queries.joinOrgById(org.id!)))
          .thenAnswer((realInvocation) async {
        final data = {
          'joinPublicOrganization': {
            'joinedOrganizations': [],
          },
        };

        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(document: gql(queries.joinOrgById(org.id!))),
        );
      });

      _user = User(
        joinedOrganizations: [org],
      );

      await selectOrganizationViewModel.onTapJoin();

      verify(databaseFunctions.gqlAuthMutation(queries.joinOrgById(org.id!)));
      verify(
        navigationService.removeAllAndPush(
          Routes.mainScreen,
          Routes.splashScreen,
          arguments: isA<MainScreenArgs>().having(
            (main) => main.mainScreenIndex,
            "main screen index",
            0,
          ),
        ),
      );
    });
    testWidgets(
        'Test for onTapJoin function when joined organization length is not 1',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      selectOrganizationViewModel.selectedOrganization = org;

      when(databaseFunctions.gqlAuthMutation(queries.joinOrgById(org.id!)))
          .thenAnswer((realInvocation) async {
        final data = {
          'joinPublicOrganization': {
            'joinedOrganizations': [],
          },
        };

        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(document: gql(queries.joinOrgById(org.id!))),
        );
      });
      _user = User(
        joinedOrganizations: [],
      );

      await selectOrganizationViewModel.onTapJoin();

      verify(databaseFunctions.gqlAuthMutation(queries.joinOrgById(org.id!)));
      verify(navigationService.pop());
      verify(
        navigationService.showTalawaErrorSnackBar(
          'Joined ${org.name} successfully',
          MessageType.info,
        ),
      );
    });
    testWidgets('Test for successful onTapJoin function when isPublic is false',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      org.isPublic = false;
      selectOrganizationViewModel.selectedOrganization = org;
      _user = User(joinedOrganizations: []);

      when(
        databaseFunctions
            .gqlAuthMutation(queries.sendMembershipRequest(org.id!)),
      ).thenAnswer((realInvocation) async {
        final data = {
          'sendMembershipRequest': {
            'organization': <String, dynamic>{},
          },
        };

        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(document: gql(queries.joinOrgById(org.id!))),
        );
      });

      await selectOrganizationViewModel.onTapJoin();

      verify(
        databaseFunctions
            .gqlAuthMutation(queries.sendMembershipRequest(org.id!)),
      );
      verify(
        navigationService.removeAllAndPush(
          Routes.waitingScreen,
          Routes.splashScreen,
        ),
      );
    });
    testWidgets(
        'Test for successful onTapJoin function when isPublic is false and joined orgnazation is not empty',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      org.isPublic = false;
      selectOrganizationViewModel.selectedOrganization = org;
      _user = User(joinedOrganizations: [org]);

      when(
        databaseFunctions
            .gqlAuthMutation(queries.sendMembershipRequest(org.id!)),
      ).thenAnswer((realInvocation) async {
        final data = {
          'sendMembershipRequest': {
            'organization': <String, dynamic>{},
          },
        };

        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(document: gql(queries.joinOrgById(org.id!))),
        );
      });

      await selectOrganizationViewModel.onTapJoin();

      verify(
        databaseFunctions
            .gqlAuthMutation(queries.sendMembershipRequest(org.id!)),
      );
      verify(navigationService.pop());
      verify(
        navigationService.showTalawaErrorSnackBar(
          'Join in request sent to ${org.name} successfully',
          MessageType.info,
        ),
      );
    });
    testWidgets(
        'Test for successful onTapJoin function when isPublic is false and result is null',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      org.isPublic = false;
      selectOrganizationViewModel.selectedOrganization = org;

      when(
        databaseFunctions
            .gqlAuthMutation(queries.sendMembershipRequest(org.id!)),
      ).thenAnswer((realInvocation) async {
        return null;
      });

      await selectOrganizationViewModel.onTapJoin();

      verify(
        databaseFunctions
            .gqlAuthMutation(queries.sendMembershipRequest(org.id!)),
      );
      verifyNever(navigationService.pop());
      verifyNever(
        navigationService.showTalawaErrorSnackBar(
          'Join in request sent to ${org.name} successfully',
          MessageType.info,
        ),
      );
      verifyNever(
        navigationService.removeAllAndPush(
          Routes.waitingScreen,
          Routes.splashScreen,
        ),
      );
    });
    testWidgets(
        'Test for successful onTapJoin function when isPublic is true and throws exception',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );

      selectOrganizationViewModel.selectedOrganization = org;

      when(databaseFunctions.gqlAuthMutation(queries.joinOrgById(org.id!)))
          .thenThrow(Exception());

      await selectOrganizationViewModel.onTapJoin();

      verify(
        navigationService.showTalawaErrorSnackBar(
          'SomeThing went wrong',
          MessageType.error,
        ),
      );
      verify(databaseFunctions.gqlAuthMutation(queries.joinOrgById(org.id!)));
    });
    testWidgets(
        'Test for successful onTapJoin function when isPublic is false and throws exception',
        (WidgetTester tester) async {
      locator.registerSingleton<UserConfig>(_MockUserConfig());
      final selectOrganizationViewModel = SelectOrganizationViewModel();

      await tester.pumpWidget(
        SelectOrganizationViewModelWidget(
          qrKey: selectOrganizationViewModel.qrKey,
        ),
      );
      org.isPublic = false;

      selectOrganizationViewModel.selectedOrganization = org;

      when(
        databaseFunctions
            .gqlAuthMutation(queries.sendMembershipRequest(org.id!)),
      ).thenThrow(Exception());

      await selectOrganizationViewModel.onTapJoin();

      verify(
        navigationService.showTalawaErrorSnackBar(
          'SomeThing went wrong',
          MessageType.error,
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
        (FetchMoreOptions options) async {
          expected = options.updateQuery(
            <String, dynamic>{
              "organizationsConnection": [1, 2]
            },
            <String, dynamic>{
              "organizationsConnection": [3, 4]
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
        'organizationsConnection': [1, 2, 3, 4]
      });
    });
  });
}
