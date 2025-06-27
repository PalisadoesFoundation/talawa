import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/user/user_info.dart';

import '../../helpers/test_json_utils.dart';

/// Comprehensive test suite for EventVolunteer model.
///
/// This test file covers two important scenarios:
/// 1. Testing EventVolunteer.fromJson() directly with the correct data format
///    to ensure 100% coverage of the actual model's deserialization logic
/// 2. Testing TestJsonUtils.createEventVolunteerFromJson() with nested API response format
///    to ensure the utility method correctly handles real-world API responses
///
/// Both approaches are necessary because:
/// - EventVolunteer.fromJson() expects direct user data (fromOrg: true format)
/// - Real API responses often have nested user structures that TestJsonUtils handles
/// - We need both the model coverage AND the utility method validation

void main() {
  group('Test EventVolunteer Model', () {
    test('Test EventVolunteer fromJson', () {
      final eventVolunteerJson = {
        '_id': 'volunteer1',
        'creator': {
          'id': 'fakeCreatorId',
          'name': 'Creator Name',
          'emailAddress': 'creator@example.com',
        },
        'event': {
          '_id': 'fakeEventId',
          'title': 'Sample Event',
          'description': 'Sample Description',
          'location': 'Sample Location',
          'startDate': '2024-08-11',
          'endDate': '2024-08-12',
          'startTime': '10:00 AM',
          'endTime': '12:00 PM',
        },
        'group': {
          '_id': 'group1',
          'name': 'Group Name',
        },
        'isAssigned': true,
        'isInvited': false,
        'response': 'Accepted',
        'user': {
          'id': 'fakeUserId',
          'name': 'User Name',
          'emailAddress': 'user@example.com',
        },
      };

      final eventVolunteerFromJson =
          EventVolunteer.fromJson(eventVolunteerJson);

      // Verifying that all fields were correctly deserialized
      expect(eventVolunteerFromJson.id, 'volunteer1');
      expect(eventVolunteerFromJson.creator?.id, 'fakeCreatorId');
      expect(eventVolunteerFromJson.creator?.firstName, 'Creator');
      expect(eventVolunteerFromJson.creator?.lastName, 'Name');
      expect(eventVolunteerFromJson.event?.id, 'fakeEventId');
      expect(eventVolunteerFromJson.event?.title, 'Sample Event');
      expect(eventVolunteerFromJson.group?.id, 'group1');
      expect(eventVolunteerFromJson.group?.name, 'Group Name');
      expect(eventVolunteerFromJson.isAssigned, true);
      expect(eventVolunteerFromJson.isInvited, false);
      expect(eventVolunteerFromJson.response, 'Accepted');
      expect(eventVolunteerFromJson.user?.id, 'fakeUserId');
      expect(eventVolunteerFromJson.user?.firstName, 'User');
      expect(eventVolunteerFromJson.user?.lastName, 'Name');
    });

    test('Test EventVolunteer fromJson with null and missing fields', () {
      final eventVolunteerJson = {
        '_id': 'volunteer2',
        'creator': null,
        'event': null,
        'group': null,
        'isAssigned': false,
        'isInvited': true,
        'response': null,
        'user': null,
      };

      final eventVolunteerFromJson =
          EventVolunteer.fromJson(eventVolunteerJson);

      expect(eventVolunteerFromJson.id, 'volunteer2');
      expect(eventVolunteerFromJson.creator, null);
      expect(eventVolunteerFromJson.event, null);
      expect(eventVolunteerFromJson.group, null);
      expect(eventVolunteerFromJson.isAssigned, false);
      expect(eventVolunteerFromJson.isInvited, true);
      expect(eventVolunteerFromJson.response, null);
      expect(eventVolunteerFromJson.user, null);
    });

    test('Test EventVolunteer fromJson with minimal data', () {
      final eventVolunteerJson = {
        '_id': 'volunteer3',
      };

      final eventVolunteerFromJson =
          EventVolunteer.fromJson(eventVolunteerJson);

      expect(eventVolunteerFromJson.id, 'volunteer3');
      expect(eventVolunteerFromJson.creator, null);
      expect(eventVolunteerFromJson.event, null);
      expect(eventVolunteerFromJson.group, null);
      expect(eventVolunteerFromJson.isAssigned, null);
      expect(eventVolunteerFromJson.isInvited, null);
      expect(eventVolunteerFromJson.response, null);
      expect(eventVolunteerFromJson.user, null);
    });

    test('Test EventVolunteer fromJson with empty json', () {
      final eventVolunteerJson = <String, dynamic>{};

      final eventVolunteerFromJson =
          EventVolunteer.fromJson(eventVolunteerJson);

      expect(eventVolunteerFromJson.id, null);
      expect(eventVolunteerFromJson.creator, null);
      expect(eventVolunteerFromJson.event, null);
      expect(eventVolunteerFromJson.group, null);
      expect(eventVolunteerFromJson.isAssigned, null);
      expect(eventVolunteerFromJson.isInvited, null);
      expect(eventVolunteerFromJson.response, null);
      expect(eventVolunteerFromJson.user, null);
    });

    test('Test EventVolunteer constructor with all parameters', () {
      final creator = User(id: "creatorId", firstName: "Creator");
      final event = Event(id: 'eventId', title: 'Test Event');
      final group = EventVolunteerGroup(id: 'groupId', name: 'Test Group');
      final user = User(id: "userId", firstName: "Volunteer");

      final eventVolunteer = EventVolunteer(
        id: 'volunteerId',
        creator: creator,
        event: event,
        group: group,
        isAssigned: true,
        isInvited: false,
        response: 'Accepted',
        user: user,
      );

      expect(eventVolunteer.id, 'volunteerId');
      expect(eventVolunteer.creator, creator);
      expect(eventVolunteer.event, event);
      expect(eventVolunteer.group, group);
      expect(eventVolunteer.isAssigned, true);
      expect(eventVolunteer.isInvited, false);
      expect(eventVolunteer.response, 'Accepted');
      expect(eventVolunteer.user, user);
    });

    test('Test EventVolunteer constructor with minimal parameters', () {
      final eventVolunteer = EventVolunteer();

      expect(eventVolunteer.id, null);
      expect(eventVolunteer.creator, null);
      expect(eventVolunteer.event, null);
      expect(eventVolunteer.group, null);
      expect(eventVolunteer.isAssigned, null);
      expect(eventVolunteer.isInvited, null);
      expect(eventVolunteer.response, null);
      expect(eventVolunteer.user, null);
    });

    test('Test EventVolunteer constructor with only some parameters', () {
      final eventVolunteer = EventVolunteer(
        id: 'testId',
        isAssigned: false,
        response: 'Pending',
      );

      expect(eventVolunteer.id, 'testId');
      expect(eventVolunteer.creator, null);
      expect(eventVolunteer.event, null);
      expect(eventVolunteer.group, null);
      expect(eventVolunteer.isAssigned, false);
      expect(eventVolunteer.isInvited, null);
      expect(eventVolunteer.response, 'Pending');
      expect(eventVolunteer.user, null);
    });

    test('Test EventVolunteer fromJson with complex nested structures', () {
      final eventVolunteerJson = {
        '_id': 'volunteer4',
        'creator': {
          'id': 'creatorId',
          'name': 'John Doe',
          'emailAddress': 'john.doe@example.com',
          'avatarURL': 'https://example.com/avatar.jpg',
        },
        'event': {
          '_id': 'eventId',
          'title': 'Complex Event',
          'description': 'This is a complex event',
          'location': 'Complex Location',
          'startDate': '2024-12-01',
          'endDate': '2024-12-02',
          'startTime': '09:00 AM',
          'endTime': '05:00 PM',
          'allDay': false,
          'recurring': false,
        },
        'group': {
          '_id': 'groupId',
          'name': 'Complex Group',
          'description': 'This is a complex group',
          'volunteersRequired': 10,
        },
        'isAssigned': true,
        'isInvited': true,
        'response': 'Accepted',
        'user': {
          'id': 'volunteerId',
          'name': 'Jane Smith',
          'emailAddress': 'jane.smith@example.com',
          'avatarURL': 'https://example.com/volunteer.jpg',
        },
      };

      final eventVolunteerFromJson =
          EventVolunteer.fromJson(eventVolunteerJson);

      expect(eventVolunteerFromJson.id, 'volunteer4');
      expect(eventVolunteerFromJson.creator?.id, 'creatorId');
      expect(eventVolunteerFromJson.creator?.firstName, 'John');
      expect(eventVolunteerFromJson.creator?.lastName, 'Doe');
      expect(eventVolunteerFromJson.creator?.email, 'john.doe@example.com');
      expect(eventVolunteerFromJson.event?.id, 'eventId');
      expect(eventVolunteerFromJson.event?.title, 'Complex Event');
      expect(eventVolunteerFromJson.group?.id, 'groupId');
      expect(eventVolunteerFromJson.group?.name, 'Complex Group');
      expect(eventVolunteerFromJson.isAssigned, true);
      expect(eventVolunteerFromJson.isInvited, true);
      expect(eventVolunteerFromJson.response, 'Accepted');
      expect(eventVolunteerFromJson.user?.id, 'volunteerId');
      expect(eventVolunteerFromJson.user?.firstName, 'Jane');
      expect(eventVolunteerFromJson.user?.lastName, 'Smith');
      expect(eventVolunteerFromJson.user?.email, 'jane.smith@example.com');
    });

    test('Test EventVolunteer property assignments and modifications', () {
      final eventVolunteer = EventVolunteer();

      // Test property assignments
      eventVolunteer.id = 'newId';
      eventVolunteer.createdAt = '2024-01-01T00:00:00Z';
      eventVolunteer.updatedAt = '2024-01-02T00:00:00Z';
      eventVolunteer.isAssigned = true;
      eventVolunteer.isInvited = false;
      eventVolunteer.response = 'Declined';

      final testCreator = User(id: 'testCreatorId');
      final testEvent = Event(id: 'testEventId');
      final testGroup = EventVolunteerGroup(id: 'testGroupId');
      final testUser = User(id: 'testUserId');

      eventVolunteer.creator = testCreator;
      eventVolunteer.event = testEvent;
      eventVolunteer.group = testGroup;
      eventVolunteer.user = testUser;

      expect(eventVolunteer.id, 'newId');
      expect(eventVolunteer.createdAt, '2024-01-01T00:00:00Z');
      expect(eventVolunteer.updatedAt, '2024-01-02T00:00:00Z');
      expect(eventVolunteer.isAssigned, true);
      expect(eventVolunteer.isInvited, false);
      expect(eventVolunteer.response, 'Declined');
      expect(eventVolunteer.creator, testCreator);
      expect(eventVolunteer.event, testEvent);
      expect(eventVolunteer.group, testGroup);
      expect(eventVolunteer.user, testUser);
    });

    test(
        'Test TestJsonUtils createEventVolunteerFromJson with nested API response format',
        () {
      // This tests the TestJsonUtils method with the actual nested format
      // that comes from API responses (with nested 'user' structures)
      final eventVolunteerJson = {
        '_id': 'utilsTest',
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
        'group': {
          '_id': 'utilsGroupId',
          'name': 'Utils Group',
        },
        'isAssigned': false,
        'isInvited': true,
        'response': 'Pending',
        'user': {
          'user': {
            'id': 'utilsUserId',
            'name': 'Utils User',
          },
        },
      };

      final eventVolunteerFromUtils =
          TestJsonUtils.createEventVolunteerFromJson(eventVolunteerJson);

      expect(eventVolunteerFromUtils.id, 'utilsTest');
      expect(eventVolunteerFromUtils.creator?.id, 'utilsCreatorId');
      expect(eventVolunteerFromUtils.event?.id, 'utilsEventId');
      expect(eventVolunteerFromUtils.group?.id, 'utilsGroupId');
      expect(eventVolunteerFromUtils.isAssigned, false);
      expect(eventVolunteerFromUtils.isInvited, true);
      expect(eventVolunteerFromUtils.response, 'Pending');
      expect(eventVolunteerFromUtils.user?.id, 'utilsUserId');
    });
  });
}
