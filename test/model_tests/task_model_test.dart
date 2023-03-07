// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Test Task model', () {
    test('Test task json', () {
      final task = Task(
        id: '123',
        title: 'Test task',
        creator: User(
          id: '123',
          firstName: 'John',
          lastName: 'Doe',
          email: 'test@test.com',
        ),
        createdAt: '123456',
        event: Event(
          id: '123',
        ),
      );
      final taskJson = {
        '_id': '123',
        'title': 'Test task',
        'creator': {
          '_id': '123',
          'firstName': 'John',
          'lastName': 'Doe',
          'email': 'test@test.com',
        },
        'createdAt': '123456',
        'event': {
          '_id': '123',
        },
      };
      final taskFromJson = Task.fromJson(taskJson);
      expect(task.id, taskFromJson.id);
      expect(task.title, taskFromJson.title);
      expect(task.creator.id, taskFromJson.creator.id);
      expect(task.creator.firstName, taskFromJson.creator.firstName);
      expect(task.creator.lastName, taskFromJson.creator.lastName);
      expect(task.creator.email, taskFromJson.creator.email);
      expect(task.createdAt, taskFromJson.createdAt);
      expect(task.event.id, taskFromJson.event.id);
    });
  });
}
