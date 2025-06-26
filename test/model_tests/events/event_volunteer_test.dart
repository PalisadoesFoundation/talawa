import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/user/user_info.dart';

// Test-specific wrapper for EventVolunteer.fromJson to handle nested user structure
EventVolunteer eventVolunteerFromJsonTest(Map<String, dynamic> json) {
  return EventVolunteer(
    id: json['_id'] as String?,
    creator: json['creator'] != null
        ? User.fromJson(json['creator'] as Map<String, dynamic>)
        : null,
    event: json['event'] != null
        ? Event.fromJson(json['event'] as Map<String, dynamic>)
        : null,
    group: json['group'] != null
        ? EventVolunteerGroup.fromJson(json['group'] as Map<String, dynamic>)
        : null,
    isAssigned: json['isAssigned'] as bool?,
    isInvited: json['isInvited'] as bool?,
    response: json['response'] as String?,
    user: json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null,
  );
}

void main() {
  group('Test EventVolunteer Model', () {
    test('Test EventVolunteer fromJson', () {
      final User creator = User(id: "fakeCreatorId");
      final Event event = Event(
        id: 'fakeEventId',
        title: 'Sample Event',
        description: 'Sample Description',
        location: 'Sample Location',
        startDate: '2024-08-11',
        endDate: '2024-08-12',
        startTime: '10:00 AM',
        endTime: '12:00 PM',
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
      final eventVolunteerJson = {
        '_id': 'volunteer1',
        'creator': {
          'user': {
            'id': 'fakeCreatorId',
          },
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
          'user': {
            'id': 'fakeUserId',
          },
        },
      };

      final eventVolunteerFromJson =
          eventVolunteerFromJsonTest(eventVolunteerJson);

      // Verifying that all fields were correctly deserialized
      expect(eventVolunteer.id, eventVolunteerFromJson.id);
      expect(eventVolunteer.creator?.id, eventVolunteerFromJson.creator?.id);
      expect(eventVolunteer.event?.id, eventVolunteerFromJson.event?.id);
      expect(eventVolunteer.group?.id, eventVolunteerFromJson.group?.id);
      expect(eventVolunteer.isAssigned, eventVolunteerFromJson.isAssigned);
      expect(eventVolunteer.isInvited, eventVolunteerFromJson.isInvited);
      expect(eventVolunteer.response, eventVolunteerFromJson.response);
      expect(eventVolunteer.user?.id, eventVolunteerFromJson.user?.id);
    });
  });
}
