import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/user/user_info.dart';

/// Creates EventVolunteerGroup from test JSON with proper nested user handling.
///
/// **Purpose:** Handles nested user structures in creator, leader, and volunteer fields.
///
/// **params**:
/// * `json`: The test JSON data containing nested user structures
///
/// **returns**:
/// * `EventVolunteerGroup`: Properly constructed EventVolunteerGroup with extracted user data
EventVolunteerGroup eventVolunteerGroupFromJsonTest(Map<String, dynamic> json) {
  return EventVolunteerGroup(
    id: json['_id'] as String?,
    createdAt: json['createdAt'] as String?,
    creator: json['creator'] != null
        ? User.fromJson(json['creator'] as Map<String, dynamic>)
        : null,
    event: json['event'] != null
        ? Event.fromJson(json['event'] as Map<String, dynamic>)
        : null,
    leader: json['leader'] != null
        ? User.fromJson(json['leader'] as Map<String, dynamic>)
        : null,
    name: json['name'] as String?,
    updatedAt: json['updatedAt'] as String?,
    volunteers: (json['volunteers'] as List<dynamic>?)
        ?.map((e) => EventVolunteer.fromJson(e as Map<String, dynamic>))
        .toList(),
    volunteersRequired: json['volunteersRequired'] as int?,
  );
}

void main() {
  group('Test EventVolunteerGroup Model', () {
    test('Test EventVolunteerGroup fromJson', () {
      final User creator = User(id: "fakeCreatorId");
      final User leader = User(id: "fakeLeaderId");
      final List<EventVolunteer> volunteers = [
        EventVolunteer(id: "volunteer1"),
        EventVolunteer(id: "volunteer2"),
      ];

      final event = Event(
        id: 'fakeEventId',
        title: 'Sample Event',
        description: 'Sample Description',
        location: 'Sample Location',
        startDate: '2024-08-11',
        endDate: '2024-08-12',
        startTime: '10:00 AM',
        endTime: '12:00 PM',
      );

      final eventVolunteerGroup = EventVolunteerGroup(
        id: 'group1',
        createdAt: '2024-08-01',
        creator: creator,
        event: event,
        leader: leader,
        name: 'Group Name',
        updatedAt: '2024-08-05',
        volunteers: volunteers,
        volunteersRequired: 5,
      );

      final eventVolunteerGroupJson = {
        '_id': 'group1',
        'createdAt': '2024-08-01',
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
        'leader': {
          'user': {
            'id': 'fakeLeaderId',
          },
        },
        'name': 'Group Name',
        'updatedAt': '2024-08-05',
        'volunteers': [
          {'_id': 'volunteer1'},
          {'_id': 'volunteer2'},
        ],
        'volunteersRequired': 5,
      };

      final eventVolunteerGroupFromJson =
          eventVolunteerGroupFromJsonTest(eventVolunteerGroupJson);

      expect(eventVolunteerGroup.id, eventVolunteerGroupFromJson.id);

      expect(
        eventVolunteerGroup.createdAt,
        eventVolunteerGroupFromJson.createdAt,
      );

      expect(
        eventVolunteerGroup.creator?.id,
        eventVolunteerGroupFromJson.creator?.id,
      );

      expect(
        eventVolunteerGroup.event?.id,
        eventVolunteerGroupFromJson.event?.id,
      );

      expect(
        eventVolunteerGroup.leader?.id,
        eventVolunteerGroupFromJson.leader?.id,
      );

      expect(eventVolunteerGroup.name, eventVolunteerGroupFromJson.name);

      expect(
        eventVolunteerGroup.updatedAt,
        eventVolunteerGroupFromJson.updatedAt,
      );

      expect(
        eventVolunteerGroup.volunteersRequired,
        eventVolunteerGroupFromJson.volunteersRequired,
      );

      expect(
        eventVolunteerGroup.volunteers?.length,
        eventVolunteerGroupFromJson.volunteers?.length,
      );

      expect(
        eventVolunteerGroup.volunteers?[0].id,
        eventVolunteerGroupFromJson.volunteers?[0].id,
      );
    });
  });
}
