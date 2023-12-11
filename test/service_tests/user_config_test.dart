// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBox<T> extends Mock implements Box<T> {}

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

void main() async {
  testSetupLocator();

  final Directory dir = Directory('test/fixtures/core');

  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());

  final userBox = await Hive.openBox<User>('currentUser');
  final urlBox = await Hive.openBox('url');
  final orgBox = await Hive.openBox<OrgInfo>('currentOrg');

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
    setUpAll(() {
      registerServices();
    });
    test('Test for User log out.', () async {
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

      when(navigationService.pop()).thenAnswer((_) async {});
      when(
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('LogoutProgress'),
          ),
        ),
      ).thenAnswer((realInvocation) async {});

      bool loggedOut = await UserConfig().userLogOut();

      expect(loggedOut, true);

      verify(navigationService.pop());
      expect(userBox.isEmpty, true);
      expect(urlBox.isEmpty, true);
      expect(orgBox.isEmpty, true);

      when(databaseFunctions.gqlAuthMutation(queries.logout()))
          .thenAnswer((realInvocation) async {
        throw Exception('test exception');
      });

      loggedOut = await UserConfig().userLogOut();
      expect(loggedOut, false);
    });

    test('Test for updateUserJoinedOrg', () async {
      final model = UserConfig();
      model.currentUser = mockUser;

      await model.updateUserJoinedOrg(mockOrgDetails);

      expect(mockUser.joinedOrganizations, mockOrgDetails);
    });

    test('Test for updateUserCreatedOrg', () async {
      final model = UserConfig();
      model.currentUser = mockUser;

      await model.updateUserCreatedOrg(mockOrgDetails);

      expect(mockUser.createdOrganizations, mockOrgDetails);
    });

    test('Test for updateUserMemberRequestOrg', () async {
      final model = UserConfig();
      model.currentUser = mockUser;
      final expected = [...mockUser.membershipRequests!, ...mockOrgDetails];
      await model.updateUserMemberRequestOrg(mockOrgDetails);

      expect(mockUser.membershipRequests, expected);
    });

    test('Test for updateUserAdminOrg', () async {
      final model = UserConfig();
      model.currentUser = mockUser;

      await model.updateUserAdminOrg(mockOrgDetails);

      expect(mockUser.adminFor, mockOrgDetails);
    });

    test('Test for updateAccessToken', () async {
      final model = UserConfig();
      model.currentUser = mockUser;
      const newAuthToken = 'newAccessToken';
      const newRefreshToken = 'newRefreshToken';

      await model.updateAccessToken(
          accessToken: newAuthToken, refreshToken: newRefreshToken);

      expect(mockUser.authToken, newAuthToken);
      expect(mockUser.refreshToken, newRefreshToken);
    });
  });
}
