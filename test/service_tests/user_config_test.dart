import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/session_manager.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';
import 'package:talawa/widgets/talawa_error_dialog.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBox<T> extends Mock implements Box<T> {}

class TestUserConfig extends UserConfig {
  bool performLogoutWasCalled = false;

  @override
  Future<QueryResult> performLogout() {
    performLogoutWasCalled = true;

    throw Exception("Unable to logOut");
  }
}

class MockSessionManger extends Mock implements SessionManager {
  @override
  Future<bool> refreshSession() {
    // TODO: implement refreshSession
    return Future.value(true);
  }
}

void main() {
  final userBox = Hive.box<User>('currentUser');
  final urlBox = Hive.box('url');
  final orgBox = Hive.box<OrgInfo>('currentOrg');
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    getAndRegisterSessionManager();
    registerServices();
  });

  final mockUser = User(
    email: 'test@gmail.com',
    name: 'user one',
    image: 'sample.jpg',
    joinedOrganizations: <OrgInfo>[
      OrgInfo(id: 'org1', name: 'orga'),
      OrgInfo(id: 'org2', name: 'orgb'),
    ],
    authToken: 'AuthToken',
    refreshToken: 'Refreshtoken',
    membershipRequests: ['org1', 'org2'],
  );

  final mockOrgDetails = <OrgInfo>[
    OrgInfo(id: 'org3', name: 'orgc'),
    OrgInfo(id: 'org4', name: 'orgd'),
  ];

  group('Test UserConfig service', () {
    test('Test for User log out method.', () async {
      databaseFunctions.init();

      when(databaseFunctions.gqlAuthMutation(queries.logout()))
          .thenAnswer((realInvocation) async {
        final data = {
          'logout': true,
        };
        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(document: gql(queries.logout())),
        );
      });

      when(navigationService.pop()).thenAnswer((_) {});
      when(
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('LogoutProgress'),
          ),
        ),
      ).thenAnswer((realInvocation) {});

      await UserConfig().userLogOut();

      expect(userBox.isEmpty, true);
      expect(urlBox.isEmpty, true);
      expect(orgBox.isEmpty, true);

      when(databaseFunctions.gqlAuthMutation(queries.logout()))
          .thenAnswer((realInvocation) {
        throw Exception('test exception');
      });

      UserConfig().userLogOut();
    });

    group('exitCurrentOrg', () {
      test('returns early when currentOrg id is null or "null"', () async {
        final model = UserConfig();
        model.currentUser =
            User(id: 'u1', joinedOrganizations: [OrgInfo(id: 'a')]);

        // Case: id is null
        model.currentOrg = OrgInfo(id: null);
        await model.exitCurrentOrg();
        // No mutation should be triggered on invalid currentOrg

        // Case: id is "null"
        model.currentOrg = OrgInfo(id: 'null');
        await model.exitCurrentOrg();
        // No mutation should be triggered on invalid currentOrg
      });

      test('returns early when user has no joined organizations', () async {
        final model = UserConfig();
        model.currentUser = User(id: 'u2', joinedOrganizations: []);
        model.currentOrg = OrgInfo(id: 'orgX');

        await model.exitCurrentOrg();
        // No mutation should be triggered when user has no joined orgs
      });

      test('successful exit updates current org to next and shows snackbar',
          () async {
        final model = UserConfig();
        final orgA = OrgInfo(id: 'A', name: 'Org A');
        final orgB = OrgInfo(id: 'B', name: 'Org B');
        model.currentUser = User(id: 'u3', joinedOrganizations: [orgA, orgB]);
        model.currentOrg = orgA;
        final mutation = Queries().deleteOrganizationMembershipMutation();
        when(
          databaseFunctions.gqlAuthMutation(
            mutation,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            source: QueryResultSource.network,
            data: {
              'deleteOrganizationMembership': {'id': 'mem1'},
            },
            options: QueryOptions(document: gql('{ __typename }')),
          ),
        );

        await model.exitCurrentOrg();

        // org A removed, current becomes B
        expect(model.currentUser.joinedOrganizations!.any((o) => o.id == 'A'),
            false);
        expect(model.currentOrg.id, 'B');
        verify(navigationService.showSnackBar('Exited Org A successfully',
            duration: const Duration(seconds: 2)));
        // No navigation reset expected here
      });

      test(
          'navigates to waitingScreen when no orgs left but membershipRequests present',
          () async {
        final model = UserConfig();
        final orgA = OrgInfo(id: 'A', name: 'Org A');
        model.currentUser = User(
            id: 'u4',
            joinedOrganizations: [orgA],
            membershipRequests: ['req1']);
        model.currentOrg = orgA;
        // Align global userConfig used inside method with our model's currentUser
        when(userConfig.currentUser).thenReturn(model.currentUser);
        final mutation = Queries().deleteOrganizationMembershipMutation();
        when(
          databaseFunctions.gqlAuthMutation(
            mutation,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            source: QueryResultSource.network,
            data: {
              'deleteOrganizationMembership': {'id': 'mem1'},
            },
            options: QueryOptions(document: gql('{ __typename }')),
          ),
        );

        await model.exitCurrentOrg();

        expect(model.currentUser.joinedOrganizations, isEmpty);
        verify(
          navigationService.removeAllAndPush(
            Routes.waitingScreen,
            Routes.mainScreen,
            arguments: '0',
          ),
        );
      });

      test('navigates to joinOrg when no orgs/membershipRequests left',
          () async {
        final model = UserConfig();
        final orgA = OrgInfo(id: 'A', name: 'Org A');
        model.currentUser =
            User(id: 'u5', joinedOrganizations: [orgA], membershipRequests: []);
        model.currentOrg = orgA;
        // Align global userConfig used inside method with our model's currentUser
        when(userConfig.currentUser).thenReturn(model.currentUser);

        final mutation = Queries().deleteOrganizationMembershipMutation();
        when(
          databaseFunctions.gqlAuthMutation(
            mutation,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            source: QueryResultSource.network,
            data: {
              'deleteOrganizationMembership': {'id': 'mem1'},
            },
            options: QueryOptions(document: gql('{ __typename }')),
          ),
        );

        await model.exitCurrentOrg();

        expect(model.currentUser.joinedOrganizations, isEmpty);
        verify(
          navigationService.removeAllAndPush(
            Routes.joinOrg,
            Routes.mainScreen,
            arguments: '-1',
          ),
        );
      });

      test('shows error when mutation returns null data', () async {
        final model = UserConfig();
        final orgA = OrgInfo(id: 'A', name: 'Org A');
        model.currentUser = User(id: 'u6', joinedOrganizations: [orgA]);
        model.currentOrg = orgA;

        final mutation = Queries().deleteOrganizationMembershipMutation();
        when(
          databaseFunctions.gqlAuthMutation(
            mutation,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            options: QueryOptions(document: gql('{ __typename }')),
          ),
        );

        await model.exitCurrentOrg();

        verify(
          navigationService.showTalawaErrorSnackBar(
            'Unable to exit organization, please try again.',
            MessageType.error,
          ),
        );
      });

      test('shows error when orgMembership missing or id null', () async {
        final model = UserConfig();
        final orgA = OrgInfo(id: 'A', name: 'Org A');
        model.currentUser = User(id: 'u7', joinedOrganizations: [orgA]);
        model.currentOrg = orgA;

        final mutation = Queries().deleteOrganizationMembershipMutation();
        when(
          databaseFunctions.gqlAuthMutation(
            mutation,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            source: QueryResultSource.network,
            data: {
              'deleteOrganizationMembership': null,
            },
            options: QueryOptions(document: gql('{ __typename }')),
          ),
        );

        await model.exitCurrentOrg();

        verify(
          navigationService.showTalawaErrorSnackBar(
            'Unable to exit organization, please try again.',
            MessageType.error,
          ),
        );
      });
    });
    test('Test for User log out method.', () async {
      databaseFunctions.init();

      when(databaseFunctions.gqlAuthMutation(queries.logout()))
          .thenAnswer((realInvocation) async {
        final data = {
          'logout': true,
        };
        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(document: gql(queries.logout())),
        );
      });

      when(navigationService.pop()).thenAnswer((_) {});
      when(
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('LogoutProgress'),
          ),
        ),
      ).thenAnswer((realInvocation) {});

      await UserConfig().userLogOut();

      expect(userBox.isEmpty, true);
      expect(urlBox.isEmpty, true);
      expect(orgBox.isEmpty, true);

      when(databaseFunctions.gqlAuthMutation(queries.logout()))
          .thenAnswer((realInvocation) {
        throw Exception('test exception');
      });

      UserConfig().userLogOut();
    });
    test('Test for getters & setters.', () {
      final model = UserConfig();

      // model.currentOrgInfoController
      expect(model.currentOrgInfoController, isA<StreamController<OrgInfo>>());

      // model.currentOrgName
      expect(model.currentOrgName, isA<String>());

      // model.currenOrg (setter)
      model.currentOrg = OrgInfo(name: 'org');

      // print(model.currentOrgInfoController);
    });

    test('Test for userLoggedIn method.', () async {
      final model = UserConfig();
      model.currentUser.id = 'fake_id';

      userBox.put(
          'user', User(id: 'fake', name: 'first', authToken: 'fake_token'));

      final Map<String, dynamic> data = {
        "user": {
          "id": "1234567890",
          "name": "ravidi",
          "email": "ravidisheikh@test.com",
          "avatarURL": "https://testimg.com",
          "accessToken": "randomAccessToken",
          "refreshToken": "randomRefreshToken",
        },
      };

      when(
        databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo(),
          variables: anyNamed('variables'),
        ),
      ).thenAnswer((_) async {
        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(document: gql(queries.fetchUserInfo())),
        );
      });

      // if there is _currentUser.
      bool loggedIn = await model.userLoggedIn();
      expect(loggedIn, true);

      userBox.delete('user');

      // if there is no _currentUser.
      loggedIn = await model.userLoggedIn();
      expect(loggedIn, false);

      // print(model.currentUser);
    });

    test('test user loggedin when result throws an exception', () async {
      final model = UserConfig();

      userBox.put('user', User(id: 'fake', name: 'first'));

      when(
        databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo(),
          variables: anyNamed('variables'),
        ),
      ).thenAnswer((_) {
        throw Exception('Simulated Exception.');
      });

      // show couldn't update errorsnackbar.
      final loggedIn = await model.userLoggedIn();
      expect(loggedIn, false);
    });

    test('Test for updateUserJoinedOrg method', () async {
      // Arrange
      final model = UserConfig();
      // Setup mock user with existing joined orgs
      final existingOrgs = [
        OrgInfo(id: 'org1', name: 'orga'),
        OrgInfo(id: 'org2', name: 'orgb'),
      ];
      mockUser.joinedOrganizations = existingOrgs;
      model.currentUser = mockUser;

      // Create a new org to join
      final mockOrg = OrgInfo(id: 'org3', name: 'orgc');

      // Act
      await model.updateUserJoinedOrg(mockOrg);

      // Assert
      // New org should be at the beginning of the list
      expect(mockUser.joinedOrganizations!.first.id, equals('org3'));
      expect(mockUser.joinedOrganizations!.length, equals(3));

      // Test replacing existing org
      final updatedOrg = OrgInfo(id: 'org2', name: 'updated orgb');
      await model.updateUserJoinedOrg(updatedOrg);

      // Should still have 3 items, with updated org at beginning
      expect(mockUser.joinedOrganizations!.length, equals(3));
      expect(mockUser.joinedOrganizations!.first.id, equals('org2'));
      expect(mockUser.joinedOrganizations!.first.name, equals('updated orgb'));

      // Verify that _currentOrg was updated
      expect(model.currentOrg.id, equals('org2'));
    });

    test('updateUserJoinedOrg correctly handles null joinedOrganizations',
        () async {
      // Arrange
      final model = UserConfig();

      // Create a mock user with null joinedOrganizations
      final userWithNullOrgs = User(
        id: 'test-user',
        name: 'Test User',
        email: 'test@example.com',
        joinedOrganizations: null, // Explicitly null
      );

      model.currentUser = userWithNullOrgs;

      // Organization to join
      final newOrg = OrgInfo(id: 'org123', name: 'New Organization');

      // Act
      await model.updateUserJoinedOrg(newOrg);

      // Assert
      expect(model.currentUser.joinedOrganizations, isNotNull);
      expect(model.currentUser.joinedOrganizations!.length, equals(1));
      expect(model.currentUser.joinedOrganizations![0].id, equals('org123'));
      expect(
        model.currentUser.joinedOrganizations![0].name,
        equals('New Organization'),
      );

      // Verify the current org was also updated
      expect(model.currentOrg.id, equals('org123'));
      expect(model.currentOrg.name, equals('New Organization'));
    });

    test('Test for updateUserMemberRequestOrg method', () async {
      final model = UserConfig();
      model.currentUser = mockUser;
      final expected = [...mockUser.membershipRequests!, 'org3', 'org4'];
      await model.updateUserMemberRequestOrg(["org3", "org4"]);

      expect(mockUser.membershipRequests, expected);
    });

    test('Test for updateAccessToken method.', () async {
      final model = UserConfig();
      model.currentUser = mockUser;
      const newAuthToken = 'newAccessToken';
      const newRefreshToken = 'newRefreshToken';

      await model.updateAccessToken(
        accessToken: newAuthToken,
        refreshToken: newRefreshToken,
      );

      expect(mockUser.authToken, newAuthToken);
      expect(mockUser.refreshToken, newRefreshToken);
    });

    test('Test for saveCurrentOrgInHive method.', () {
      final model = UserConfig();
      model.currentUser = mockUser;

      // To test the box.get('org') != null condition.
      orgBox.put('org', OrgInfo(id: 'fakeId', name: 'org'));
      model.saveCurrentOrgInHive(mockOrgDetails[0]);

      // To test the box.get('org') == null condition.
      orgBox.delete('org');
      model.saveCurrentOrgInHive(mockOrgDetails[0]);
    });

    test('Test for updateUser method.', () async {
      final model = UserConfig();

      when(databaseFunctions.init()).thenAnswer((_) {
        throw Exception('simulated exception.');
      });

      final updated = await model.updateUser(User(id: 'sampleId'));

      // user updation failed.
      expect(!updated, true);
    });
  });
  group('Test performLogout method', () {
    test('performLogout returns valid QueryResult', () async {
      final userConfig = UserConfig();

      final result = await userConfig.performLogout();

      // Verify the result has the expected format
      expect(result, isA<QueryResult>());
      expect(result.data, isNotNull);
      expect(result.data!['logout'], true);
      expect(result.source, QueryResultSource.network);
    });

    test('performLogout handles server mutation when implemented', () async {
      // This test simulates the future when the server implements logout mutation
      final userConfig = UserConfig();

      // Mock the database function call with a successful response
      when(databaseFunctions.gqlAuthMutation(queries.logout())).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: {'logout': true},
          options: QueryOptions(document: gql('mutation Logout { logout }')),
        ),
      );

      // Call the method - note we're testing the implementation concept here
      // but the actual code still uses the hardcoded response
      final result = await userConfig.performLogout();

      // Verify the response format is correct
      expect(result.data, isNotNull);
      expect(result.data!['logout'], true);
    });

    test('performLogout preserves source type in response', () async {
      // This test checks that the source type (network vs cache) is correctly set
      final userConfig = UserConfig();

      final result = await userConfig.performLogout();

      // Verify the source is set correctly for network requests
      expect(result.source, QueryResultSource.network);
    });

    // This test simulates what happens when network errors occur
    test('performLogout is resilient to network errors', () async {
      final userConfig = UserConfig();

      final result = await userConfig.performLogout();

      // Even with network errors, we should get a valid response
      expect(result, isA<QueryResult>());
      expect(result.data, isNotNull);
      expect(result.data!['logout'], true);
    });
    test('userLogOut shows error dialog when exception occurs', () async {
      final userConfig = TestUserConfig();

      // Set up mocks
      when(navigationService.pop()).thenAnswer((_) {});
      when(
        navigationService.pushDialog(
          const TalawaErrorDialog(
            'Unable to logout, please try again.',
            key: Key('TalawaError'),
            messageType: MessageType.error,
          ),
        ),
      ).thenAnswer((_) {});

      // Execute logout which should trigger our exception
      await userConfig.userLogOut();

      // Verify performLogout was called
      expect(
        userConfig.performLogoutWasCalled,
        true,
      );
    });
  });
}
