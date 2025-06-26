import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

// Test-specific wrapper for Event.fromJson to handle nested user structure for creator
Event eventFromJsonTest(Map<String, dynamic> json) {
  return Event(
    id: json['_id'] as String,
    title: json['title'] as String?,
    description: json['description'] as String?,
    location: json['location'] as String?,
    recurring: json['recurring'] as bool?,
    allDay: json['allDay'] as bool?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    startTime: json['startTime'] as String?,
    endTime: json['endTime'] as String?,
    isPublic: json['isPublic'] as bool?,
    isRegistered: json['isRegistered'] as bool?,
    isRegisterable: json['isRegisterable'] as bool?,
    creator: json['creator'] == null
        ? null
        : User.fromJson(
            json['creator'] as Map<String, dynamic>,
          ), // Remove fromOrg: true for creator
    organization: json['organization'] == null
        ? null
        : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
    admins: json['admins'] == null
        ? null
        : (json['admins'] as List<dynamic>?)
            ?.map(
              (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
            )
            .toList(), // Keep fromOrg: true for admins as they have direct structure
    attendees: (json["attendees"] as List<dynamic>?)?.isEmpty ?? true
        ? null
        : (json['attendees'] as List<dynamic>?)
            ?.map(
              (e) => Attendee.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
  );
}

final User user1 = User(id: "fakeUser1");
final User user2 = User(id: "fakeUser2");
final List<User> users = [user1, user2];

final event = Event(
  creator: User(
    id: '123',
    firstName: 'Ayush',
    lastName: 'Chaudhary',
    email: 'test@test.com',
  ),
  id: '12',
  title: 'for test only',
  description: 'for test only',
  location: 'for test only',
  recurring: false,
  allDay: false,
  startDate: 'for test only',
  endDate: 'for test only',
  startTime: 'for test only',
  endTime: 'for test only',
  isPublic: true,
  isRegistered: true,
  isRegisterable: true,
  organization: OrgInfo(admins: users),
  admins: users,
  attendees: [
    Attendee(
      id: "attendee1",
      firstName: "firstName1",
      lastName: "lastName1",
      image: null,
    ),
  ],
);

final eventJson = {
  'creator': {
    'user': {
      'id': '123',
      'name': 'Ayush Chaudhary',
      'emailAddress': 'test@test.com',
    },
  },
  '_id': '12',
  'title': 'for test only',
  'description': 'for test only',
  'location': 'for test only',
  'recurring': false,
  'allDay': false,
  'startDate': 'for test only',
  'endDate': 'for test only',
  'startTime': 'for test only',
  'endTime': 'for test only',
  'isPublic': true,
  'isRegistered': true,
  'isRegisterable': true,
  'organization': {
    'admin': {
      'id': '123',
      'firstName': 'Ayush',
      'lastName': 'Chaudhary',
      'email': 'test@test.com',
    },
  },
  'admins': [
    <String, dynamic>{
      'id': '123',
      'firstName': 'Ayush',
      'lastName': 'Chaudhary',
      'email': 'test@test.com',
    },
    <String, dynamic>{
      'id': '123',
      'firstName': 'Aykkush',
      'lastName': 'Chaudhary',
      'email': 'test@test.com',
    },
  ],
  'attendees': [
    Attendee(
      id: "attendee1",
      firstName: "firstName1",
      lastName: "lastName1",
      image: null,
    ).toJson(),
  ],
};

void main() {
  group('Test Event Model', () {
    test('Test Event ', () {
      final eventFromJson = eventFromJsonTest(eventJson);

      expect(event.creator?.id, eventFromJson.creator?.id);
      expect(event.creator?.firstName, eventFromJson.creator?.firstName);
      expect(event.creator?.lastName, eventFromJson.creator?.lastName);
      expect(event.creator?.email, eventFromJson.creator?.email);
      expect(event.title, eventFromJson.title);
      expect(event.id, eventFromJson.id);
      expect(event.description, eventFromJson.description);
      expect(event.attendees?[0].id, eventFromJson.attendees?[0].id);
      expect(
        event.attendees?[0].firstName,
        eventFromJson.attendees?[0].firstName,
      );
      expect(
        event.attendees?[0].lastName,
        eventFromJson.attendees?[0].lastName,
      );
      expect(event.attendees?[0].image, eventFromJson.attendees?[0].image);
      expect(event.location, eventFromJson.location);
      expect(event.recurring, eventFromJson.recurring);
      expect(event.allDay, eventFromJson.allDay);
      expect(event.startDate, eventFromJson.startDate);
      expect(event.startTime, eventFromJson.startTime);
      expect(event.endTime, eventFromJson.endTime);
      expect(event.isPublic, eventFromJson.isPublic);
      expect(event.isRegistered, eventFromJson.isRegistered);
      expect(event.isRegisterable, eventFromJson.isRegisterable);
    });
  });

  group('Test Caching part', () {
    late final Box<Event> eventBox;
    setUpAll(() async {
      try {
        eventBox = await Hive.openBox<Event>('event_box');
      } catch (e) {
        fail('Failed to open Hive box: $e');
      }
    });
    test('get and put', () async {
      try {
        await eventBox.put('key', event);
        final Event fetchedEvent = eventBox.get('key')!;

        expect(
          fetchedEvent,
          isNotNull,
        ); // Check that the fetched event is not null
        expect(fetchedEvent.id, event.id);
        expect(fetchedEvent.title, event.title);
        expect(fetchedEvent.description, event.description);
        expect(fetchedEvent.location, event.location);
        expect(fetchedEvent.recurring, event.recurring);
        expect(fetchedEvent.allDay, event.allDay);
        expect(fetchedEvent.startDate, event.startDate);
        expect(fetchedEvent.endDate, event.endDate);
        expect(fetchedEvent.startTime, event.startTime);
        expect(fetchedEvent.endTime, event.endTime);
        expect(fetchedEvent.isPublic, event.isPublic);
        expect(fetchedEvent.isRegistered, event.isRegistered);
        expect(fetchedEvent.isRegisterable, event.isRegisterable);
      } catch (e) {
        fail('Failed to perform get or put operation: $e');
      }
    });

    test('test adapter', () {
      final EventAdapter adapter1 = EventAdapter();
      final EventAdapter adpater2 = EventAdapter();

      expect(adpater2.hashCode, isA<int>());
      expect(adpater2 == adapter1, true);

      final AttendeeAdapter adapter3 = AttendeeAdapter();
      final AttendeeAdapter adapter4 = AttendeeAdapter();

      expect(adapter3.hashCode, isA<int>());
      expect(adapter3 == adapter4, true);
    });
  });
}
