import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';
import '../model_tests/user/user_info_test.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });
  group('Test EventService', () {
    test('Test editEvent method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
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
    });

    test('Test deleteEvent method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
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

    test('Test createEvent method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
      final createEventViewModel = CreateEventViewModel();
      createEventViewModel
        ..eventTitleTextController.text = 'title'
        ..eventDescriptionTextController.text = 'description'
        ..eventLocationTextController.text = 'location'
        ..isPublicSwitch = true
        ..isRegisterableSwitch = true
        ..isRecurring = true
        ..isAllDay = true
        ..eventStartDate = DateTime.now()
        ..eventEndDate = DateTime.now()
        ..eventStartTime = TimeOfDay.now()
        ..eventEndTime = TimeOfDay.now();

      final Map<String, dynamic> variables = {
        "data": {
          'title': createEventViewModel.eventTitleTextController.text,
          'description':
              createEventViewModel.eventDescriptionTextController.text,
          'location': createEventViewModel.eventLocationTextController.text,
          'isPublic': createEventViewModel.isPublicSwitch,
          'isRegisterable': createEventViewModel.isRegisterableSwitch,
          'recurring': createEventViewModel.isRecurring,
          'allDay': createEventViewModel.isAllDay,
        },
      };

      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().addEvent(),
          variables: variables,
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'cretedEvent': {
              '_id': 'eventId',
              'title': 'Test task',
              'description': 'Test description',
            },
          },
          source: QueryResultSource.network,
        ),
      );
      final services = EventService();
      await services.createEvent(variables: variables);
    });

    test('Test registerForAnEvent method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
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
            },
          },
          source: QueryResultSource.network,
        ),
      );
      final services = EventService();
      await services.registerForAnEvent('eventId');
    });

    test('Test fetchAttendeesByEvent method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          EventQueries().attendeesByEvent('eventId'),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'getEventAttendeesByEventId': {'userId': 'userId'},
          },
          source: QueryResultSource.network,
        ),
      );
      final services = EventService();
      services.fetchAttendeesByEvent('eventId');
    });

    test('Test getEvents method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
      userConfig.currentOrg = OrgInfo(name: 'org', id: 'id');
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().fetchOrgEvents('XYZ'),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'eventsByOrganizationConnection': [
              {
                "_id": "1234567890",
                "title": "Sample Event",
                "description": "This is a sample event description.",
                "location": "Sample Location",
                "recurring": true,
                "allDay": false,
                "startDate": "2024-01-15",
                "endDate": "2024-01-16",
                "startTime": "10:00 AM",
                "endTime": "4:00 PM",
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
                "attendees": [
                  testDataNotFromOrg,
                ],
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
