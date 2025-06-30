import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Test EventVolunteer Model', () {
    test('Test EventVolunteer constructor with all fields', () {
      final User creator = User(id: "fakeCreatorId");
      final Event event = Event(
        id: 'fakeEventId',
        name: 'Sample Event',
        description: 'Sample Description',
        startAt: '2024-08-11T10:00:00Z',
        endAt: '2024-08-12T12:00:00Z',
      );
      final EventVolunteerGroup group = EventVolunteerGroup(
        id: 'group1',
        name: 'Group Name',
      );
      final User user = User(id: "fakeUserId");

      final eventVolunteer = EventVolunteer(
        id: 'volunteer1',
        creator: creator,
        event: event,
        group: group,
        isAssigned: true,
        isInvited: false,
        response: 'Accepted',
        user: user,
      );

      expect(eventVolunteer.id, 'volunteer1');
      expect(eventVolunteer.creator, creator);
      expect(eventVolunteer.event, event);
      expect(eventVolunteer.group, group);
      expect(eventVolunteer.isAssigned, true);
      expect(eventVolunteer.isInvited, false);
      expect(eventVolunteer.response, 'Accepted');
      expect(eventVolunteer.user, user);
    });

    test('Test EventVolunteer constructor with minimal fields', () {
      final eventVolunteer = EventVolunteer();

      expect(eventVolunteer.id, null);
      expect(eventVolunteer.creator, null);
      expect(eventVolunteer.event, null);
      expect(eventVolunteer.group, null);
      expect(eventVolunteer.isAssigned, null);
      expect(eventVolunteer.isInvited, null);
      expect(eventVolunteer.response, null);
      expect(eventVolunteer.user, null);
      expect(eventVolunteer.createdAt, null);
      expect(eventVolunteer.updatedAt, null);
    });

    test('Test EventVolunteer fromJson with complete data', () {
      final eventVolunteerJson = {
        '_id': 'volunteer1',
        'createdAt': '2024-08-01T10:00:00Z',
        'creator': {
          'user': {
            'id': 'fakeCreatorId',
          },
        },
        'event': {
          '_id': 'fakeEventId',
          'title': 'Sample Event',
          'description': 'Sample Description',
          'startAt': '2024-08-11T10:00:00Z',
          'endAt': '2024-08-12T12:00:00Z',
        },
        'group': {
          '_id': 'group1',
          'name': 'Group Name',
        },
        'isAssigned': true,
        'isInvited': false,
        'response': 'Accepted',
        'updatedAt': '2024-08-02T10:00:00Z',
        'user': {
          'user': {
            'id': 'fakeUserId',
          },
        },
      };

      final eventVolunteerFromJson =
          EventVolunteer.fromJson(eventVolunteerJson);

      // Verifying that all fields were correctly deserialized
      expect(eventVolunteerFromJson.id, 'volunteer1');
      expect(eventVolunteerFromJson.createdAt, '2024-08-01T10:00:00Z');
      expect(eventVolunteerFromJson.creator?.id, 'fakeCreatorId');
      expect(eventVolunteerFromJson.event?.id, 'fakeEventId');
      expect(eventVolunteerFromJson.group?.id, 'group1');
      expect(eventVolunteerFromJson.isAssigned, true);
      expect(eventVolunteerFromJson.isInvited, false);
      expect(eventVolunteerFromJson.response, 'Accepted');
      expect(eventVolunteerFromJson.updatedAt, '2024-08-02T10:00:00Z');
      expect(eventVolunteerFromJson.user?.id, 'fakeUserId');
    });

    test('Test EventVolunteer fromJson with null values', () {
      final eventVolunteerJson = {
        '_id': 'volunteer1',
        'creator': null,
        'event': null,
        'group': null,
        'isAssigned': null,
        'isInvited': null,
        'response': null,
        'user': null,
      };

      final eventVolunteerFromJson =
          EventVolunteer.fromJson(eventVolunteerJson);

      expect(eventVolunteerFromJson.id, 'volunteer1');
      expect(eventVolunteerFromJson.creator, null);
      expect(eventVolunteerFromJson.event, null);
      expect(eventVolunteerFromJson.group, null);
      expect(eventVolunteerFromJson.isAssigned, null);
      expect(eventVolunteerFromJson.isInvited, null);
      expect(eventVolunteerFromJson.response, null);
      expect(eventVolunteerFromJson.user, null);
    });

    test('Test EventVolunteer fromJson with missing fields', () {
      final eventVolunteerJson = <String, dynamic>{
        '_id': 'volunteer1',
      };

      final eventVolunteerFromJson =
          EventVolunteer.fromJson(eventVolunteerJson);

      expect(eventVolunteerFromJson.id, 'volunteer1');
      expect(eventVolunteerFromJson.creator, null);
      expect(eventVolunteerFromJson.event, null);
      expect(eventVolunteerFromJson.group, null);
      expect(eventVolunteerFromJson.isAssigned, null);
      expect(eventVolunteerFromJson.isInvited, null);
      expect(eventVolunteerFromJson.response, null);
      expect(eventVolunteerFromJson.user, null);
    });

    test('Test EventVolunteer fromJson with minimal event data', () {
      final eventVolunteerJson = {
        '_id': 'volunteer1',
        'event': {
          '_id': 'eventId',
        },
        'user': {
          'user': {
            'id': 'userId',
          },
        },
      };

      final eventVolunteerFromJson =
          EventVolunteer.fromJson(eventVolunteerJson);

      expect(eventVolunteerFromJson.id, 'volunteer1');
      expect(eventVolunteerFromJson.event?.id, 'eventId');
      expect(eventVolunteerFromJson.user?.id, 'userId');
    });

    test('Test EventVolunteer with all field assignments', () {
      final eventVolunteer = EventVolunteer();

      // Test direct field assignments to cover all properties
      eventVolunteer.id = 'test-id';
      eventVolunteer.createdAt = '2024-01-01';
      eventVolunteer.updatedAt = '2024-01-02';

      expect(eventVolunteer.id, 'test-id');
      expect(eventVolunteer.createdAt, '2024-01-01');
      expect(eventVolunteer.updatedAt, '2024-01-02');
    });
  });
}
