// ignore_for_file: talawa_api_doc

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
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
              'description': 'Test description',
            },
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
              'description': 'Test description',
            },
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
            },
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
        dataBaseMutationFunctions.gqlAuthQuery(
          EventQueries().registrantsByEvent('eventId'),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'registrant': {'_id': 'registrantId', 'name': 'name'},
          },
          source: QueryResultSource.network,
        ),
      );
      final services = EventService();
      services.fetchRegistrantsByEvent('eventId');
    });

    test('Test getEvents method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = TaskQueries.eventTasks('eventId');
      userConfig.currentOrg = OrgInfo(name: 'org', id: 'id');
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().fetchOrgEvents('XYZ'),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'eventsByOrganization': [
              {
                "_id": "1234567890",
                "title": "Sample Event",
                "description": "This is a sample event description.",
                "attendees": "John Doe, Jane Smith",
                "location": "Sample Location",
                "longitude": -73.935242,
                "latitude": 40.73061,
                "recurring": true,
                "allDay": false,
                "startDate": "2024-01-15",
                "endDate": "2024-01-16",
                "startTime": "10:00 AM",
                "endTime": "4:00 PM",
                "recurrence": "Weekly",
                "isPublic": true,
                "isRegistered": true,
                "isRegisterable": true,
                "creator": {
                  "id": "user123",
                  "name": "Creator Name",
                  "email": "creator@example.com",
                },
                "organization": {
                  "id": "org123",
                  "name": "Organization Name",
                  "description": "Sample organization description.",
                },
              }
            ],
          },
          source: QueryResultSource.network,
        ),
      );
      final services = EventService();
      services.getEvents();
    });

    test('Test dispose method', () {
      final eventService = EventService();
      eventService.dispose();
    });

    test('Test for getters', () {
      final model = EventService();
      expect(model.eventStream, isA<Stream<Event>>());
    });
  });
}
