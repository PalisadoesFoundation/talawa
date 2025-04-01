import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/organization/org_info.dart';

void main() {
  group('OrgInfo model tests', () {
    final Map<String, dynamic> userJson = {
      'user': {
        'id': 'user_id',
      },
      'authenticationToken': ' ',
      'refreshToken': ' ',
    };

    final Map<String, dynamic> json1 = {
      "id": "123",
      "name": "Name",
      "addressLine1": "123 Random Street",
      "addressLine2": "Apartment 456",
      "avatarURL": "image_url",
      "postalCode": "110001",
      "countryCode": "in",
      "description": "Description",
      "city": "Delhi",
      "state": "Delhi",
      "members": {
        "edges": [
          {
            "node": {
              "id": "id123",
              "name": "user_id",
              "role": "administrator",
            },
          }
        ],
      },
    };

    final Map<String, dynamic> json2 = {
      '_id': '321',
      'image': 'image_url',
      'name': 'Name',
      'description': 'Description',
      'userRegistrationRequired': false,
      'creator': userJson,
      'members': [userJson],
      'admins': [userJson],
      'address': {
        "city": "Delhi",
        "countryCode": "IN",
        "dependentLocality": "Some Dependent Locality",
        "line1": "123 Random Street",
        "line2": "Apartment 456",
        "postalCode": "110001",
        "sortingCode": "ABC-123",
        "state": "Delhi",
      },
    };

    test('Test fromJson function', () {
      final OrgInfo result = OrgInfo.fromJson(json1);

      expect(result.id, '123');
      expect(result.image, 'image_url');
      expect(result.name, 'Name');
      expect(result.description, 'Description');
      expect(result.members!.length, 1);
      expect(result.city, 'Delhi');
      expect(result.countryCode, "in");
      expect(result.state, 'Delhi');
    });
  });

  group('Hive adapter test', () {
    test('OrgInfoAdapter equality operator', () {
      final adapter1 = OrgInfoAdapter();
      final adapter2 = OrgInfoAdapter();

      // Test equality
      expect(
        adapter1 == adapter2,
        isTrue,
        reason: 'Two instances of OrgInfoAdapter should be equal',
      );
      expect(
        adapter1.hashCode == adapter2.hashCode,
        isTrue,
        reason: 'Hash codes should be equal',
      );
    });
  });
}
