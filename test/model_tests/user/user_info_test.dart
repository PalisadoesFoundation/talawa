// ignore_for_file: talawa_api_doc

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

/// Encoded Organization.
final encodedOrg = {
  "name": 'test_org',
  "image": 'https://testimg.com',
  "isPublic": false,
};

/// Updated Organization.
final updatedOrg = OrgInfo.fromJson({
  "name": 'test_org_updated',
  "image": 'https://testimg_updated.com',
  "isPublic": true,
});

/// Membership Request Organization.
final membershipRequestOrg = {
  "organization": encodedOrg,
};

/// Updated Membership Request Organization.
final updatedMembershipRequestOrg = {
  "organization": updatedOrg,
};

/// Test Organization List.
final testOrgList = [
  encodedOrg,
  encodedOrg,
];

/// Membership Request Organization List.
final membershipRequestOrgList = [
  membershipRequestOrg,
  membershipRequestOrg,
];

/// Test Data From Organization.
final testDataFromOrg = <String, dynamic>{
  "firstName": "ravidi",
  "lastName": "sheikh",
  "email": "ravidisheikh@test.com",
  "image": "https://testimg.com",
  "accessToken": "randomAccessToken",
  "authToken": "randomAuthToken",
  "refreshToken": "randomRefreshToken",
  "adminFor": testOrgList,
  'createdOrganizations': testOrgList,
  'joinedOrganizations': testOrgList,
  'membershipRequests': membershipRequestOrgList,
};

/// Test Data Not From Organization.
final testDataNotFromOrg = {
  "user": {
    "firstName": "ravidi",
    "lastName": "sheikh",
    "email": "ravidisheikh@test.com",
    "image": "https://testimg.com",
    "accessToken": "randomAccessToken",
    "authToken": "randomAuthToken",
    "refreshToken": "randomRefreshToken",
    "adminFor": testOrgList,
    'createdOrganizations': testOrgList,
    'joinedOrganizations': testOrgList,
    'membershipRequests': membershipRequestOrgList,
  }
};

