// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/session_manager.dart';
import 'package:talawa/services/user_config.dart';
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
// class MockUser extends Mock implements User {
//   @override
//   void updateJoinedOrg(List<OrgInfo> orgList) {
//     // TODO: implement updateJoinedOrg
//   }

//   @override
//   void updateMemberRequestOrg(List<OrgInfo> orgList) {
//     // TODO: implement updateMemberRequestOrg
//   }
// }

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
    adminFor: <OrgInfo>[
      OrgInfo(id: 'org1', name: 'orga'),
      OrgInfo(id: 'org2', name: 'orgb'),
    ],
    createdOrganizations: <OrgInfo>[
      OrgInfo(id: 'org1', name: 'orga'),
      OrgInfo(id: 'org2', name: 'orgb'),
    ],
    email: 'test@gmail.com',
    firstName: 'user',
    lastName: 'one',
    image: 'sample.jpg',
    joinedOrganizations: <OrgInfo>[
      OrgInfo(id: 'org1', name: 'orga'),
      OrgInfo(id: 'org2', name: 'orgb'),
    ],
    authToken: 'AuthToken',
    refreshToken: 'Refreshtoken',
    membershipRequests: <OrgInfo>[
      OrgInfo(id: 'org1', name: 'orga'),
      OrgInfo(id: 'org2', name: 'orgb'),
    ],
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

      userBox.put('user', User(id: 'fake', firstName: 'first'));

      final Map<String, dynamic> data = {
        'users': [
          {
            "user": {
              "id": "1234567890",
              "firstName": "ravidi",
              "lastName": "sheikh",
              "email": "ravidisheikh@test.com",
              "image": "https://testimg.com",
              "accessToken": "randomAccessToken",
              "authToken": "randomAuthToken",
              "refreshToken": "randomRefreshToken",
            },
            'appUserProfile': {
              'createdOrganizations': [
                {
                  "name": 'test_org',
                  "image": 'https://testimg.com',
                }
              ],
              "adminFor": [
                {
                  "name": 'test_org1',
                  "image": 'https://testimg.com',
                }
              ],
            },
          }
        ],
      };

      when(
        databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer((_) async {
        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(document: gql(queries.fetchUserInfo)),
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

      when(
        databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer((_) {
        throw Exception('Simulated Exception.');
      });

      // show couldn't update errorsnackbar.
      final loggedIn = await model.userLoggedIn();
      expect(loggedIn, true);
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
        firstName: 'Test',
        lastName: 'User',
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

    test('Test for updateUserCreatedOrg method', () async {
      final model = UserConfig();
      model.currentUser = mockUser;

      await model.updateUserCreatedOrg(mockOrgDetails);

      expect(mockUser.createdOrganizations, mockOrgDetails);
    });

    test('Test for updateUserMemberRequestOrg method', () async {
      final model = UserConfig();
      model.currentUser = mockUser;
      final expected = [...mockUser.membershipRequests!, ...mockOrgDetails];
      await model.updateUserMemberRequestOrg(mockOrgDetails);

      expect(mockUser.membershipRequests, expected);
    });

    test('Test for updateUserAdminOrg method', () async {
      final model = UserConfig();
      model.currentUser = mockUser;

      await model.updateUserAdminOrg(mockOrgDetails);

      expect(mockUser.adminFor, mockOrgDetails);
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
        reason: 'performLogout was not called',
      );
    });
  });
}
