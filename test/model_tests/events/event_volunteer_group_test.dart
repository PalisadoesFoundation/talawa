import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/user/user_info.dart';

import '../../helpers/test_json_utils.dart';

/// Comprehensive test suite for EventVolunteerGroup model.
///
/// This test file covers two important scenarios:
/// 1. Testing EventVolunteerGroup.fromJson() directly with the correct data format
///    to ensure 100% coverage of the actual model's deserialization logic
/// 2. Testing TestJsonUtils.createEventVolunteerGroupFromJson() with nested API response format
///    to ensure the utility method correctly handles real-world API responses
///
/// Both approaches are necessary because:
/// - EventVolunteerGroup.fromJson() expects direct user data (fromOrg: true format)
/// - Real API responses often have nested user structures that TestJsonUtils handles
/// - We need both the model coverage AND the utility method validation

void main() {
  group('Test EventVolunteerGroup Model', () {
    test('Test EventVolunteerGroup fromJson', () {
      final eventVolunteerGroupJson = {
        '_id': 'group1',
        'createdAt': '2024-08-01T10:00:00Z',
        'creator': {
          'id': 'fakeCreatorId',
          'name': 'Creator Name',
          'emailAddress': 'creator@example.com',
        },
        'event': {
          'id': 'fakeEventId',
          'name': 'Sample Event',
          'description': 'Sample Description',
          'location': 'Sample Location',
        },
        'leader': {
          'id': 'fakeLeaderId',
          'name': 'Leader Name',
          'emailAddress': 'leader@example.com',
        },
        'name': 'Group Name',
        'updatedAt': '2024-08-05T15:30:00Z',
        'volunteers': [
          {
            '_id': 'volunteer1',
            'isAssigned': true,
            'response': 'Accepted',
          },
          {
            '_id': 'volunteer2',
            'isAssigned': false,
            'response': 'Pending',
          },
        ],
        'volunteersRequired': 5,
      };

      final eventVolunteerGroupFromJson =
          EventVolunteerGroup.fromJson(eventVolunteerGroupJson);

      expect(eventVolunteerGroupFromJson.id, 'group1');
      expect(eventVolunteerGroupFromJson.createdAt, '2024-08-01T10:00:00Z');
      expect(eventVolunteerGroupFromJson.creator?.id, 'fakeCreatorId');
      expect(eventVolunteerGroupFromJson.creator?.firstName, 'Creator');
      expect(eventVolunteerGroupFromJson.creator?.lastName, 'Name');
      expect(eventVolunteerGroupFromJson.event?.id, 'fakeEventId');
      expect(eventVolunteerGroupFromJson.event?.name, 'Sample Event');
      expect(eventVolunteerGroupFromJson.leader?.id, 'fakeLeaderId');
      expect(eventVolunteerGroupFromJson.leader?.firstName, 'Leader');
      expect(eventVolunteerGroupFromJson.leader?.lastName, 'Name');
      expect(eventVolunteerGroupFromJson.name, 'Group Name');
      expect(eventVolunteerGroupFromJson.updatedAt, '2024-08-05T15:30:00Z');
      expect(eventVolunteerGroupFromJson.volunteers?.length, 2);
      expect(eventVolunteerGroupFromJson.volunteers?[0].id, 'volunteer1');
      expect(eventVolunteerGroupFromJson.volunteers?[1].id, 'volunteer2');
      expect(eventVolunteerGroupFromJson.volunteersRequired, 5);
    });

    test('Test EventVolunteerGroup fromJson with null values', () {
      final eventVolunteerGroupJson = {
        '_id': 'group2',
        'createdAt': null,
        'creator': null,
        'event': null,
        'leader': null,
        'name': null,
        'updatedAt': null,
        'volunteers': null,
        'volunteersRequired': null,
      };

      final eventVolunteerGroupFromJson =
          EventVolunteerGroup.fromJson(eventVolunteerGroupJson);

      expect(eventVolunteerGroupFromJson.id, 'group2');
      expect(eventVolunteerGroupFromJson.createdAt, isNull);
      expect(eventVolunteerGroupFromJson.creator, isNull);
      expect(eventVolunteerGroupFromJson.event, isNull);
      expect(eventVolunteerGroupFromJson.leader, isNull);
      expect(eventVolunteerGroupFromJson.name, isNull);
      expect(eventVolunteerGroupFromJson.updatedAt, isNull);
      expect(eventVolunteerGroupFromJson.volunteers, isNull);
      expect(eventVolunteerGroupFromJson.volunteersRequired, isNull);
    });

    test('Test EventVolunteerGroup fromJson with minimal data', () {
      final eventVolunteerGroupJson = {
        '_id': 'group3',
      };

      final eventVolunteerGroupFromJson =
          EventVolunteerGroup.fromJson(eventVolunteerGroupJson);

      expect(eventVolunteerGroupFromJson.id, 'group3');
      expect(eventVolunteerGroupFromJson.createdAt, isNull);
      expect(eventVolunteerGroupFromJson.creator, isNull);
      expect(eventVolunteerGroupFromJson.event, isNull);
      expect(eventVolunteerGroupFromJson.leader, isNull);
      expect(eventVolunteerGroupFromJson.name, isNull);
      expect(eventVolunteerGroupFromJson.updatedAt, isNull);
      expect(eventVolunteerGroupFromJson.volunteers, isNull);
      expect(eventVolunteerGroupFromJson.volunteersRequired, isNull);
    });

    test('Test EventVolunteerGroup fromJson with empty json', () {
      final eventVolunteerGroupJson = <String, dynamic>{};

      final eventVolunteerGroupFromJson =
          EventVolunteerGroup.fromJson(eventVolunteerGroupJson);

      expect(eventVolunteerGroupFromJson.id, isNull);
      expect(eventVolunteerGroupFromJson.createdAt, isNull);
      expect(eventVolunteerGroupFromJson.creator, isNull);
      expect(eventVolunteerGroupFromJson.event, isNull);
      expect(eventVolunteerGroupFromJson.leader, isNull);
      expect(eventVolunteerGroupFromJson.name, isNull);
      expect(eventVolunteerGroupFromJson.updatedAt, isNull);
      expect(eventVolunteerGroupFromJson.volunteers, isNull);
      expect(eventVolunteerGroupFromJson.volunteersRequired, isNull);
    });

    test('Test EventVolunteerGroup fromJson with empty volunteers list', () {
      final eventVolunteerGroupJson = {
        '_id': 'group4',
        'name': 'Empty Group',
        'volunteers': <Map<String, dynamic>>[],
        'volunteersRequired': 0,
      };

      final eventVolunteerGroupFromJson =
          EventVolunteerGroup.fromJson(eventVolunteerGroupJson);

      expect(eventVolunteerGroupFromJson.id, 'group4');
      expect(eventVolunteerGroupFromJson.name, 'Empty Group');
      expect(eventVolunteerGroupFromJson.volunteers, isEmpty);
      expect(eventVolunteerGroupFromJson.volunteersRequired, 0);
    });

    test('Test EventVolunteerGroup fromJson with multiple volunteers', () {
      final eventVolunteerGroupJson = {
        '_id': 'group5',
        'name': 'Large Group',
        'volunteers': [
          {
            '_id': 'vol1',
            'isAssigned': true,
            'response': 'Accepted',
          },
          {
            '_id': 'vol2',
            'isAssigned': false,
            'response': 'Pending',
          },
          {
            '_id': 'vol3',
            'isAssigned': true,
            'response': 'Declined',
          },
        ],
        'volunteersRequired': 10,
      };

      final eventVolunteerGroupFromJson =
          EventVolunteerGroup.fromJson(eventVolunteerGroupJson);

      expect(eventVolunteerGroupFromJson.id, 'group5');
      expect(eventVolunteerGroupFromJson.name, 'Large Group');
      expect(eventVolunteerGroupFromJson.volunteers?.length, 3);
      expect(eventVolunteerGroupFromJson.volunteers?[0].id, 'vol1');
      expect(eventVolunteerGroupFromJson.volunteers?[1].id, 'vol2');
      expect(eventVolunteerGroupFromJson.volunteers?[2].id, 'vol3');
      expect(eventVolunteerGroupFromJson.volunteersRequired, 10);
    });

    test('Test EventVolunteerGroup constructor with all parameters', () {
      final creator = User(id: 'creatorId', name: 'Creator');
      final leader = User(id: 'leaderId', name: 'Leader');
      final event = Event(id: 'eventId', name: 'Test Event');
      final volunteers = [
        EventVolunteer(id: 'vol1'),
        EventVolunteer(id: 'vol2'),
      ];

      final eventVolunteerGroup = EventVolunteerGroup(
        id: 'constructorTest',
        createdAt: '2024-01-01T00:00:00Z',
        creator: creator,
        event: event,
        leader: leader,
        name: 'Constructor Test Group',
        updatedAt: '2024-01-02T00:00:00Z',
        volunteers: volunteers,
        volunteersRequired: 3,
      );

      expect(eventVolunteerGroup.id, 'constructorTest');
      expect(eventVolunteerGroup.createdAt, '2024-01-01T00:00:00Z');
      expect(eventVolunteerGroup.creator, creator);
      expect(eventVolunteerGroup.event, event);
      expect(eventVolunteerGroup.leader, leader);
      expect(eventVolunteerGroup.name, 'Constructor Test Group');
      expect(eventVolunteerGroup.updatedAt, '2024-01-02T00:00:00Z');
      expect(eventVolunteerGroup.volunteers, volunteers);
      expect(eventVolunteerGroup.volunteers?.length, 2);
      expect(eventVolunteerGroup.volunteersRequired, 3);
    });

    test('Test EventVolunteerGroup constructor with minimal parameters', () {
      final eventVolunteerGroup = EventVolunteerGroup();

      expect(eventVolunteerGroup.id, isNull);
      expect(eventVolunteerGroup.createdAt, isNull);
      expect(eventVolunteerGroup.creator, isNull);
      expect(eventVolunteerGroup.event, isNull);
      expect(eventVolunteerGroup.leader, isNull);
      expect(eventVolunteerGroup.name, isNull);
      expect(eventVolunteerGroup.updatedAt, isNull);
      expect(eventVolunteerGroup.volunteers, isNull);
      expect(eventVolunteerGroup.volunteersRequired, isNull);
    });

    test('Test EventVolunteerGroup constructor with some parameters', () {
      final eventVolunteerGroup = EventVolunteerGroup(
        id: 'partialTest',
        name: 'Partial Test Group',
        volunteersRequired: 5,
      );

      expect(eventVolunteerGroup.id, 'partialTest');
      expect(eventVolunteerGroup.name, 'Partial Test Group');
      expect(eventVolunteerGroup.volunteersRequired, 5);
      expect(eventVolunteerGroup.createdAt, isNull);
      expect(eventVolunteerGroup.creator, isNull);
      expect(eventVolunteerGroup.event, isNull);
      expect(eventVolunteerGroup.leader, isNull);
      expect(eventVolunteerGroup.updatedAt, isNull);
      expect(eventVolunteerGroup.volunteers, isNull);
    });

    test('Test EventVolunteerGroup property assignments and modifications', () {
      final eventVolunteerGroup = EventVolunteerGroup();

      // Test property assignments
      eventVolunteerGroup.id = 'newId';
      eventVolunteerGroup.createdAt = '2024-01-01T00:00:00Z';
      eventVolunteerGroup.updatedAt = '2024-01-02T00:00:00Z';
      eventVolunteerGroup.name = 'Modified Group';
      eventVolunteerGroup.volunteersRequired = 8;

      final testCreator = User(id: 'testCreatorId');
      final testLeader = User(id: 'testLeaderId');
      final testEvent = Event(id: 'testEventId');
      final testVolunteers = [EventVolunteer(id: 'testVolId')];

      eventVolunteerGroup.creator = testCreator;
      eventVolunteerGroup.leader = testLeader;
      eventVolunteerGroup.event = testEvent;
      eventVolunteerGroup.volunteers = testVolunteers;

      expect(eventVolunteerGroup.id, 'newId');
      expect(eventVolunteerGroup.createdAt, '2024-01-01T00:00:00Z');
      expect(eventVolunteerGroup.updatedAt, '2024-01-02T00:00:00Z');
      expect(eventVolunteerGroup.name, 'Modified Group');
      expect(eventVolunteerGroup.volunteersRequired, 8);
      expect(eventVolunteerGroup.creator, testCreator);
      expect(eventVolunteerGroup.leader, testLeader);
      expect(eventVolunteerGroup.event, testEvent);
      expect(eventVolunteerGroup.volunteers, testVolunteers);
    });

    test(
        'Test TestJsonUtils createEventVolunteerGroupFromJson with nested API response format',
        () {
      // This tests the TestJsonUtils method with the actual nested format
      // that comes from API responses (with nested 'user' structures)
      final eventVolunteerGroupJson = {
        '_id': 'utilsTest',
        'createdAt': '2024-08-01T10:00:00Z',
        'creator': {
          'user': {
            'id': 'utilsCreatorId',
            'name': 'Utils Creator',
          },
        },
        'event': {
          '_id': 'utilsEventId',
          'title': 'Utils Event',
        },
        'leader': {
          'user': {
            'id': 'utilsLeaderId',
            'name': 'Utils Leader',
          },
        },
        'name': 'Utils Group',
        'updatedAt': '2024-08-05T15:30:00Z',
        'volunteers': [
          {
            '_id': 'utilsVol1',
            'response': 'Accepted',
          },
        ],
        'volunteersRequired': 3,
      };

      final eventVolunteerGroupFromUtils =
          TestJsonUtils.createEventVolunteerGroupFromJson(
        eventVolunteerGroupJson,
      );

      expect(eventVolunteerGroupFromUtils.id, 'utilsTest');
      expect(eventVolunteerGroupFromUtils.createdAt, '2024-08-01T10:00:00Z');
      expect(eventVolunteerGroupFromUtils.creator?.id, 'utilsCreatorId');
      expect(eventVolunteerGroupFromUtils.event?.id, 'utilsEventId');
      expect(eventVolunteerGroupFromUtils.leader?.id, 'utilsLeaderId');
      expect(eventVolunteerGroupFromUtils.name, 'Utils Group');
      expect(eventVolunteerGroupFromUtils.updatedAt, '2024-08-05T15:30:00Z');
      expect(eventVolunteerGroupFromUtils.volunteers?.length, 1);
      expect(eventVolunteerGroupFromUtils.volunteers?[0].id, 'utilsVol1');
      expect(eventVolunteerGroupFromUtils.volunteersRequired, 3);
    });
  });
}
