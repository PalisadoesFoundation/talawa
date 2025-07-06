import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('EventVolunteer Model Tests', () {
    test('Constructor with all fields', () {
      final creator = User(id: "fakeCreatorId");
      final event = Event(
        id: 'fakeEventId',
        name: 'Sample Event',
        description: 'Sample Description',
        startAt: '2024-08-11T10:00:00Z',
        endAt: '2024-08-12T12:00:00Z',
      );
      final group = EventVolunteerGroup(id: 'group1', name: 'Group Name');
      final user = User(id: "fakeUserId");

      final volunteer = EventVolunteer(
        id: 'volunteer1',
        creator: creator,
        event: event,
        group: group,
        isAssigned: true,
        isInvited: false,
        response: 'Accepted',
        user: user,
      );

      expect(volunteer.id, 'volunteer1');
      expect(volunteer.creator, creator);
      expect(volunteer.event, event);
      expect(volunteer.group, group);
      expect(volunteer.isAssigned, true);
      expect(volunteer.isInvited, false);
      expect(volunteer.response, 'Accepted');
      expect(volunteer.user, user);
    });

    test('Constructor with no fields', () {
      final volunteer = EventVolunteer();

      expect(volunteer.id, null);
      expect(volunteer.creator, null);
      expect(volunteer.event, null);
      expect(volunteer.group, null);
      expect(volunteer.isAssigned, null);
      expect(volunteer.isInvited, null);
      expect(volunteer.response, null);
      expect(volunteer.user, null);
      expect(volunteer.createdAt, null);
      expect(volunteer.updatedAt, null);
    });

    test('fromJson with complete data', () {
      final json = {
        '_id': 'volunteer1',
        'createdAt': '2024-08-01T10:00:00Z',
        'creator': {
          'user': {'id': 'fakeCreatorId'},
        },
        'event': {
          '_id': 'fakeEventId',
          'name': 'Sample Event',
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
          'user': {'id': 'fakeUserId'},
        },
      };

      final volunteer = EventVolunteer.fromJson(json);

      expect(volunteer.id, 'volunteer1');
      expect(volunteer.createdAt, '2024-08-01T10:00:00Z');
      expect(volunteer.creator?.id, 'fakeCreatorId');
      expect(volunteer.event?.id, 'fakeEventId');
      expect(volunteer.group?.id, 'group1');
      expect(volunteer.isAssigned, true);
      expect(volunteer.isInvited, false);
      expect(volunteer.response, 'Accepted');
      expect(volunteer.updatedAt, '2024-08-02T10:00:00Z');
      expect(volunteer.user?.id, 'fakeUserId');
    });

    test('fromJson with null values', () {
      final json = {
        '_id': 'volunteer1',
        'creator': null,
        'event': null,
        'group': null,
        'isAssigned': null,
        'isInvited': null,
        'response': null,
        'user': null,
      };

      final volunteer = EventVolunteer.fromJson(json);

      expect(volunteer.id, 'volunteer1');
      expect(volunteer.creator, null);
      expect(volunteer.event, null);
      expect(volunteer.group, null);
      expect(volunteer.isAssigned, null);
      expect(volunteer.isInvited, null);
      expect(volunteer.response, null);
      expect(volunteer.user, null);
    });

    test('fromJson with missing fields', () {
      final json = {
        '_id': 'volunteer1',
      };

      final volunteer = EventVolunteer.fromJson(json);

      expect(volunteer.id, 'volunteer1');
      expect(volunteer.creator, null);
      expect(volunteer.event, null);
      expect(volunteer.group, null);
      expect(volunteer.isAssigned, null);
      expect(volunteer.isInvited, null);
      expect(volunteer.response, null);
      expect(volunteer.user, null);
    });

    test('fromJson with minimal nested event/user', () {
      final json = {
        '_id': 'volunteer1',
        'event': {
          '_id': 'eventId',
        },
        'user': {
          'user': {'id': 'userId'},
        },
      };

      final volunteer = EventVolunteer.fromJson(json);

      expect(volunteer.id, 'volunteer1');
      expect(volunteer.event?.id, 'eventId');
      expect(volunteer.user?.id, 'userId');
    });

    test('Manual field assignments', () {
      final volunteer = EventVolunteer();

      volunteer.id = 'test-id';
      volunteer.createdAt = '2024-01-01';
      volunteer.updatedAt = '2024-01-02';

      expect(volunteer.id, 'test-id');
      expect(volunteer.createdAt, '2024-01-01');
      expect(volunteer.updatedAt, '2024-01-02');
    });
  });
}
