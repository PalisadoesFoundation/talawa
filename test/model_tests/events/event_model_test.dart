
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

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
  name: 'for test only',
  description: 'for test only',
  startAt: '2024-01-01T10:00:00.000Z',
  endAt: '2024-01-01T20:00:00.000Z',
  organization: OrgInfo(id: 'org123', name: 'Test Org'),
  attachments: [],
);

final eventJson = {
  'creator': {
    'id': '123',
    'name': 'Ayush Chaudhary',
  },
  'id': '12',
  'name': 'for test only',
  'description': 'for test only',
  'startAt': '2024-01-01T10:00:00.000Z',
  'endAt': '2024-01-01T20:00:00.000Z',
  'organization': {
    'id': 'org123',
    'name': 'Test Org',
  },
  'attachments': [],
};

final eventFromJson = Event(
  creator: User(
    id: '123',
    firstName: 'Ayush Chaudhary',
    lastName: null,
    email: null,
  ),
  id: '12',
  name: 'for test only',
  description: 'for test only',
  startAt: '2024-01-01T10:00:00.000Z',
  endAt: '2024-01-01T20:00:00.000Z',
  organization: OrgInfo(id: 'org123', name: 'Test Org'),
  attachments: [],
);

void main() {
  group('Test Event Model', () {
    test('Test Event fromJson with complete data', () {
      final parsedEvent = Event.fromJson(eventJson);

      expect(eventFromJson.creator?.id, parsedEvent.creator?.id);
      expect(eventFromJson.creator?.firstName, parsedEvent.creator?.firstName);
      expect(eventFromJson.creator?.lastName, parsedEvent.creator?.lastName);
      expect(eventFromJson.creator?.email, parsedEvent.creator?.email);
      expect(eventFromJson.name, parsedEvent.name);
      expect(eventFromJson.id, parsedEvent.id);
      expect(eventFromJson.description, parsedEvent.description);
      expect(eventFromJson.startAt, parsedEvent.startAt);
      expect(eventFromJson.endAt, parsedEvent.endAt);
      expect(eventFromJson.organization?.id, parsedEvent.organization?.id);
      expect(eventFromJson.organization?.name, parsedEvent.organization?.name);
    });

    test('Test Event fromJson with _id field', () {
      final jsonWithIdField = {
        '_id': 'event123',
        'title': 'Test Event with _id',
        'description': 'Testing _id field',
        'startAt': '2024-01-01T10:00:00.000Z',
        'endAt': '2024-01-01T20:00:00.000Z',
      };

      final event = Event.fromJson(jsonWithIdField);

      expect(event.id, 'event123');
      expect(event.name, 'Test Event with _id');
      expect(event.description, 'Testing _id field');
    });

    test('Test Event fromJson with null values', () {
      final jsonWithNulls = <String, dynamic>{
        'id': null,
        'name': null,
        'description': null,
        'startAt': null,
        'endAt': null,
        'organization': null,
        'creator': null,
        'attachments': null,
      };

      final event = Event.fromJson(jsonWithNulls);

      expect(event.id, isNull);
      expect(event.name, isNull);
      expect(event.description, isNull);
      expect(event.startAt, isNull);
      expect(event.endAt, isNull);
      expect(event.organization, isNull);
      expect(event.creator, isNull);
      expect(event.attachments, isNull);
    });

    test('Test Event fromJson with empty JSON', () {
      final emptyJson = <String, dynamic>{};
      final event = Event.fromJson(emptyJson);

      expect(event.id, isNull);
      expect(event.name, isNull);
      expect(event.description, isNull);
      expect(event.startAt, isNull);
      expect(event.endAt, isNull);
      expect(event.organization, isNull);
      expect(event.creator, isNull);
      expect(event.attachments, isNull);
    });

    test('Test Event getter methods with valid dates', () {
      final event = Event(
        startAt: '2024-01-15T14:30:45.000Z',
        endAt: '2024-01-16T18:45:30.000Z',
      );

      expect(event.startDate, '2024-01-15');
      expect(event.startTime, '14:30:45');
      expect(event.endDate, '2024-01-16');
      expect(event.endTime, '18:45:30');
    });

    test('Test Event getter methods with null dates', () {
      final event = Event(
        startAt: null,
        endAt: null,
      );

      expect(event.startDate, isNull);
      expect(event.startTime, isNull);
      expect(event.endDate, isNull);
      expect(event.endTime, isNull);
    });

    test('Test Event getter methods with invalid dates', () {
      final event = Event(
        startAt: 'invalid-date',
        endAt: 'another-invalid-date',
      );

      expect(event.startDate, isNull);
      expect(event.startTime, isNull);
      expect(event.endDate, isNull);
      expect(event.endTime, isNull);
    });

    test('Test Event constructor', () {
      final event = Event(
        id: 'test-id',
        name: 'Test Event',
        description: 'Test Description',
        startAt: '2024-01-01T10:00:00.000Z',
        endAt: '2024-01-01T20:00:00.000Z',
        organization: OrgInfo(id: 'org1', name: 'Test Org'),
        creator: User(id: 'user1', firstName: 'John'),
        attachments: ['file1.pdf', 'file2.jpg'],
      );

      expect(event.id, 'test-id');
      expect(event.name, 'Test Event');
      expect(event.description, 'Test Description');
      expect(event.startAt, '2024-01-01T10:00:00.000Z');
      expect(event.endAt, '2024-01-01T20:00:00.000Z');
      expect(event.organization?.id, 'org1');
      expect(event.creator?.id, 'user1');
      expect(event.attachments, ['file1.pdf', 'file2.jpg']);
    });
  });

  group('Test Attendee Model', () {
    test('Test Attendee constructor', () {
      final attendee = Attendee(
        id: 'attendee1',
        firstName: 'John',
        lastName: 'Doe',
        image: 'image.jpg',
      );

      expect(attendee.id, 'attendee1');
      expect(attendee.firstName, 'John');
      expect(attendee.lastName, 'Doe');
      expect(attendee.image, 'image.jpg');
    });

    test('Test Attendee fromJson', () {
      final json = {
        '_id': 'attendee2',
        'firstName': 'Jane',
        'lastName': 'Smith',
        'image': 'jane.jpg',
      };

      final attendee = Attendee.fromJson(json);

      expect(attendee.id, 'attendee2');
      expect(attendee.firstName, 'Jane');
      expect(attendee.lastName, 'Smith');
      expect(attendee.image, 'jane.jpg');
    });

    test('Test Attendee fromJson with null values', () {
      final json = {
        '_id': null,
        'firstName': null,
        'lastName': null,
        'image': null,
      };

      final attendee = Attendee.fromJson(json);

      expect(attendee.id, isNull);
      expect(attendee.firstName, isNull);
      expect(attendee.lastName, isNull);
      expect(attendee.image, isNull);
    });

    test('Test Attendee toJson', () {
      final attendee = Attendee(
        id: 'attendee3',
        firstName: 'Bob',
        lastName: 'Johnson',
        image: 'bob.jpg',
      );

      final json = attendee.toJson();

      expect(json['_id'], 'attendee3');
      expect(json['firstName'], 'Bob');
      expect(json['lastName'], 'Johnson');
      expect(json['image'], 'bob.jpg');
    });

    test('Test Attendee toJson with null values', () {
      final attendee = Attendee();

      final json = attendee.toJson();

      expect(json['_id'], isNull);
      expect(json['firstName'], isNull);
      expect(json['lastName'], isNull);
      expect(json['image'], isNull);
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
        expect(fetchedEvent.name, event.name);
        expect(fetchedEvent.description, event.description);
        expect(fetchedEvent.startAt, event.startAt);
        expect(fetchedEvent.endAt, event.endAt);
        expect(fetchedEvent.organization?.id, event.organization?.id);
        expect(fetchedEvent.organization?.name, event.organization?.name);
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
