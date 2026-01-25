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
          name: 'John Doe',
        );
        final organization = OrgInfo(
          id: 'org1',
          name: 'Test Organization',
        );
        final admins = [
          User(id: 'admin1', name: 'Admin User'),
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
          id: 'event1',
          name: 'Test Event',
          description: 'A test event',
          location: 'Test Location',
          recurring: true,
          allDay: false,
          startAt: startDate,
          endAt: endDate,
          isPublic: true,
          isRegistered: true,
          isRegisterable: true,
          creator: creator,
          organization: organization,
          admins: admins,
          attendees: attendees,
          agendaItems: agendaItems,
        );

        expect(event.id, equals('event1'));
        expect(event.name, equals('Test Event'));
        expect(event.description, equals('A test event'));
        expect(event.location, equals('Test Location'));
        expect(event.recurring, isTrue);
        expect(event.allDay, isFalse);
        expect(event.startAt, equals(startDate));
        expect(event.endAt, equals(endDate));
        expect(event.isPublic, isTrue);
        expect(event.isRegistered, isTrue);
        expect(event.isRegisterable, isTrue);
        expect(event.creator, equals(creator));
        expect(event.organization, equals(organization));
        expect(event.admins, equals(admins));
        expect(event.attendees, equals(attendees));
        expect(event.agendaItems, equals(agendaItems));
      });

      test('should create Event with null properties', () {
        final event = Event();

        expect(event.id, isNull);
        expect(event.name, isNull);
        expect(event.description, isNull);
        expect(event.location, isNull);
        expect(event.recurring, isNull);
        expect(event.allDay, isNull);
        expect(event.startAt, isNull);
        expect(event.endAt, isNull);
        expect(event.isPublic, isNull);
        expect(event.isRegistered, isNull);
        expect(event.isRegisterable, isNull);
        expect(event.creator, isNull);
        expect(event.organization, isNull);
        expect(event.admins, isNull);
        expect(event.attendees, isNull);
        expect(event.agendaItems, isNull);
      });
    });

    group('Event.fromJson', () {
      test('should create Event from complete JSON', () {
        final json = {
          'id': 'event1',
          'name': 'Test Event',
          'description': 'A test event',
          'location': 'Test Location',
          'recurring': true,
          'allDay': false,
          'startAt': '2025-08-15T09:00:00.000Z',
          'endAt': '2025-08-15T17:00:00.000Z',
          'isPublic': true,
          'isRegistered': true,
          'isRegisterable': true,
          'creator': {
            'id': 'user1',
            'name': 'John Doe',
          },
          'organization': {
            'id': 'org1',
            'name': 'Test Organization',
          },
          'attendees': [
            {
              '_id': 'attendee1',
              'firstName': 'Jane',
              'lastName': 'Smith',
              'image': 'profile.jpg',
            },
          ],
          'agendaItems': [
            {
              'id': 'agenda1',
              'name': 'Opening Ceremony',
              'duration': '1h',
              'sequence': 1,
            },
          ],
        };

        final event = Event.fromJson(json);

        expect(event.id, equals('event1'));
        expect(event.name, equals('Test Event'));
        expect(event.description, equals('A test event'));
        expect(event.location, equals('Test Location'));
        expect(event.recurring, isTrue);
        expect(event.allDay, isFalse);
        expect(
          event.startAt,
          equals(DateTime.parse('2025-08-15T09:00:00.000Z').toLocal()),
        );
        expect(
          event.endAt,
          equals(DateTime.parse('2025-08-15T17:00:00.000Z').toLocal()),
        );
        expect(event.isPublic, isTrue);
        expect(event.isRegistered, isTrue);
        expect(event.isRegisterable, isTrue);
        expect(event.creator?.id, equals('user1'));
        expect(event.creator?.firstName, equals('John'));
        expect(event.organization?.id, equals('org1'));
        expect(event.attendees?.length, equals(1));
        expect(event.attendees?.first.id, equals('attendee1'));
        expect(event.agendaItems?.length, equals(1));
        expect(event.agendaItems?.first.id, equals('agenda1'));
      });

      test('should create Event from minimal JSON', () {
        final json = <String, dynamic>{
          'id': 'event1',
          'name': 'Minimal Event',
        };

        final event = Event.fromJson(json);

        expect(event.id, equals('event1'));
        expect(event.name, equals('Minimal Event'));
        expect(event.description, isNull);
        expect(event.location, isNull);
        expect(event.recurring, isNull);
        expect(event.allDay, isNull);
        expect(event.startAt, isNull);
        expect(event.endAt, isNull);
        expect(event.isPublic, isNull);
        expect(event.isRegistered, isNull);
        expect(event.isRegisterable, isNull);
        expect(event.creator, isNull);
        expect(event.organization, isNull);
        expect(event.attendees, isNull);
        expect(event.agendaItems, isNull);
      });

      test('should handle invalid date strings in JSON', () {
        final json = {
          'id': 'event1',
          'name': 'Test Event',
          'startAt': 'invalid-date',
          'endAt': 'another-invalid-date',
        };

        final event = Event.fromJson(json);

        expect(event.id, equals('event1'));
        expect(event.name, equals('Test Event'));
        expect(event.startAt, isNull);
        expect(event.endAt, isNull);
      });

      test('should handle empty attendees list', () {
        final json = {
          'id': 'event1',
          'name': 'Test Event',
          'attendees': <dynamic>[],
        };

        final event = Event.fromJson(json);

        expect(event.id, equals('event1'));
        expect(event.attendees, isNull);
      });

      test('should handle null agendaItems', () {
        final json = {
          'id': 'event1',
          'name': 'Test Event',
          'agendaItems': null,
        };

        final event = Event.fromJson(json);

        expect(event.id, equals('event1'));
        expect(event.agendaItems, isNull);
      });
    });

    group('Event Computed Properties', () {
      test('should format start date correctly', () {
        final event = Event(
          startAt: DateTime(2025, 8, 15, 9, 30),
        );

        expect(event.startDate, equals('2025-08-15'));
      });

      test('should format end date correctly', () {
        final event = Event(
          endAt: DateTime(2025, 8, 16, 17, 45),
        );

        expect(event.endDate, equals('2025-08-16'));
      });

      test('should format start time correctly', () {
        final event = Event(
          startAt: DateTime(2025, 8, 15, 9, 30),
        );

        expect(event.startTime, equals('09:30 AM'));
      });

      test('should format end time correctly', () {
        final event = Event(
          endAt: DateTime(2025, 8, 15, 17, 45),
        );

        expect(event.endTime, equals('05:45 PM'));
      });

      test('should return null for start date when startAt is null', () {
        final event = Event();

        expect(event.startDate, isNull);
      });

      test('should return null for end date when endAt is null', () {
        final event = Event();

        expect(event.endDate, isNull);
      });

      test('should return empty string for start time when startAt is null',
          () {
        final event = Event();

        expect(event.startTime, equals(''));
      });

      test('should return empty string for end time when endAt is null', () {
        final event = Event();

        expect(event.endTime, equals(''));
      });

      test('should parse recurrenceRule from JSON', () {
        final json = {
          'recurrenceRule': {
            'frequency': 'weekly',
            'interval': 2,
            'count': 5,
            'never': false,
            'byDay': ['MO', 'WE'],
            'byMonth': [1, 2],
            'byMonthDay': [10, 20],
          },
        };
        final event = Event.fromJson(json);
        expect(event.recurrenceRule, isNotNull);
        expect(event.recurrenceRule?.frequency, equals('weekly'));
        expect(event.recurrenceRule?.interval, equals(2));
        expect(event.recurrenceRule?.count, equals(5));
        expect(event.recurrenceRule?.never, isFalse);
        expect(event.recurrenceRule?.byDay, equals(['MO', 'WE']));
        expect(event.recurrenceRule?.byMonth, equals([1, 2]));
        expect(event.recurrenceRule?.byMonthDay, equals([10, 20]));
      });
      test('should parse venues from JSON', () {
        final json = {
          'venues': [
            {
              '_id': 'venue1',
              'capacity': 100,
              'description': 'Main Hall',
              'imageUrl': 'image.jpg',
              'name': 'Hall A',
              'organization': {'_id': 'org1'},
            },
          ],
        };
        final event = Event.fromJson(json);
        expect(event.venues, isNotNull);
        expect(event.venues?.length, equals(1));
        expect(event.venues?.first.id, equals('venue1'));
        expect(event.venues?.first.name, equals('Hall A'));
        expect(event.venues?.first.organizationId, equals('org1'));
      });

      test('should parse baseEvent from JSON', () {
        final json = {
          'baseEvent': {
            'id': 'base1',
            'name': 'Base Event',
          },
        };
        final event = Event.fromJson(json);
        expect(event.baseEvent, isNotNull);
        expect(event.baseEvent?.id, equals('base1'));
        expect(event.baseEvent?.name, equals('Base Event'));
      });
      test('should handle midnight times correctly', () {
        final event = Event(
          startAt: DateTime(2025, 8, 15, 0, 0),
          endAt: DateTime(2025, 8, 15, 23, 59),
        );

        expect(event.startTime, equals('12:00 AM'));
        expect(event.endTime, equals('11:59 PM'));
      });

      test('should handle noon time correctly', () {
        final event = Event(
          startAt: DateTime(2025, 8, 15, 12, 0),
        );

        expect(event.startTime, equals('12:00 PM'));
      });
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
