import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Event Model Tests', () {
    group('Event Constructor', () {
      test('should create Event with all properties', () {
        final startDate = DateTime(2025, 8, 15, 9, 0);
        final endDate = DateTime(2025, 8, 15, 17, 0);
        final creator = User(
          id: 'user1',
          firstName: 'John',
          lastName: 'Doe',
        );
        final organization = OrgInfo(
          id: 'org1',
          name: 'Test Organization',
        );
        final admins = [
          User(id: 'admin1', firstName: 'Admin', lastName: 'User'),
        ];
        final attendees = [
          Attendee(id: 'attendee1', firstName: 'Jane', lastName: 'Smith'),
        ];
        final agendaItems = [
          EventAgendaItem(
            id: 'agenda1',
            name: 'Opening Ceremony',
            duration: '1h',
            sequence: 1,
          ),
        ];

final event = Event(
  creator: User(
    id: '123',
    name: 'Ayush Chaudhary',
    email: 'test@test.com',
  ),
  id: '12',
  name: 'for test only',
  description: 'for test only',
  location: 'for test only',
  recurring: false,
  allDay: false,
  isPublic: true,
  isRegistered: true,
  isRegisterable: true,
  organization: OrgInfo(),
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
      final eventFromJson = TestJsonUtils.createEventFromJson(eventJson);

      expect(event.creator?.id, eventFromJson.creator?.id);
      expect(event.creator?.firstName, eventFromJson.creator?.firstName);
      expect(event.creator?.lastName, eventFromJson.creator?.lastName);
      expect(event.creator?.email, eventFromJson.creator?.email);
      expect(event.name, eventFromJson.name);
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

  group('Attendee Model Tests', () {
    group('Attendee Constructor', () {
      test('should create Attendee with all properties', () {
        final attendee = Attendee(
          id: 'attendee1',
          firstName: 'Jane',
          lastName: 'Doe',
          image: 'profile.jpg',
        );

        expect(attendee.id, equals('attendee1'));
        expect(attendee.firstName, equals('Jane'));
        expect(attendee.lastName, equals('Doe'));
        expect(attendee.image, equals('profile.jpg'));
      });

      test('should create Attendee with null properties', () {
        final attendee = Attendee();

        expect(attendee.id, isNull);
        expect(attendee.firstName, isNull);
        expect(attendee.lastName, isNull);
        expect(attendee.image, isNull);
      });
    });

    group('Attendee.fromJson', () {
      test('should create Attendee from complete JSON', () {
        final json = {
          '_id': 'attendee1',
          'firstName': 'Jane',
          'lastName': 'Doe',
          'image': 'profile.jpg',
        };

        final attendee = Attendee.fromJson(json);

        expect(attendee.id, equals('attendee1'));
        expect(attendee.firstName, equals('Jane'));
        expect(attendee.lastName, equals('Doe'));
        expect(attendee.image, equals('profile.jpg'));
      });

      test('should create Attendee from minimal JSON', () {
        final json = {
          '_id': 'attendee1',
        };

        final attendee = Attendee.fromJson(json);

        expect(attendee.id, equals('attendee1'));
        expect(attendee.firstName, isNull);
        expect(attendee.lastName, isNull);
        expect(attendee.image, isNull);
      });

      test('should handle empty JSON', () {
        final json = <String, dynamic>{};

        final attendee = Attendee.fromJson(json);

        expect(attendee.id, isNull);
        expect(attendee.firstName, isNull);
        expect(attendee.lastName, isNull);
        expect(attendee.image, isNull);
      });
    });

    group('Attendee.toJson', () {
      test('should convert Attendee to JSON correctly', () {
        final attendee = Attendee(
          id: 'attendee1',
          firstName: 'Jane',
          lastName: 'Doe',
          image: 'profile.jpg',
        );

        final json = attendee.toJson();

        expect(json['_id'], equals('attendee1'));
        expect(json['firstName'], equals('Jane'));
        expect(json['lastName'], equals('Doe'));
        expect(json['image'], equals('profile.jpg'));
      });

      test('should handle null properties in toJson', () {
        final attendee = Attendee();

        final json = attendee.toJson();

        expect(json['_id'], isNull);
        expect(json['firstName'], isNull);
        expect(json['lastName'], isNull);
        expect(json['image'], isNull);
      });

      test('should maintain JSON structure', () {
        final attendee = Attendee(
          id: 'test-id',
          firstName: 'Test',
          lastName: 'User',
          image: 'test.jpg',
        );

        final json = attendee.toJson();
        final recreatedAttendee = Attendee.fromJson(json);

        expect(recreatedAttendee.id, equals(attendee.id));
        expect(recreatedAttendee.firstName, equals(attendee.firstName));
        expect(recreatedAttendee.lastName, equals(attendee.lastName));
        expect(recreatedAttendee.image, equals(attendee.image));
      });
    });
  });

  group('Edge Cases and Integration', () {
    test('should handle complex Event with multiple attendees and agenda items',
        () {
      final json = {
        'id': 'complex-event',
        'name': 'Complex Event',
        'attendees': [
          {
            '_id': 'attendee1',
            'firstName': 'John',
            'lastName': 'Doe',
          },
          {
            '_id': 'attendee2',
            'firstName': 'Jane',
            'lastName': 'Smith',
          },
        ],
        'agendaItems': [
          {
            '_id': 'agenda1',
            'name': 'Opening',
            'sequence': 1,
          },
          {
            '_id': 'agenda2',
            'name': 'Main Session',
            'sequence': 2,
          },
          {
            '_id': 'agenda3',
            'name': 'Closing',
            'sequence': 3,
          },
        ],
      };

      final event = Event.fromJson(json);

      expect(event.attendees?.length, equals(2));
      expect(event.attendees?.first.firstName, equals('John'));
      expect(event.attendees?.last.firstName, equals('Jane'));
      expect(event.agendaItems?.length, equals(3));
      expect(event.agendaItems?.first.name, equals('Opening'));
      expect(event.agendaItems?.last.name, equals('Closing'));
    });

    test('should handle Event with cross-timezone dates', () {
      final event = Event(
        startAt: DateTime.utc(2025, 8, 15, 14, 30), // 2:30 PM UTC
        endAt: DateTime.utc(2025, 8, 15, 18, 45), // 6:45 PM UTC
      );

      // Note: The formatting will depend on the system timezone
      expect(event.startDate, isNotNull);
      expect(event.endDate, isNotNull);
      expect(event.startTime, isNotEmpty);
      expect(event.endTime, isNotEmpty);
    });

    test('should handle Event spanning multiple days', () {
      final event = Event(
        startAt: DateTime(2025, 8, 15, 23, 30),
        endAt: DateTime(2025, 8, 16, 1, 30),
      );

      expect(event.startDate, equals('2025-08-15'));
      expect(event.endDate, equals('2025-08-16'));
    });
  });
}
