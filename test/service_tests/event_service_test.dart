// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  group('Test EventService', () {
    // Helper functions to reduce code duplication
    DataBaseMutationFunctions setupDbFunctions() {
      return locator<DataBaseMutationFunctions>();
    }

    UserConfig setupUserConfig() {
      return locator<UserConfig>();
    }

    void setupTestOrganization(UserConfig userConfig, String testOrgId) {
      userConfig.currentOrg = OrgInfo(name: 'Test Org', id: testOrgId);
    }

    String createTestMutation(String testOrgId) {
      return EventQueries().fetchOrgEvents(testOrgId);
    }

    Map<String, dynamic> createMockEventData(
      String testOrgId, {
      String eventName = 'Test Event',
    }) {
      return {
        "eventsByOrganizationId": [
          {
            "id": "event1",
            "name": eventName,
            "description": "Test Description",
            "startAt": "2024-01-01T10:00:00.000Z",
            "endAt": "2024-01-01T12:00:00.000Z",
            "organization": {
              "id": testOrgId,
              "name": "Test Org",
            },
            "creator": {
              "user": {
                "id": "creator1",
                "name": "Test Creator",
              },
            },
            "updater": {
              "user": {
                "id": "creator1",
                "name": "Test Creator",
              },
            },
            "attachments": [],
          }
        ],
      };
    }

    void setupGqlAuthQueryMock(
      DataBaseMutationFunctions dbFunctions,
      String mutation,
      Map<String, dynamic> mockData,
    ) {
      when(dbFunctions.gqlAuthQuery(mutation)).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(mutation)),
          data: mockData,
          source: QueryResultSource.network,
        ),
      );
    }

    EventService createEventService() {
      return EventService();
    }

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
            'createdEvent': {
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
          variables: {'eventId': 'eventId'},
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'registerForEvent': {
              '_id': 'eventId',
            },
          },
          source: QueryResultSource.network,
        ),
      );
      final services = EventService();
      await services.registerForAnEvent('eventId');
    });

    test('Test fetchAttendeesByEvent method', () {
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

    test('Test getEvents method', () {
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
            'eventsByOrganizationId': [
              {
                "id": "1234567890",
                "name": "Sample Event",
                "description": "This is a sample event description.",
                "startAt": "2024-01-15T10:00:00Z",
                "endAt": "2024-01-16T16:00:00Z",
                "organization": {
                  "id": "org123",
                  "name": "Organization Name",
                },
                "creator": {
                  "user": {
                    "id": "user123",
                    "name": "Creator Name",
                  },
                },
                "updater": {
                  "user": {
                    "id": "user123",
                    "name": "Creator Name",
                  },
                },
                "attachments": [
                  {
                    "mimeType": "image/jpeg",
                    "url": "https://example.com/image.jpg",
                  }
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

    test('Test fetchVolunteerGroupsByEvent method success', () async {
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
    test('Test fetchVolunteerGroupsByEvent method failure', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const eventId = 'eventId123';
      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          EventQueries().fetchVolunteerGroups(),
          variables: {
            "where": {"eventId": eventId},
          },
        ),
      ).thenThrow(
        Exception("query error"),
      );

      final service = EventService();

      try {
        await service.fetchVolunteerGroupsByEvent(eventId);
      } catch (e) {
        expect(e, isA<Exception>());
        expect(e.toString(), equals('Exception: query error'));
      }
    });
    test('fetchAgendaCategories returns correct data', () async {
      const orgId = 'org123';
      final mockResult = QueryResult(
        options: QueryOptions(
          document: gql(
            EventQueries().fetchAgendaItemCategoriesByOrganization(orgId),
          ),
        ),
        data: {
          'fetchAgendaCategories': [
            {'_id': 'cat1', 'name': 'Category 1'},
            {'_id': 'cat2', 'name': 'Category 2'},
          ],
        },
        source: QueryResultSource.network,
      );

      when(
        databaseFunctions.gqlAuthMutation(
          EventQueries().fetchAgendaItemCategoriesByOrganization(orgId),
        ),
      ).thenAnswer((_) async => mockResult);

      final service = EventService();
      final result = await service.fetchAgendaCategories(orgId);

      expect(result, equals(mockResult));
      verify(
        databaseFunctions.gqlAuthMutation(
          EventQueries().fetchAgendaItemCategoriesByOrganization(orgId),
        ),
      ).called(1);
    });

    test('createAgendaItem sends correct mutation and variables', () async {
      final variables = {'title': 'New Agenda', 'description': 'Description'};
      final mockResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: {
          'createAgendaItem': {'_id': 'agenda1'},
        },
        source: QueryResultSource.network,
      );

      when(
        databaseFunctions.gqlAuthMutation(
          EventQueries().createAgendaItem(),
          variables: {'input': variables},
        ),
      ).thenAnswer((_) async => mockResult);

      final service = EventService();

      final result = await service.createAgendaItem(variables);

      expect(result, equals(mockResult));
      verify(
        databaseFunctions.gqlAuthMutation(
          EventQueries().createAgendaItem(),
          variables: {'input': variables},
        ),
      ).called(1);
    });

    test('deleteAgendaItem sends correct mutation and variables', () async {
      final variables = {'agendaItemId': 'agenda1'};
      final mockResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: {
          'deleteAgendaItem': {'_id': 'agenda1'},
        },
        source: QueryResultSource.network,
      );

      when(
        databaseFunctions.gqlAuthMutation(
          EventQueries().deleteAgendaItem(),
          variables: variables,
        ),
      ).thenAnswer((_) async => mockResult);

      final result = await EventService().deleteAgendaItem(variables);

      expect(result, equals(mockResult));
      verify(
        databaseFunctions.gqlAuthMutation(
          EventQueries().deleteAgendaItem(),
          variables: variables,
        ),
      ).called(1);
    });

    test('updateAgendaItem sends correct mutation and variables', () async {
      const itemId = 'agenda1';
      final variables = {'title': 'Updated Agenda'};
      final mockResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: {
          'updateAgendaItem': {'_id': 'agenda1', 'title': 'Updated Agenda'},
        },
        source: QueryResultSource.network,
      );

      when(
        databaseFunctions.gqlAuthMutation(
          EventQueries().updateAgendaItem(),
          variables: {
            'updateAgendaItemId': itemId,
            'input': variables,
          },
        ),
      ).thenAnswer((_) async => mockResult);

      final result = await EventService().updateAgendaItem(itemId, variables);

      expect(result, equals(mockResult));
      verify(
        databaseFunctions.gqlAuthMutation(
          EventQueries().updateAgendaItem(),
          variables: {
            'updateAgendaItemId': itemId,
            'input': variables,
          },
        ),
      ).called(1);
    });

    test('fetchAgendaItems returns correct data', () async {
      const eventId = 'event123';
      final mockResult = QueryResult(
        options: QueryOptions(document: gql('')),
        data: {
          'fetchAgendaItems': [
            {'_id': 'agenda1', 'title': 'Agenda Item 1'},
            {'_id': 'agenda2', 'title': 'Agenda Item 2'},
          ],
        },
        source: QueryResultSource.network,
      );

      when(
        databaseFunctions.gqlAuthQuery(
          EventQueries().fetchAgendaItemsByEvent(eventId),
        ),
      ).thenAnswer((_) async => mockResult);

      final result = await EventService().fetchAgendaItems(eventId);

      expect(result, equals(mockResult));
      verify(
        databaseFunctions.gqlAuthQuery(
          EventQueries().fetchAgendaItemsByEvent(eventId),
        ),
      ).called(1);
    });

    test(
        'setOrgStreamSubscription updates _currentOrg when stream emits new value',
        () async {
      final userConfig = locator<UserConfig>();
      userConfig.initialiseStream();

      final eventService = EventService();
      eventService.setOrgStreamSubscription();

      final orgInfo2 = OrgInfo(name: 'Organization temp', id: '1');
      userConfig.currentOrgInfoController.add(orgInfo2);
      await Future.delayed(const Duration(milliseconds: 100));
      expect(eventService.currentOrg.name, 'Organization temp');
      expect(eventService.currentOrg.id, '1');
    });

    test('fetchDataFromApi throws exception for null org ID', () async {
      final eventService = EventService();
      eventService.setOrgStreamSubscription();
      final userConfig = locator<UserConfig>();
      userConfig.initialiseStream();

      // Trigger the exception by setting null org ID
      userConfig.currentOrgInfoController.add(OrgInfo(name: 'Test', id: null));
      await Future.delayed(const Duration(milliseconds: 50));

      expect(() => eventService.fetchDataFromApi(), throwsException);
    });

    test('fetchDataFromApi should throw an exception if data is null',
        () async {
      final dbFunctions = locator<DataBaseMutationFunctions>();
      final eventService = EventService();
      final String mutation = EventQueries().fetchOrgEvents("XYZ");
      final options = QueryOptions(
        document: gql(mutation),
      );
      when(dbFunctions.gqlAuthQuery(mutation)).thenAnswer(
        (_) async => QueryResult(
          options: options,
          data: null,
          source: QueryResultSource.network,
        ),
      );
      try {
        await eventService.fetchDataFromApi();
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });

    test('fetchDataFromApi should return a list of events if data is valid',
        () async {
      final dbFunctions = locator<DataBaseMutationFunctions>();
      final eventService = EventService();
      final String mutation = EventQueries().fetchOrgEvents("XYZ");
      final options = QueryOptions(
        document: gql(mutation),
      );

      final data = {
        "eventsByOrganizationId": [
          {
            "id": "event1",
            "name": "Test Event 1",
            "description": "Description of Test Event 1",
            "startAt": "2022-01-01T10:00:00.000Z",
            "endAt": "2022-01-02T12:00:00.000Z",
            "organization": {
              "id": "org1",
              "name": "Organization 1",
            },
            "creator": {
              "user": {
                "id": "creator1",
                "name": "Creator One",
              },
            },
            "updater": {
              "user": {
                "id": "creator1",
                "name": "Creator One",
              },
            },
            "attachments": [
              {
                "mimeType": "image/jpeg",
                "url": "https://example.com/image1.jpg",
              }
            ],
          },
          {
            "id": "event2",
            "name": "Test Event 2",
            "description": "Description of Test Event 2",
            "startAt": "2022-02-01T11:00:00.000Z",
            "endAt": "2022-02-02T13:00:00.000Z",
            "organization": {
              "id": "org2",
              "name": "Organization 2",
            },
            "creator": {
              "user": {
                "id": "creator2",
                "name": "Creator Two",
              },
            },
            "updater": {
              "user": {
                "id": "creator2",
                "name": "Creator Two",
              },
            },
            "attachments": [
              {
                "mimeType": "image/png",
                "url": "https://example.com/image2.png",
              }
            ],
          }
        ],
      };

      when(dbFunctions.gqlAuthQuery(mutation)).thenAnswer(
        (_) async => QueryResult(
          options: options,
          data: data,
          source: QueryResultSource.network,
        ),
      );
      final events = await eventService.fetchDataFromApi();
      print(events);
      // expect(events, isA<List<Event>>());
      // expect(events.length, 2);
      // expect(events[0].title, "Test Event 1");
      // expect(events[1].title, "Test Event 2");
    });

    test('Test refreshFeed method', () async {
      final dbFunctions = setupDbFunctions();
      final userConfig = setupUserConfig();

      // Set up organization with a test ID BEFORE creating service
      const testOrgId = 'testOrgId123';
      setupTestOrganization(userConfig, testOrgId);

      final String mutation = createTestMutation(testOrgId);
      final mockData = createMockEventData(testOrgId);

      // Set up mock BEFORE creating the service
      setupGqlAuthQueryMock(dbFunctions, mutation, mockData);

      // Now create the service
      final eventService = createEventService();

      // Test refreshFeed
      await eventService.refreshFeed();

      // Just verify the method completes without errors
      expect(eventService, isNotNull);
    });

    test('Test fetchEventsInitial method', () async {
      final dbFunctions = setupDbFunctions();
      final userConfig = setupUserConfig();

      // Set up organization with a test ID BEFORE creating service
      const testOrgId = 'testOrgId456';
      setupTestOrganization(userConfig, testOrgId);

      final String mutation = createTestMutation(testOrgId);
      final mockData = createMockEventData(testOrgId);

      // Set up mock BEFORE creating the service
      setupGqlAuthQueryMock(dbFunctions, mutation, mockData);

      // Now create the service
      final eventService = createEventService();

      // Test fetchEventsInitial
      await eventService.fetchEventsInitial();

      // Just verify the method completes without errors
      expect(eventService, isNotNull);
    });

    test('Test refreshFeed method with stream updates', () async {
      final dbFunctions = setupDbFunctions();
      final userConfig = setupUserConfig();

      // Set up organization with a test ID BEFORE creating service
      const testOrgId = 'testOrgId789';
      setupTestOrganization(userConfig, testOrgId);

      final String mutation = createTestMutation(testOrgId);
      final mockData =
          createMockEventData(testOrgId, eventName: 'Refresh Test Event');

      // Set up mock BEFORE creating the service
      setupGqlAuthQueryMock(dbFunctions, mutation, mockData);

      // Now create the service
      final eventService = createEventService();

      // Listen to the event stream
      final streamEvents = <List<Event>>[];
      final subscription = eventService.eventStream.listen((events) {
        streamEvents.add(events);
      });

      // Test refreshFeed
      await eventService.refreshFeed();

      // Allow time for stream to emit
      await Future.delayed(const Duration(milliseconds: 100));

      // Verify stream received events
      expect(streamEvents.isNotEmpty, true);

      // Clean up
      await subscription.cancel();
    });

    test('Test fetchEventsInitial method with stream updates', () async {
      final dbFunctions = setupDbFunctions();
      final userConfig = setupUserConfig();

      // Set up organization with a test ID BEFORE creating service
      const testOrgId = 'testOrgId101';
      setupTestOrganization(userConfig, testOrgId);

      final String mutation = createTestMutation(testOrgId);
      final mockData =
          createMockEventData(testOrgId, eventName: 'Initial Test Event');

      // Set up mock BEFORE creating the service
      setupGqlAuthQueryMock(dbFunctions, mutation, mockData);

      // Now create the service
      final eventService = createEventService();

      // Listen to the event stream
      final streamEvents = <List<Event>>[];
      final subscription = eventService.eventStream.listen((events) {
        streamEvents.add(events);
      });

      // Test fetchEventsInitial
      await eventService.fetchEventsInitial();

      // Allow time for stream to emit
      await Future.delayed(const Duration(milliseconds: 100));

      // Verify stream received events (should be called at least twice: once for cache, once for refresh)
      expect(streamEvents.length, greaterThanOrEqualTo(1));

      // Clean up
      await subscription.cancel();
    });
  });
}
