import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
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
          'id': '123',
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
        'organization': {'admin': {}},
        'admins': [
          {
            'id': '123',
            'firstName': 'Ayush',
            'lastName': 'Chaudhary',
            'email': 'test@test.com',
          },
          {
            'id': '123',
            'firstName': 'Aykkush',
            'lastName': 'Chaudhary',
            'email': 'test@test.com',
          },
        ],
        'registrants': [
          {
            {'id': "fakeUser1"},
            {'id': "fakeUser2"}
          }
        ]
      };
      final eventFromJson = Event.fromJson(eventJson);

      // final commentFromJson = Comment.fromJson(commentJson);
      // expect(comment.creator?.id, commentFromJson.creator?.id);
      // expect(comment.creator?.firstName, commentFromJson.creator?.firstName);
      // expect(comment.creator?.lastName, commentFromJson.creator?.lastName);
      // expect(comment.creator?.email, commentFromJson.creator?.email);
      // expect(comment.createdAt, commentFromJson.createdAt);
      // expect(comment.text, commentFromJson.text);
      // expect(comment.post, commentFromJson.post);
      // expect(comment.likeCount, commentFromJson.likeCount);
    });
  });
}
