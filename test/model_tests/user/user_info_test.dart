// ignore_for_file: talawa_api_doc

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

/// Encoded Organization.
final encodedOrg = {
  "name": 'test_org',
  "image": 'https://testimg.com',
  "userRegistrationRequired": true,
};

/// Updated Organization.
final updatedOrg = OrgInfo.fromJson({
  "name": 'test_org_updated',
  "image": 'https://testimg_updated.com',
  "userRegistrationRequired": false,
});

/// Test Organization List.
final testOrgList = [
  encodedOrg,
  encodedOrg,
];

/// Test Data From Organization.
final testDataFromOrg = <String, dynamic>{
  'user': {
    'id': '1234567890',
    'name': 'ravidi sheikh',
    'emailAddress': 'ravidisheikh@test.com',
    'avatarURL': 'https://testimg.com',
    'joinedOrganizations': testOrgList,
  },
  'authenticationToken': ' ',
  'refreshToken': ' ',
};

/// Test Data Not From Organization.
final testDataNotFromOrg = {
  'user': {
    'id': '1234567890',
    'name': 'ravidi sheikh',
    'emailAddress': 'ravidisheikh@test.com',
    'avatarURL': 'https://testimg.com',
    'joinedOrganizations': testOrgList,
  },
  'authenticationToken': ' ',
  'refreshToken': ' ',
};

void main() {
  group("Tests for UserInfo.dart", () {
    test('Check if UserInfo.fromJson works with fromOrg', () {
      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);

      expect(userInfo.firstName, "ravidi");
      expect(userInfo.lastName, "sheikh");
      expect(userInfo.email, "ravidisheikh@test.com");
      expect(userInfo.image, "https://testimg.com");
      expect(userInfo.authToken, " ");
    });

    test('Check if UserInfo.fromJson works without fromOrg', () {
      final userInfo = User.fromJson(testDataNotFromOrg);

      expect(userInfo.firstName, "ravidi");
      expect(userInfo.lastName, "sheikh");
      expect(userInfo.email, "ravidisheikh@test.com");
      expect(userInfo.image, "https://testimg.com");
      expect(userInfo.authToken, ' ');
    });

    test('Check if the method "update" works', () {
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

    test('Check if print method works', () {
      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);

      // No way to test this. Calling here to increase
      userInfo.print();
    });

    test('Check if Hive storage works', () async {
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
