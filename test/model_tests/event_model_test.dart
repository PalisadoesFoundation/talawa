import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Event Model Test', () {
    test('can be constructed from JSON', () {
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
    });
  });
}

