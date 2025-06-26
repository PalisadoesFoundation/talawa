import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/user/user_info.dart';

/// Test Data From Organization.
final testDataFromOrg = <String, dynamic>{
  'id': '1234567890',
  'name': 'ravidi sheikh',
  'emailAddress': 'ravidisheikh@test.com',
  'avatarURL': 'https://testimg.com',
};

/// Test Data Not From Organization.
final testDataNotFromOrg = {
  'user': {
    'id': '1234567890',
    'name': 'ravidi sheikh',
    'emailAddress': 'ravidisheikh@test.com',
    'avatarURL': 'https://testimg.com',
    'organizationsWhereMember': {
      'edges': [
        {
          'node': {
            'id': 'org1',
            'name': 'Test Organization',
            'avatarURL': 'https://testorg.com/avatar.jpg',
          },
        }
      ],
    },
  },
  'authenticationToken': 'test_auth_token',
  'refreshToken': 'test_refresh_token',
};

void main() {
  group("Tests for UserInfo.dart", () {
    test('Check if UserInfo.fromJson works with fromOrg', () {
      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);

      expect(userInfo.firstName, "ravidi");
      expect(userInfo.lastName, "sheikh");
      expect(userInfo.email, "ravidisheikh@test.com");
      expect(userInfo.image, "https://testimg.com");
      expect(
        userInfo.authToken,
        null,
      ); // No auth token in organization user data
      expect(
        userInfo.refreshToken,
        null,
      ); // No refresh token in organization user data
    });

    test('Check if UserInfo.fromJson works without fromOrg', () {
      final userInfo = User.fromJson(testDataNotFromOrg);

      expect(userInfo.firstName, "ravidi");
      expect(userInfo.lastName, "sheikh");
      expect(userInfo.email, "ravidisheikh@test.com");
      expect(userInfo.image, "https://testimg.com");
      expect(userInfo.authToken, 'test_auth_token');
      expect(userInfo.refreshToken, 'test_refresh_token');
    });

    test('Check if the method "update" works', () {
      final userInfo = User.fromJson(testDataFromOrg, fromOrg: true);

      expect(userInfo.firstName, "ravidi");
      expect(userInfo.lastName, "sheikh");
      expect(userInfo.email, "ravidisheikh@test.com");
      expect(userInfo.image, "https://testimg.com");
      expect(userInfo.authToken, null);

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
      expect(loadedUserInfo.authToken, null);
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
