// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/task_service.dart';
import 'package:talawa/utils/task_queries.dart';

import '../helpers/test_helpers.dart';

void main() {
  setUp(() {
    registerServices();
  });
  group('Test TaskService', () {
    test('Test getTasksForEvent method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.eventTasks('eventId');
      when(dataBaseMutationFunctions.gqlNonAuthQuery(query)).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'tasksByEvent': [
              {
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
              }
            ]
          },
          source: QueryResultSource.network,
        ),
      );

      final service = TaskService();
      await service.getTasksForEvent('eventId');

      expect(service.tasks.length, 1);
    });
    test('Test getTasksByUser method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.userTasks('xzy1');
      when(dataBaseMutationFunctions.gqlNonAuthQuery(query)).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'tasksByUser': [
              {
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
              }
            ]
          },
          source: QueryResultSource.network,
        ),
      );

      final service = TaskService();
      await service.getTasksByUser();

      expect(service.tasks.length, 1);
    });
    test('Test createTask method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.addTask(
        title: 'Test task',
        description: 'Test description',
        deadline: '123456',
        eventId: 'eventId',
      );
      when(dataBaseMutationFunctions.gqlAuthMutation(query)).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'createTask': {
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
            }
          },
          source: QueryResultSource.network,
        ),
      );

      final service = TaskService();
      int index = 0;
      service.callbackNotifyListeners = () => index++;
      await service.createTask(
        title: 'Test task',
        description: 'Test description',
        deadline: '123456',
        eventId: 'eventId',
      );

      expect(service.tasks.length, 1);
      expect(index, 1);
    });
    test('Test deleteTask method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.deleteTask('taskId');
      when(dataBaseMutationFunctions.gqlAuthMutation(query)).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          source: QueryResultSource.network,
        ),
      );

      final service = TaskService();
      service.tasks.add(
        Task(
          id: 'taskId',
          title: 'Test task',
          description: 'Test description',
          deadline: '123456',
          createdAt: '123456',
          event: Event(),
          creator: User(),
        ),
      );
      await service.deleteTask('taskId', 'xzy1');

      expect(service.tasks.length, 0);
    });
    test('Test deleteTask method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.deleteTask('taskId');
      when(dataBaseMutationFunctions.gqlAuthMutation(query)).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          source: QueryResultSource.network,
        ),
      );

      final service = TaskService();
      service.tasks.add(
        Task(
          id: 'taskId',
          title: 'Test task',
          description: 'Test description',
          deadline: '123456',
          createdAt: '123456',
          event: Event(),
          creator: User(),
        ),
      );
      await service.deleteTask('taskId', 'xzy1');

      expect(service.tasks.length, 0);
    });
    test('Test deleteTask method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.editTask(
        title: 'new',
        description: 'Test description',
        deadline: '123456',
        taskId: 'taskId',
      );
      when(dataBaseMutationFunctions.gqlAuthMutation(query)).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'updateTask': {
              '_id': 'taskId',
              'title': 'new',
              'creator': {
                '_id': '123',
              },
              'createdAt': '123456',
              'description': 'Test description',
              'deadline': '123456',
              'event': {
                '_id': '123',
              },
            }
          },
          source: QueryResultSource.network,
        ),
      );

      final service = TaskService();
      service.callbackNotifyListeners = () {};
      service.tasks.add(
        Task(
          id: 'taskId',
          title: 'Test task',
          creator: User(id: '123'),
          createdAt: '123456',
          description: 'Test description',
          deadline: '123456',
          event: Event(id: '123'),
        ),
      );
      await service.editTask(
        title: 'new',
        description: 'Test description',
        deadline: '123456',
        taskId: 'taskId',
      );

      expect(service.tasks[0].title, 'new');
    });
  });
}
