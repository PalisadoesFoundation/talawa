// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Test Event Model', () {
    test('Test Event ', () {
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
        attendees: 'for test only',
        location: 'for test only',
        latitude: 1233,
        longitude: 123,
        recurring: false,
        allDay: false,
        startDate: 'for test only',
        endDate: 'for test only',
        startTime: 'for test only',
        endTime: 'for test only',
        recurrence: 'for test only',
        isPublic: true,
        isRegistered: true,
        isRegisterable: true,
        organization: OrgInfo(admins: users),
        admins: users,
        registrants: users,
      );

      final eventJson = {
        'creator': {
          '_id': '123',
          'firstName': 'Ayush',
          'lastName': 'Chaudhary',
          'email': 'test@test.com',
        },
        '_id': '12',
        'title': 'for test only',
        'description': 'for test only',
        'attendees': 'for test only',
        'location': 'for test only',
        'latitude': 1233.00,
        'longitude': 123.00,
        'recurring': false,
        'allDay': false,
        'startDate': 'for test only',
        'endDate': 'for test only',
        'startTime': 'for test only',
        'endTime': 'for test only',
        'recurrence': 'for test only',
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
        'registrants': [
          <String, dynamic>{
            'user': {
              'id': '123',
              'firstName': 'Ayush',
              'lastName': 'Chaudhary',
              'email': 'test@test.com',
            }
          },
          <String, dynamic>{
            'user': {
              'id': '123',
              'firstName': 'Aykkush',
              'lastName': 'Chaudhary',
              'email': 'test@test.com',
            }
          },
        ],
      };
      final eventFromJson = Event.fromJson(eventJson);

      expect(event.creator?.id, eventFromJson.creator?.id);
      expect(event.creator?.firstName, eventFromJson.creator?.firstName);
      expect(event.creator?.lastName, eventFromJson.creator?.lastName);
      expect(event.creator?.email, eventFromJson.creator?.email);
      expect(event.title, eventFromJson.title);
      expect(event.id, eventFromJson.id);
      expect(event.description, eventFromJson.description);
      expect(event.attendees, eventFromJson.attendees);
      expect(event.location, eventFromJson.location);
      expect(event.latitude, eventFromJson.latitude);
      expect(event.longitude, eventFromJson.longitude);
      expect(event.recurring, eventFromJson.recurring);
      expect(event.allDay, eventFromJson.allDay);
      expect(event.startDate, eventFromJson.startDate);
      expect(event.startTime, eventFromJson.startTime);
      expect(event.endTime, eventFromJson.endTime);
      expect(event.recurrence, eventFromJson.recurrence);
      expect(event.isPublic, eventFromJson.isPublic);
      expect(event.isRegistered, eventFromJson.isRegistered);
      expect(event.isRegisterable, eventFromJson.isRegisterable);
    });
  });
}
