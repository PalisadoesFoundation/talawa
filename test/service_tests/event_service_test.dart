// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/utils/event_queries.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  group('EventService Tests', () {
    late EventService eventService;
    late DataBaseMutationFunctions mockDbFunctions;

    setUp(() {
      eventService = EventService();
      mockDbFunctions = locator<DataBaseMutationFunctions>();
    });

    group('Event CRUD Operations', () {
      test('createEvent - creates event successfully', () async {
        final variables = {
          'title': 'New Event',
          'description': 'Event description',
          'location': 'Event location',
          'isPublic': true,
          'isRegisterable': true,
        };

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().addEvent(),
            variables: variables,
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'createEvent': {
                'id': 'eventId123',
                'name': 'New Event',
                'description': 'Event description',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.createEvent(variables: variables);

        expect(result, isNotNull);
        expect(result.data, isNotNull);
        expect(result.data!['createEvent']['id'], 'eventId123');
        verify(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().addEvent(),
            variables: variables,
          ),
        ).called(1);
      });

      test('editEvent - standalone event', () async {
        final variables = {
          'id': 'eventId',
          'title': 'Updated Event',
        };

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().updateStandaloneEvent(),
            variables: {
              'input': variables,
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'updateEvent': {
                'id': 'eventId',
                'name': 'Updated Event',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.editEvent(
          variables: variables,
          recurrenceType: 'standalone',
        );

        expect(result, isNotNull);
        expect(result.data, isNotNull);
        verify(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().updateStandaloneEvent(),
            variables: {
              'input': variables,
            },
          ),
        ).called(1);
      });

      test('editEvent - single recurring instance', () async {
        final variables = {'id': 'eventId', 'title': 'Updated'};

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().updateSingleRecurringEventInstance(),
            variables: {'input': variables},
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'updateEvent': {'id': 'eventId'},
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.editEvent(
          variables: variables,
          recurrenceType: 'single',
        );

        expect(result, isNotNull);
      });

      test('editEvent - entire series', () async {
        final variables = {'id': 'eventId', 'title': 'Updated Series'};

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().updateEntireRecurringEventSeries(),
            variables: {'input': variables},
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'updateEvent': {'id': 'eventId'},
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.editEvent(
          variables: variables,
          recurrenceType: 'series',
        );

        expect(result, isNotNull);
      });

      test('editEvent - this and following', () async {
        final variables = {'id': 'eventId', 'title': 'Updated'};

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().updateThisAndFollowingEvents(),
            variables: {'input': variables},
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'updateEvent': {'id': 'eventId'},
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.editEvent(
          variables: variables,
          recurrenceType: 'thisAndFollowing',
        );

        expect(result, isNotNull);
      });

      test('deleteEvent - standalone event', () async {
        final event = Event(id: 'eventId', name: 'Test Event');

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().deleteStandaloneEvent(),
            variables: {
              'input': {'id': 'eventId'},
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'deleteEvent': {'id': 'eventId'},
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.deleteEvent(event);

        expect(result, isNotNull);
        expect(result.data, isNotNull);
        verify(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().deleteStandaloneEvent(),
            variables: {
              'input': {'id': 'eventId'},
            },
          ),
        ).called(1);
      });

      test('deleteEvent - single recurring instance', () async {
        final event = Event(id: 'eventId', name: 'Test Event');

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().deleteSingleEventOfRecurring(),
            variables: {
              'input': {'id': 'eventId'},
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'deleteEvent': {'id': 'eventId'},
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.deleteEvent(
          event,
          recurrenceType: 'single',
        );

        expect(result, isNotNull);
      });

      test('deleteEvent - entire series', () async {
        final baseEvent = Event(id: 'baseEventId', name: 'Base Event');
        final event = Event(
          id: 'eventId',
          name: 'Test Event',
          baseEvent: baseEvent,
        );

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().deleteEntireEventSeriesOfRecurring(),
            variables: {
              'input': {'id': 'baseEventId'},
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'deleteEvent': {'id': 'baseEventId'},
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.deleteEvent(
          event,
          recurrenceType: 'series',
        );

        expect(result, isNotNull);
      });

      test('deleteEvent - this and following', () async {
        final event = Event(id: 'eventId', name: 'Test Event');

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().deleteThisAndFollowing(),
            variables: {
              'input': {'id': 'eventId'},
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'deleteEvent': {'id': 'eventId'},
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.deleteEvent(
          event,
          recurrenceType: 'thisAndFollowing',
        );

        expect(result, isNotNull);
      });
    });

    group('Event Fetching', () {
      test('fetchDataFromApi - returns list of events on success', () async {
        final query = EventQueries().fetchOrgEvents();
        final mockData = {
          "organization": {
            "events": {
              "edges": [
                {
                  "node": {
                    "id": "event1",
                    "name": "Test Event 1",
                    "description": "Description 1",
                    "location": "Location 1",
                    "allDay": false,
                    "startAt": "2024-01-01T10:00:00.000Z",
                    "endAt": "2024-01-01T12:00:00.000Z",
                    "isPublic": true,
                    "isRegisterable": true,
                  },
                },
                {
                  "node": {
                    "id": "event2",
                    "name": "Test Event 2",
                    "description": "Description 2",
                    "location": "Location 2",
                    "allDay": false,
                    "startAt": "2024-02-01T11:00:00.000Z",
                    "endAt": "2024-02-01T13:00:00.000Z",
                    "isPublic": true,
                    "isRegisterable": false,
                  },
                }
              ],
            },
          },
        };

        when(
          mockDbFunctions.gqlAuthQuery(
            query,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: mockData,
            source: QueryResultSource.network,
          ),
        );

        final events = await eventService.fetchDataFromApi();

        expect(events, isA<List<Event>>());
        expect(events.length, 2);
        expect(events[0].name, "Test Event 1");
        expect(events[1].name, "Test Event 2");
      });

      test('fetchDataFromApi - throws exception when data is null', () async {
        final query = EventQueries().fetchOrgEvents();

        when(
          mockDbFunctions.gqlAuthQuery(
            query,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: null,
            source: QueryResultSource.network,
          ),
        );

        expect(
          () async => await eventService.fetchDataFromApi(),
          throwsException,
        );
      });

      test('fetchDataFromApi - uses custom date range params', () async {
        final query = EventQueries().fetchOrgEvents();
        final startDate = DateTime(2024, 1, 1);
        final endDate = DateTime(2024, 12, 31);

        when(
          mockDbFunctions.gqlAuthQuery(
            query,
            variables: argThat(
              predicate(
                (Map<String, dynamic> vars) =>
                    vars['startDate'] == startDate.toUtc().toIso8601String() &&
                    vars['endDate'] == endDate.toUtc().toIso8601String(),
              ),
              named: 'variables',
            ),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql(query)),
            data: {
              "organization": {
                "events": {"edges": []},
              },
            },
            source: QueryResultSource.network,
          ),
        );

        await eventService.fetchDataFromApi(
          params: {
            'startDate': startDate.toUtc().toIso8601String(),
            'endDate': endDate.toUtc().toIso8601String(),
          },
        );

        verify(
          mockDbFunctions.gqlAuthQuery(
            query,
            variables: anyNamed('variables'),
          ),
        ).called(3);
      });
    });

    group('Event Registration and Attendees', () {
      test('registerForAnEvent - registers successfully', () async {
        const eventId = 'eventId123';
        final variables = {'eventId': eventId};

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().registerForEvent(),
            variables: variables,
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'registerForEvent': {'id': eventId},
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.registerForAnEvent(eventId);

        expect(result, isNotNull);
        expect(result.data, isNotNull);
        verify(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().registerForEvent(),
            variables: variables,
          ),
        ).called(1);
      });

      test('fetchAttendeesByEvent - returns attendees', () async {
        const eventId = 'eventId123';

        when(
          mockDbFunctions.gqlAuthQuery(
            EventQueries().attendeesByEvent(eventId),
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'getEventAttendeesByEventId': [
                {'userId': 'user1'},
                {'userId': 'user2'},
              ],
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.fetchAttendeesByEvent(eventId);

        expect(result, isNotNull);
        expect(result.data, isNotNull);
        verify(
          mockDbFunctions.gqlAuthQuery(
            EventQueries().attendeesByEvent(eventId),
          ),
        ).called(1);
      });
    });

    group('Volunteer Groups', () {
      test('createVolunteerGroup - creates successfully', () async {
        final variables = {
          'name': 'Volunteer Group 1',
          'eventId': 'eventId1',
        };

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().createVolunteerGroup(),
            variables: {'data': variables},
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'createVolunteerGroup': {
                '_id': 'groupId1',
                'name': 'Volunteer Group 1',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.createVolunteerGroup(variables);

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

      test('removeVolunteerGroup - removes successfully', () async {
        final variables = {'groupId': 'groupId123'};

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().removeEventVolunteerGroup(),
            variables: variables,
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'removeVolunteerGroup': {
                '_id': 'groupId123',
                'name': 'Volunteer Group 1',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.removeVolunteerGroup(variables);

        expect(result, isA<QueryResult>());
        expect(result.data!['removeVolunteerGroup']['_id'], 'groupId123');
      });

      test('updateVolunteerGroup - updates successfully', () async {
        final variables = {
          'groupId': 'groupId123',
          'name': 'Updated Volunteer Group Name',
        };

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().updateVolunteerGroupMutation(),
            variables: variables,
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'updateVolunteerGroup': {
                '_id': 'groupId123',
                'name': 'Updated Volunteer Group Name',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.updateVolunteerGroup(variables);

        expect(result, isA<QueryResult>());
        expect(result.data!['updateVolunteerGroup']['_id'], 'groupId123');
        expect(
          result.data!['updateVolunteerGroup']['name'],
          'Updated Volunteer Group Name',
        );
      });

      test('addVolunteerToGroup - adds successfully', () async {
        final variables = {
          'groupId': 'groupId123',
          'volunteerId': 'volunteerId123',
        };

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().addVolunteerToGroup(),
            variables: {'data': variables},
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'addVolunteerToGroup': {
                '_id': 'volunteerId123',
                'name': 'Volunteer Name',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.addVolunteerToGroup(variables);

        expect(result, isA<QueryResult>());
        expect(result.data!['addVolunteerToGroup']['_id'], 'volunteerId123');
      });

      test('removeVolunteerFromGroup - removes successfully', () async {
        final variables = {'volunteerId': 'volunteerId123'};

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().removeVolunteerMutation(),
            variables: variables,
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'removeVolunteer': {
                '_id': 'volunteerId123',
                'name': 'Volunteer Name',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final result = await eventService.removeVolunteerFromGroup(variables);

        expect(result, isA<QueryResult>());
        expect(result.data!['removeVolunteer']['_id'], 'volunteerId123');
      });

      test('fetchVolunteerGroupsByEvent - returns list of groups', () async {
        const eventId = 'eventId123';

        when(
          mockDbFunctions.gqlAuthQuery(
            EventQueries().fetchVolunteerGroups(),
            variables: {
              "where": {"eventId": eventId},
            },
          ),
        ).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
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

        final result = await eventService.fetchVolunteerGroupsByEvent(eventId);

        expect(result, isA<List<EventVolunteerGroup>>());
        expect(result.length, 2);
        expect(result[0].id, 'groupId1');
        expect(result[1].id, 'groupId2');
      });

      test('fetchVolunteerGroupsByEvent - throws on error', () async {
        const eventId = 'eventId123';

        when(
          mockDbFunctions.gqlAuthQuery(
            EventQueries().fetchVolunteerGroups(),
            variables: {
              "where": {"eventId": eventId},
            },
          ),
        ).thenThrow(Exception("query error"));

        expect(
          () async => await eventService.fetchVolunteerGroupsByEvent(eventId),
          throwsException,
        );
      });
    });

    group('Agenda Items', () {
      test('fetchAgendaCategories - returns categories', () async {
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
          mockDbFunctions.gqlAuthMutation(
            EventQueries().fetchAgendaItemCategoriesByOrganization(orgId),
          ),
        ).thenAnswer((_) async => mockResult);

        final result = await eventService.fetchAgendaCategories(orgId);

        expect(result, equals(mockResult));
        verify(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().fetchAgendaItemCategoriesByOrganization(orgId),
          ),
        ).called(1);
      });

      test('createAgendaItem - creates successfully', () async {
        final variables = {'title': 'New Agenda', 'description': 'Description'};
        final mockResult = QueryResult(
          options: QueryOptions(document: gql('')),
          data: {
            'createAgendaItem': {'_id': 'agenda1'},
          },
          source: QueryResultSource.network,
        );

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().createAgendaItem(),
            variables: {'input': variables},
          ),
        ).thenAnswer((_) async => mockResult);

        final result = await eventService.createAgendaItem(variables);

        expect(result, equals(mockResult));
        verify(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().createAgendaItem(),
            variables: {'input': variables},
          ),
        ).called(1);
      });

      test('deleteAgendaItem - deletes successfully', () async {
        final variables = {'agendaItemId': 'agenda1'};
        final mockResult = QueryResult(
          options: QueryOptions(document: gql('')),
          data: {
            'deleteAgendaItem': {'_id': 'agenda1'},
          },
          source: QueryResultSource.network,
        );

        when(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().deleteAgendaItem(),
            variables: variables,
          ),
        ).thenAnswer((_) async => mockResult);

        final result = await eventService.deleteAgendaItem(variables);

        expect(result, equals(mockResult));
        verify(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().deleteAgendaItem(),
            variables: variables,
          ),
        ).called(1);
      });

      test('updateAgendaItem - updates successfully', () async {
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
          mockDbFunctions.gqlAuthMutation(
            EventQueries().updateAgendaItem(),
            variables: {
              'updateAgendaItemId': itemId,
              'input': variables,
            },
          ),
        ).thenAnswer((_) async => mockResult);

        final result = await eventService.updateAgendaItem(itemId, variables);

        expect(result, equals(mockResult));
        verify(
          mockDbFunctions.gqlAuthMutation(
            EventQueries().updateAgendaItem(),
            variables: {
              'updateAgendaItemId': itemId,
              'input': variables,
            },
          ),
        ).called(1);
      });

      test('fetchAgendaItems - returns agenda items', () async {
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
          mockDbFunctions.gqlAuthQuery(
            EventQueries().fetchAgendaItemsByEvent(eventId),
          ),
        ).thenAnswer((_) async => mockResult);

        final result = await eventService.fetchAgendaItems(eventId);

        expect(result, equals(mockResult));
        verify(
          mockDbFunctions.gqlAuthQuery(
            EventQueries().fetchAgendaItemsByEvent(eventId),
          ),
        ).called(1);
      });
    });

    group('Event Stream and State', () {
      test('eventStream getter returns stream', () {
        expect(eventService.eventStream, isA<Stream<List<Event>>>());
      });

      test('events getter returns list', () {
        expect(eventService.events, isA<List<Event>>());
      });

      test('clearEvents - clears events list and cache', () async {
        await eventService.clearEvents();
        expect(eventService.events, isEmpty);
      });
    });

    test('dispose - cancels stream subscription', () {
      // This test just ensures dispose doesn't throw an error
      expect(() => eventService.dispose(), returnsNormally);
    });
  });
}
