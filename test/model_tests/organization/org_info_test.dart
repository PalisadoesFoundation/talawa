import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/organization/org_info.dart';

void main() {
  late OrgInfo instance;

  setUp(() {
    instance = OrgInfo();
  });
  group('OrgInfo model tests', () {
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
      "isUserRegistrationRequired": true,
    };

    test('Test fromJson function', () {
      final OrgInfo result = OrgInfo.fromJson(json1);

      expect(result.id, '123');
      expect(result.image, 'image_url');
      expect(result.name, 'Name');
      expect(result.description, 'Description');
      expect(result.city, 'Delhi');
      expect(result.countryCode, "in");
      expect(result.state, 'Delhi');
      expect(result.userRegistrationRequired, true);
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

  group('OrgInfo Equality', () {
    test('equality and hashCode', () {
      final org1 = OrgInfo(id: '1', name: 'Org 1');
      final org2 = OrgInfo(id: '1', name: 'Org 1');
      final org3 = OrgInfo(id: '2', name: 'Org 2');

      // Test equality
      expect(org1 == org2, isTrue);
      expect(org1 == org3, isFalse);

      // Test hashCode
      expect(org1.hashCode == org2.hashCode, isTrue);
      expect(org1.hashCode == org3.hashCode, isFalse);
    });
  });

  group('fromJsonToList', () {
    test('returns empty list when json is null', () {
      final result = instance.fromJsonToList(null);
      expect(result, isEmpty);
    });

    test('returns empty list when json is empty list', () {
      final result = instance.fromJsonToList([]);
      expect(result, isEmpty);
    });

    test('does not parse single Map<String, dynamic> directly', () {
      final json = {
        'id': '1',
        'name': 'Test Org',
      };
      final result = instance.fromJsonToList(json);
      expect(result, isEmpty);
    });

    test('parses single map when wrapped in a list', () {
      final json = [
        {
          'id': '1',
          'name': 'Test Org',
        }
      ];
      final result = instance.fromJsonToList(json);

      expect(result, hasLength(1));
      expect(result.first.id, '1');
      expect(result.first.name, 'Test Org');
    });

    test('parses flat list of maps correctly', () {
      final json = [
        {'id': '1', 'name': 'Org 1'},
        {'id': '2', 'name': 'Org 2'},
        {'id': '3', 'name': 'Org 3'},
      ];

      final result = instance.fromJsonToList(json);

      expect(result, hasLength(3));
      expect(result[0].id, '1');
      expect(result[1].id, '2');
      expect(result[2].id, '3');
    });

    test('parses nested list of lists correctly', () {
      final json = [
        [
          {'id': '1', 'name': 'Org 1'},
          {'id': '2', 'name': 'Org 2'},
        ],
        [
          {'id': '3', 'name': 'Org 3'},
        ],
      ];

      final result = instance.fromJsonToList(json);

      expect(result, hasLength(3));
      expect(result[0].id, '1');
      expect(result[1].id, '2');
      expect(result[2].id, '3');
    });

    test('handles mixed nested and flat structure', () {
      final json = [
        {'id': '1', 'name': 'Org 1'},
        [
          {'id': '2', 'name': 'Org 2'},
          {'id': '3', 'name': 'Org 3'},
        ],
        {'id': '4', 'name': 'Org 4'},
      ];

      final result = instance.fromJsonToList(json);

      expect(result, hasLength(4));
      expect(result[0].id, '1');
      expect(result[1].id, '2');
      expect(result[2].id, '3');
      expect(result[3].id, '4');
    });

    test('skips invalid elements in list', () {
      final json = [
        {'id': '1', 'name': 'Org 1'},
        'invalid string',
        123,
        {'id': '2', 'name': 'Org 2'},
        null,
      ];

      final result = instance.fromJsonToList(json);

      expect(result, hasLength(2));
      expect(result[0].id, '1');
      expect(result[1].id, '2');
    });

    test('skips invalid maps in nested lists', () {
      final json = [
        [
          {'id': '1', 'name': 'Org 1'},
          'invalid',
        ],
        [
          {'id': '2', 'name': 'Org 2'},
        ],
      ];

      final result = instance.fromJsonToList(json);

      expect(result, hasLength(2));
    });

    test('returns empty list for invalid json types', () {
      expect(instance.fromJsonToList('string'), isEmpty);
      expect(instance.fromJsonToList(123), isEmpty);
      expect(instance.fromJsonToList(true), isEmpty);
    });

    test('handles empty nested lists', () {
      final json = [
        [],
        {'id': '1', 'name': 'Org 1'},
        [],
      ];

      final result = instance.fromJsonToList(json);

      expect(result, hasLength(1));
      expect(result[0].id, '1');
    });

    test('does not handle deeply nested lists (more than 2 levels)', () {
      final json = [
        [
          [
            {'id': '1', 'name': 'Org 1'},
          ],
        ],
      ];

      final result = instance.fromJsonToList(json);

      expect(result, isEmpty);
    });

    group('fromBasicJsonToList', () {
      test('returns empty list when data is null', () {
        final result = instance.fromBasicJsonToList(null);

        expect(result, isEmpty);
      });

      test('returns empty list when data is empty map', () {
        final result = instance.fromBasicJsonToList({});

        expect(result, isEmpty);
      });

      test('returns empty list when organizations key is missing', () {
        final data = {
          'someOtherKey': 'value',
        };

        final result = instance.fromBasicJsonToList(data);

        expect(result, isEmpty);
      });

      test('returns empty list when organizations is null', () {
        final data = {
          'organizations': null,
        };

        final result = instance.fromBasicJsonToList(data);

        expect(result, isEmpty);
      });

      test('returns empty list when organizations is not a list', () {
        final data = {
          'organizations': 'not a list',
        };

        final result = instance.fromBasicJsonToList(data);

        expect(result, isEmpty);
      });

      test('parses organizations list correctly', () {
        final data = {
          'organizations': [
            {'id': '1', 'name': 'Org 1'},
            {'id': '2', 'name': 'Org 2'},
            {'id': '3', 'name': 'Org 3'},
          ],
        };

        final result = instance.fromBasicJsonToList(data);

        expect(result, hasLength(3));
        expect(result[0].id, '1');
        expect(result[1].id, '2');
        expect(result[2].id, '3');
      });

      test('skips invalid items in organizations list', () {
        final data = {
          'organizations': [
            {'id': '1', 'name': 'Org 1'},
            'invalid',
            null,
            {'id': '2', 'name': 'Org 2'},
            123,
          ],
        };

        final result = instance.fromBasicJsonToList(data);

        expect(result, hasLength(2));
        expect(result[0].id, '1');
        expect(result[1].id, '2');
      });

      test('handles empty organizations list', () {
        final data = {
          'organizations': [],
        };

        final result = instance.fromBasicJsonToList(data);

        expect(result, isEmpty);
      });

      test('ignores other keys in data', () {
        final data = {
          'organizations': [
            {'id': '1', 'name': 'Org 1'},
          ],
          'otherKey': 'value',
          'anotherKey': 123,
        };

        final result = instance.fromBasicJsonToList(data);

        expect(result, hasLength(1));
        expect(result[0].id, '1');
      });

      test('does not handle nested lists in organizations', () {
        final data = {
          'organizations': [
            [
              {'id': '1', 'name': 'Org 1'},
              {'id': '2', 'name': 'Org 2'},
            ],
          ],
        };

        final result = instance.fromBasicJsonToList(data);
        expect(result, isEmpty);
      });

      test('handles flat list in organizations', () {
        final data = {
          'organizations': [
            {'id': '1', 'name': 'Org 1'},
            {'id': '2', 'name': 'Org 2'},
          ],
        };

        final result = instance.fromBasicJsonToList(data);

        expect(result, hasLength(2));
        expect(result[0].id, '1');
        expect(result[1].id, '2');
      });
    });
  });
}
