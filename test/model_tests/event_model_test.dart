import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Event Model Test', () {
    test('Test Event Model', () {
      // Event object
      final event = Event(
        id: '123',
        title: 'Test Event',
        description: 'This is a test event',
        attendees: '50',
        location: 'Test location',
        latitude: 40.730610,
        longitude: -73.935242,
        recurring: false,
        allDay: false,
        startDate: '2022-01-01',
        endDate: '2022-01-02',
        startTime: '10:00',
        endTime: '12:00',
        recurrence: 'none',
        isPublic: true,
        isRegistered: false,
        isRegisterable: true,
        creator: User(
          id: '456',
        ),
        organization: OrgInfo(
          id: '789',
        ),
        admins: [
          User(
            id: '789',
          ),
        ],
        registrants: [
          User(
            id: '999',
          ),
        ],
      );
      // JSON returned by api
      final eventJson = {
        '_id': '123',
        'title': 'Test Event',
        'description': 'This is a test event',
        'attendees': '50',
        'location': 'Test location',
        'latitude': 40.730610,
        'longitude': -73.935242,
        'recurring': false,
        'allDay': false,
        'startDate': '2022-01-01',
        'endDate': '2022-01-02',
        'startTime': '10:00',
        'endTime': '12:00',
        'recurrence': 'none',
        'isPublic': true,
        'isRegistered': false,
        'isRegisterable': true,
        'creator': {
          '_id': '456',
          'firstName': 'John',
          'lastName': 'Doe',
          'email': 'johndoe@example.com',
        },
        'organization': {
          '_id': '789',
          'name': 'Test Organization',
          'description': 'This is a test organization',
        },
        'admins': [
          {
            '_id': '789',
            'firstName': 'Jane',
            'lastName': 'Doe',
            'email': 'janedoe@example.com',
          },
        ],
        'registrants': [
          {
            '_id': '999',
            'firstName': 'Bob',
            'lastName': 'Smith',
            'email': 'bobsmith@example.com',
          },
        ],
      };

      final eventFromJson = Event.fromJson(eventJson);
      expect(event.id, eventFromJson.id);
      expect(event.title, eventFromJson.title);
      expect(event.title, eventFromJson.title);
      expect(event.description, eventFromJson.description);
      expect(event.attendees, eventFromJson.attendees);
      expect(event.location, eventFromJson.location);
      expect(event.latitude, eventFromJson.latitude);
      expect(event.latitude, eventFromJson.longitude);
      expect(event.recurring, eventFromJson.recurring);
      expect(event.allDay, eventFromJson.allDay);
      expect(event.startDate, eventFromJson.startDate);
      expect(event.endDate, eventFromJson.endDate);
      expect(event.startTime, eventFromJson.startTime);
      expect(event.endTime, eventFromJson.endTime);
      expect(event.recurrence, eventFromJson.recurrence);
      expect(event.isPublic, eventFromJson.isPublic);
      expect(event.isRegistered, eventFromJson.isRegistered);
      expect(event.isRegisterable, eventFromJson.isRegisterable);
      expect(event.latitude, eventFromJson.latitude);
      expect(event.creator?.id, eventFromJson.creator?.id);
      expect(event.organization?.id, eventFromJson.organization?.id);
      expect(event.admins?[0].id, eventFromJson.admins?[0].id);
      expect(event.registrants?[0].id, eventFromJson.registrants?[0].id);
    });
  });
}
