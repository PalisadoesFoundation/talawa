import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';
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
};

void main() {
  group("Tests for UserInfo.dart", () {
    test('Check if UserInfo.fromJson works with fromOrg', () {
      final userInfo = User.fromJson(testDataFromOrg);

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
      expect(userInfo.refreshToken, null);
    });

    test('Check if the method "update" works', () {
      final userInfo = User.fromJson(testDataFromOrg);

      expect(userInfo.firstName, "ravidi");
      expect(userInfo.lastName, "sheikh");
      expect(userInfo.email, "ravidisheikh@test.com");
      expect(userInfo.image, "https://testimg.com");
      expect(userInfo.authToken, null);

      userInfo.update(
        User(
          name: "ravidi_updated sheikh_updated",
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
    test('Check if Hive storage works', () async {
      final userBox = await Hive.openBox('userInfo');
      expect(userBox.isOpen, true);

      final userInfo = User.fromJson(testDataFromOrg);
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
  group('User.updateJoinedg', () {
    test('adds organization to null joinedOrganizations list', () {
      // Arrange
      final user = User(joinedOrganizations: null);
      final newOrg = OrgInfo(id: 'org1', name: 'Organization 1');

      // Act
      user.updateJoinedOrg(newOrg);

      // Assert
      expect(user.joinedOrganizations, isNotNull);
      expect(user.joinedOrganizations!.length, 1);
      expect(user.joinedOrganizations!.first.id, 'org1');
    });

    test('adds organization to empty joinedOrganizations list', () {
      // Arrange
      final user = User(joinedOrganizations: []);
      final newOrg = OrgInfo(id: 'org1', name: 'Organization 1');

      // Act
      user.updateJoinedOrg(newOrg);

      // Assert
      expect(user.joinedOrganizations!.length, 1);
      expect(user.joinedOrganizations!.first.id, 'org1');
    });

    test('adds organization to non-empty joinedOrganizations list', () {
      // Arrange
      final user = User(
        joinedOrganizations: [
          OrgInfo(id: 'org2', name: 'Organization 2'),
          OrgInfo(id: 'org3', name: 'Organization 3'),
        ],
      );
      final newOrg = OrgInfo(id: 'org1', name: 'Organization 1');

      // Act
      user.updateJoinedOrg(newOrg);

      // Assert
      expect(user.joinedOrganizations!.length, 3);
      expect(user.joinedOrganizations!.first.id, 'org1');
      expect(user.joinedOrganizations![1].id, 'org2');
      expect(user.joinedOrganizations![2].id, 'org3');
    });

    test('replaces existing organization with same ID', () {
      // Arrange
      final user = User(
        joinedOrganizations: [
          OrgInfo(id: 'org1', name: 'Old Name'),
          OrgInfo(id: 'org2', name: 'Organization 2'),
        ],
      );
      final updatedOrg = OrgInfo(id: 'org1', name: 'New Name');

      // Act
      user.updateJoinedOrg(updatedOrg);

      // Assert
      expect(user.joinedOrganizations!.length, 2);
      expect(user.joinedOrganizations!.first.id, 'org1');
      expect(user.joinedOrganizations!.first.name, 'New Name');
      expect(user.joinedOrganizations![1].id, 'org2');
    });

    test('removes all duplicate organizations with same ID', () {
      // Arrange
      final user = User(
        joinedOrganizations: [
          OrgInfo(id: 'org1', name: 'First Instance'),
          OrgInfo(id: 'org2', name: 'Organization 2'),
          OrgInfo(id: 'org1', name: 'Second Instance'), // Duplicate
        ],
      );
      final updatedOrg = OrgInfo(id: 'org1', name: 'Updated Org');

      // Act
      user.updateJoinedOrg(updatedOrg);

      // Assert
      expect(user.joinedOrganizations!.length, 2);
      expect(user.joinedOrganizations!.first.id, 'org1');
      expect(user.joinedOrganizations!.first.name, 'Updated Org');
      expect(user.joinedOrganizations![1].id, 'org2');
    });
  });

  group('User equality tests', () {
    test('Users with same id are equal', () {
      final user1 = User(id: '123', name: 'John Doe');
      final user2 = User(id: '123', name: 'Jane Smith');

      expect(user1 == user2, true);
      expect(user1.hashCode, user2.hashCode);
    });

    test('Users with different ids are not equal', () {
      final user1 = User(id: '123', name: 'John Doe');
      final user2 = User(id: '456', name: 'John Doe');

      expect(user1 == user2, false);
    });

    test('User is equal to itself', () {
      final user = User(id: '123', name: 'John Doe');

      expect(user == user, true);
      expect(user.hashCode, user.hashCode);
    });

    test('Users with null ids are handled correctly', () {
      final user1 = User(id: null, name: 'John Doe');
      final user2 = User(id: null, name: 'Jane Smith');

      expect(user1 == user2, true);
      expect(user1.hashCode, user2.hashCode);
    });

    test('Set operations work correctly with User equality', () {
      final user1 = User(id: '123', name: 'John Doe');
      final user2 = User(
        id: '123',
        name: 'Jane Smith',
      ); // Same id, different name
      final user3 = User(id: '456', name: 'Bob Wilson');

      final userSet = <User>{user1, user2, user3};

      // Should only contain 2 users since user1 and user2 have same id
      expect(userSet.length, 2);
      expect(userSet.contains(user1), true);
      expect(
        userSet.contains(user2),
        true,
      ); // Should find user1 since they're equal
      expect(userSet.contains(user3), true);

      // Test remove
      userSet.remove(user2); // Should remove user1 since they're equal
      expect(userSet.length, 1);
      expect(userSet.contains(user1), false);
      expect(userSet.contains(user3), true);
    });

    test('Set dedupes users with null ids per equality contract', () {
      final a = User(id: null, name: 'A');
      final b = User(id: null, name: 'B');
      final s = <User>{a, b};
      expect(s.length, 1);
    });
  });
}
