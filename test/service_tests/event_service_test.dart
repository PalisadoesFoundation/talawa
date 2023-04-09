// ignore_for_file: talawa_api_doc

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/utils/task_queries.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  testSetupLocator();

  setUp(() {
    registerServices();
  });
  group('Test EventService', () {
    test('Test editEvent method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.eventTasks('eventId');
      final Map<String, dynamic> variables = <String, dynamic>{};
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().updateEvent(eventId: 'eventId'),
          variables: variables,
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'updateEvent': {
              '_id': 'eventId',
              'title': 'Test task',
              'description': 'Test description'
            }
          },
          source: QueryResultSource.network,
        ),
      );

      final service = EventService();
      await service.editEvent(
        eventId: 'eventId',
        variables: variables,
      );

      verify(
        navigationService.pop(),
      );
    });

    test('Test deleteEvent method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.eventTasks('eventId');
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().deleteEvent('eventId'),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'deleteEvent': {
              '_id': 'eventId',
              'title': 'Test task',
              'description': 'Test description'
            }
          },
          source: QueryResultSource.network,
        ),
      );
      final services = EventService();
      await services.deleteEvent('eventId');
    });

    test('Test registerForAnEvent method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.eventTasks('eventId');
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().registerForEvent(),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'register for an event': {
              '_id': 'eventId',
              'name': 'name',
            }
          },
          source: QueryResultSource.network,
        ),
      );
      final services = EventService();
      await services.registerForAnEvent('eventId');
    });

    test('Test fetchRegistrantsByEvent method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.eventTasks('eventId');
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().registrantsByEvent('eventId'),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'registrant': {'_id': 'registrantId', 'name': 'name'}
          },
          source: QueryResultSource.network,
        ),
      );
      final services = EventQueries();
      services.registrantsByEvent('eventId');
    });

    test('Test getEvents method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.eventTasks('eventId');
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().fetchOrgEvents('OrgId'),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'Events': {
              '_id': 'eventId',
              'title': 'Test task',
              'description': 'Test description'
            }
          },
          source: QueryResultSource.network,
        ),
      );
      final services = EventQueries();
      services.fetchOrgEvents('OrgId');
    });
  });
}