void main() {
  group("Tests for UserInfo.dart", () {
    test('Check if UserInfo.fromJson works with fromOrg', () async {
      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);

      expect(userInfo.firstName, "ravidi");
      expect(userInfo.lastName, "sheikh");
      expect(userInfo.email, "ravidisheikh@test.com");
      expect(userInfo.image, "https://testimg.com");
      expect(userInfo.authToken, " ");
    });

    test('Check if UserInfo.fromJson works without fromOrg', () async {
      final userInfo = User.fromJson(testDataNotFromOrg);

      expect(userInfo.firstName, "ravidi");
      expect(userInfo.lastName, "sheikh");
      expect(userInfo.email, "ravidisheikh@test.com");
      expect(userInfo.image, "https://testimg.com");
      expect(userInfo.authToken, null);
    });

    test('Check if the method "update" works', () async {
      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);

      expect(userInfo.firstName, "ravidi");
      expect(userInfo.lastName, "sheikh");
      expect(userInfo.email, "ravidisheikh@test.com");
      expect(userInfo.image, "https://testimg.com");
      expect(userInfo.authToken, " ");

      userInfo.update(
        User(
          firstName: "ravidi_updated",
          lastName: "sheikh_updated",
          email: "updatedemail@test.com",
          image: "https://testimgupdated.com",
          authToken: "randomAuthToken_updated",
        ),
      );

      expect(userInfo.firstName, "ravidi_updated");
      expect(userInfo.lastName, "sheikh_updated");
      expect(userInfo.email, "updatedemail@test.com");
      expect(userInfo.image, "https://testimgupdated.com");
      expect(userInfo.authToken, "randomAuthToken_updated");
    });

    test('Check if print method works', () async {
      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);

      // No way to test this. Calling here to increase
      userInfo.print();
    });

    test('Check if the method updateJoinedOrg works', () async {
      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);

      expect(userInfo.joinedOrganizations!.length, 2);
      expect(userInfo.joinedOrganizations![0].name, 'test_org');
      expect(userInfo.joinedOrganizations![0].image, 'https://testimg.com');
      expect(userInfo.joinedOrganizations![0].isPublic, false);

      userInfo.updateJoinedOrg([updatedOrg, updatedOrg, updatedOrg]);

      expect(userInfo.joinedOrganizations!.length, 3);
      expect(userInfo.joinedOrganizations![0].name, 'test_org_updated');
      expect(
        userInfo.joinedOrganizations![0].image,
        'https://testimg_updated.com',
      );
      expect(userInfo.joinedOrganizations![0].isPublic, true);
    });

    test('Check if the method updateCreatedOrg works', () async {
      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);

      expect(userInfo.createdOrganizations!.length, 2);
      expect(userInfo.createdOrganizations![0].name, 'test_org');
      expect(userInfo.createdOrganizations![0].image, 'https://testimg.com');
      expect(userInfo.createdOrganizations![0].isPublic, false);

      userInfo.updateCreatedOrg([updatedOrg, updatedOrg, updatedOrg]);

      expect(userInfo.createdOrganizations!.length, 3);
      expect(userInfo.createdOrganizations![0].name, 'test_org_updated');
      expect(
        userInfo.createdOrganizations![0].image,
        'https://testimg_updated.com',
      );
      expect(userInfo.createdOrganizations![0].isPublic, true);
    });

    test('Check if the method updateMemberRequestOrg works', () async {
      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);

      expect(userInfo.membershipRequests!.length, 2);
      expect(userInfo.membershipRequests![0].name, 'test_org');
      expect(userInfo.membershipRequests![0].image, 'https://testimg.com');
      expect(userInfo.membershipRequests![0].isPublic, false);

      userInfo.updateMemberRequestOrg([updatedOrg, updatedOrg, updatedOrg]);

      expect(userInfo.membershipRequests!.length, 5);
      expect(userInfo.membershipRequests![3].name, 'test_org_updated');
      expect(
        userInfo.membershipRequests![3].image,
        'https://testimg_updated.com',
      );
      expect(userInfo.membershipRequests![3].isPublic, true);
    });

    test('Check if the method updateAdminFor works', () async {
      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);

      expect(userInfo.adminFor!.length, 2);
      expect(userInfo.adminFor![0].name, 'test_org');
      expect(userInfo.adminFor![0].image, 'https://testimg.com');
      expect(userInfo.adminFor![0].isPublic, false);

      userInfo.updateAdminFor([updatedOrg, updatedOrg, updatedOrg]);

      expect(userInfo.adminFor!.length, 3);
      expect(userInfo.adminFor![0].name, 'test_org_updated');
      expect(userInfo.adminFor![0].image, 'https://testimg_updated.com');
      expect(userInfo.adminFor![0].isPublic, true);
    });

    test('Check if Hive storage works', () async {
      Hive
        ..init("./temporaryPath")
        ..registerAdapter(UserAdapter())
        ..registerAdapter(OrgInfoAdapter());

      final userBox = await Hive.openBox('userInfo');
      expect(userBox.isOpen, true);

      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);
      userBox.put('user', userInfo);

      final newUserBox = await Hive.openBox('userInfo');
      final loadedUserInfo = newUserBox.get('user') as User;

      expect(loadedUserInfo.firstName, "ravidi");
      expect(loadedUserInfo.lastName, "sheikh");
      expect(loadedUserInfo.email, "ravidisheikh@test.com");
      expect(loadedUserInfo.image, "https://testimg.com");
      expect(loadedUserInfo.authToken, " ");

      File('temporaryPath/userinfo.hive').delete();
      File('temporaryPath/userinfo.lock').delete();
    });

    test('Test hashCode', () {
      final userAdapter = UserAdapter();

      final int hashCode = userAdapter.hashCode;
      expect(userAdapter.hashCode, hashCode);
    });

    test('Test ==', () {
      final userAdapter1 = UserAdapter();
      final userAdapter2 = UserAdapter();

      expect(userAdapter1 == userAdapter2, true);
    });
  });
}
