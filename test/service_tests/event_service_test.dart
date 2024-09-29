// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

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

      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().fetchOrgEvents('XYZ'),
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: null,
          source: QueryResultSource.network,
        ),
      );

      services.getEvents();

      AppConnectivity.isOnline = false;

      services.getEvents();
    });

    test('Test dispose method', () {
      final eventService = EventService();
      eventService.dispose();
    });

    test('Test for getters', () {
      final model = EventService();
      expect(model.eventStream, isA<Stream<List<Event>>>());
    });
    test('Test createVolunteerGroup method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
      final Map<String, dynamic> variables = {
        'name': 'Volunteer Group 1',
        'eventId': 'eventId1',
      };
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().createVolunteerGroup(),
          variables: {'data': variables},
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'createVolunteerGroup': {
              '_id': 'groupId1',
              'name': 'Volunteer Group 1',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = EventService();
      final result = await service.createVolunteerGroup(variables);

      expect(result, isNotNull);
      expect(
        (result as QueryResult).data!['createVolunteerGroup']['_id'],
        'groupId1',
      );
      expect(
        result.data!['createVolunteerGroup']['name'],
        'Volunteer Group 1',
      );
    });

    test('Test removeVolunteerGroup method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
      final variables = {'groupId': 'groupId123'};
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().removeEventVolunteerGroup(),
          variables: variables,
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'removeVolunteerGroup': {
              '_id': 'groupId123',
              'name': 'Volunteer Group 1',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = EventService();
      final result = await service.removeVolunteerGroup(variables);
      expect(result, isA<QueryResult>());
      expect(result.data!['removeVolunteerGroup']['_id'], 'groupId123');
    });

    test('Test addVolunteerToGroup method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
      final variables = {
        'groupId': 'groupId123',
        'volunteerId': 'volunteerId123',
      };
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().addVolunteerToGroup(),
          variables: {'data': variables},
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'addVolunteerToGroup': {
              '_id': 'volunteerId123',
              'name': 'Volunteer Name',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = EventService();
      final result = await service.addVolunteerToGroup(variables);
      expect(result, isA<QueryResult>());
      expect(result.data!['addVolunteerToGroup']['_id'], 'volunteerId123');
    });

    test('Test removeVolunteerFromGroup method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
      final variables = {'volunteerId': 'volunteerId123'};
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().removeVolunteerMutation(),
          variables: variables,
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'removeVolunteer': {
              '_id': 'volunteerId123',
              'name': 'Volunteer Name',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = EventService();
      final result = await service.removeVolunteerFromGroup(variables);
      expect(result, isA<QueryResult>());
      expect(result.data!['removeVolunteer']['_id'], 'volunteerId123');
    });

    test('Test updateVolunteerGroup method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
      final variables = {
        'groupId': 'groupId123',
        'name': 'Updated Volunteer Group Name',
      };
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          EventQueries().updateVolunteerGroupMutation(),
          variables: variables,
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'updateVolunteerGroup': {
              '_id': 'groupId123',
              'name': 'Updated Volunteer Group Name',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = EventService();
      final result = await service.updateVolunteerGroup(variables);
      expect(result, isA<QueryResult>());
      expect(result.data!['updateVolunteerGroup']['_id'], 'groupId123');
      expect(
        result.data!['updateVolunteerGroup']['name'],
        'Updated Volunteer Group Name',
      );
    });

    test('Test fetchVolunteerGroupsByEvent method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const query = '';
      const eventId = 'eventId123';
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          EventQueries().fetchVolunteerGroups(),
          variables: {
            "where": {"eventId": eventId},
          },
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'getEventVolunteerGroups': [
              {
                '_id': 'groupId1',
                'name': 'Volunteer Group 1',
                'eventId': eventId,
              },
              {
                '_id': 'groupId2',
                'name': 'Volunteer Group 2',
                'eventId': eventId,
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );

      final service = EventService();
      final result = await service.fetchVolunteerGroupsByEvent(eventId);

      expect(result, isA<List<EventVolunteerGroup>>());
      expect(result.length, 2);
      expect(result[0].id, 'groupId1');
      expect(result[1].id, 'groupId2');
    });
  });
}
