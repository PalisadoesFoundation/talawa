// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/models/events/event_agenda_item.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('Event Info Tests', () {
    final model = EventInfoViewModel();

    test("test initialization", () async {
      final Event event =
          Event(id: "1", isRegisterable: true, isRegistered: false);
      // ignore: prefer_const_constructors
      final exploreEventsViewModel = ExploreEventsViewModel();
      // ignore: prefer_const_constructors
      final mockEventService = getAndRegisterEventService();

      // Mock fetchCategories call - use "XYZ" as it's the test org ID
      // ignore: prefer_const_constructors

      when(mockEventService.fetchAgendaCategories("XYZ"))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: const {
                  'agendaItemCategoriesByOrganization': [],
                },
                options: QueryOptions(
                  document: gql(
                    EventQueries()
                        .fetchAgendaItemCategoriesByOrganization('XYZ'),
                  ),
                ),
              ));

      // Mock fetchAgendaItems call - use "1" as the event ID
      when(mockEventService.fetchAgendaItems("1"))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {
                  'agendaItemByEvent': [],
                },
                options: QueryOptions(
                  document: gql(EventQueries().fetchAgendaItemsByEvent('1')),
                ),
              ));

      await model.initialize(
        args: {
          "event": event,
          "exploreEventViewModel": exploreEventsViewModel,
        },
      );
      expect(model.fabTitle, "Register");
    });

    test("Test register for event", () async {
      final Event event1 =
          Event(id: "1", isRegisterable: true, isRegistered: false);
      model.event = event1;

      final eventService = getAndRegisterEventService();
      when(eventService.registerForAnEvent(model.event.id!))
          .thenAnswer((realInvocation) async {
        return "Event Registered";
      });
      await model.registerForEvent();

      verify(navigationService.pop());

      verify(eventService.registerForAnEvent(model.event.id!));
      expect(model.event.isRegistered, true);
      expect(model.fabTitle, "Registered");

      // now make the event non registrable
      model.event.isRegistered = false;
      model.event.isRegisterable = false;
      await model.registerForEvent();
      verifyNever(eventService.registerForAnEvent(model.event.id!));
      expect(model.event.isRegistered, false);
    });

    test("Test getFabTitle function", () {
      final Event event1 = Event(id: "1", isRegisterable: false);
      model.event = event1;
      expect(model.getFabTitle(), "Not Registrable");

      final Event event2 =
          Event(id: "2", isRegisterable: true, isRegistered: false);
      model.event = event2;
      expect(model.getFabTitle(), "Register");

      final Event event3 =
          Event(id: "3", isRegisterable: true, isRegistered: true);
      model.event = event3;
      expect(model.getFabTitle(), "Registered");
    });
    test("Test createVolunteerGroup success", () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResult = {
        'createEventVolunteerGroup': {
          '_id': 'group1',
          'name': 'Group 1',
          'volunteersRequired': 10,
          'createdAt': '2024-01-01T00:00:00Z',
          'creator': {'_id': 'creator1'},
        },
      };

      when(
        eventService.createVolunteerGroup({
          'eventId': "1",
          'name': 'Group 1',
          'volunteersRequired': 10,
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          data: mockResult,
          source: QueryResultSource.network,
          options: QueryOptions(
            document: gql(EventQueries().createVolunteerGroup()),
          ),
        ),
      );

      final newGroup = await model.createVolunteerGroup(event1, 'Group 1', 10);

      expect(newGroup, isNotNull);
      expect(newGroup!.name, 'Group 1');
      expect(model.volunteerGroups.length, 1);
      expect(model.volunteerGroups.first.name, 'Group 1');
    });

    test("Test createVolunteerGroup Failure", () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      when(
        eventService.createVolunteerGroup({
          'eventId': "1",
          'name': 'Group 1',
          'volunteersRequired': 10,
        }),
      ).thenThrow(Exception('Failed to create new volunteer group'));

      final newGroup = await model.createVolunteerGroup(event1, 'Group 1', 10);

      expect(newGroup, isNull);
    });

    test("Test fetchVolunteerGroups success", () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResult = [
        EventVolunteerGroup(
          id: 'group1',
          name: 'Group 1',
          volunteersRequired: 10,
          createdAt: '2024-01-01T00:00:00Z',
        ),
      ];

      when(eventService.fetchVolunteerGroupsByEvent("1"))
          .thenAnswer((_) async => mockResult);

      await model.fetchVolunteerGroups('1');

      expect(model.volunteerGroups.length, 1);
      expect(model.volunteerGroups.first.name, 'Group 1');
    });

    test("Test fetchVolunteerGroups failure", () async {
      final Event event1 = Event(id: "1");
      model.event = event1;
      model.volunteerGroups.clear();

      final eventService = getAndRegisterEventService();
      when(eventService.fetchVolunteerGroupsByEvent("1"))
          .thenThrow(Exception('Failed to fetch volunteer groups'));

      await model.fetchVolunteerGroups('1');

      expect(model.volunteerGroups.length, 0);
    });

    test('createAgendaItem success', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'createAgendaItem': {
            'id': '1',
            'title': 'Test Agenda',
            'duration': '1h',
            'sequence': 1,
          },
        },
        options: QueryOptions(document: gql(EventQueries().createAgendaItem())),
      );

      when(
        eventService.createAgendaItem({
          'title': 'Test Agenda',
          'sequence': 1,
          'description': 'desc',
          'duration': '1h',
          'organizationId': 'XYZ',
          'attachments': [],
          'relatedEventId': model.event.id,
          'urls': [],
          'categories': ['cat1'],
        }),
      ).thenAnswer((_) async => mockResult);

      final result = await model.createAgendaItem(
        title: 'Test Agenda',
        duration: '1h',
        attachments: [],
        categories: ['cat1'],
        description: 'desc',
        sequence: 1,
        urls: [],
      );

      expect(result, isNotNull);
      expect(result!.title, 'Test Agenda');
      expect(model.agendaItems.length, 1);
      expect(model.agendaItems.first.title, 'Test Agenda');
    });
    test('deleteAgendaItem success', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1'),
        EventAgendaItem(id: '2', title: 'Item 2'),
      ]);

      when(eventService.deleteAgendaItem({"removeAgendaItemId": '1'}))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {'deleteAgendaItem': true},
                options: QueryOptions(
                  document: gql(EventQueries().deleteAgendaItem()),
                ),
              ));

      await model.deleteAgendaItem('1');

      expect(model.agendaItems.length, 1);
      expect(model.agendaItems.first.id, '2');
    });

    test('updateAgendaItemSequence success', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'updateAgendaItem': {
            'id': '1',
            'title': 'Updated Item',
            'sequence': 2,
          },
        },
        options: QueryOptions(document: gql(EventQueries().updateAgendaItem())),
      );
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1', sequence: 1),
        EventAgendaItem(id: '2', title: 'Item 2', sequence: 2),
      ]);

      when(
        eventService.updateAgendaItem(
          '1',
          {'sequence': 2},
        ),
      ).thenAnswer((_) async => mockResult);

      await model.updateAgendaItemSequence('1', 2);

      expect(model.agendaItems.first.sequence, 2);
      expect(model.agendaItems.first.title, 'Updated Item');
    });
    test('fetchAgendaItems success', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'agendaItemByEvent': [
            {
              'id': '1',
              'title': 'Agenda 1',
              'duration': '1h',
              'sequence': 1,
            },
            {
              'id': '2',
              'title': 'Agenda 2',
              'duration': '30m',
              'sequence': 2,
            },
          ],
        },
        options: QueryOptions(
          document: gql(EventQueries().fetchAgendaItemsByEvent('1')),
        ),
      );

      when(eventService.fetchAgendaItems('1'))
          .thenAnswer((_) async => mockResult);

      await model.fetchAgendaItems();

      expect(model.agendaItems.length, 2);
      expect(model.agendaItems[0].title, 'Agenda 1');
      expect(model.agendaItems[1].title, 'Agenda 2');
      expect(model.agendaItems[0].sequence, 1);
      expect(model.agendaItems[1].sequence, 2);
    });

    test('fetchCategories success', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'agendaItemCategoriesByOrganization': [
            {
              'id': '1',
              'name': 'Category 1',
            },
            {
              'id': '2',
              'name': 'Category 2',
            },
          ],
        },
        options: QueryOptions(
          document: gql(
            EventQueries().fetchAgendaItemCategoriesByOrganization('XYZ'),
          ),
        ),
      );

      when(eventService.fetchAgendaCategories("XYZ"))
          .thenAnswer((_) async => mockResult);

      await model.fetchCategories();

      expect(model.categories.length, 2);
      expect(model.categories[0].name, 'Category 1');
      expect(model.categories[1].name, 'Category 2');
    });

    // ============================================================
    // EXCEPTION HANDLING TESTS - Test GraphQL exception handling
    // ============================================================

    test('fetchCategories handles QueryResult with exception gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;
      model.categories.clear();

      final eventService = getAndRegisterEventService();
      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Failed to fetch categories')
          ],
        ),
        options: QueryOptions(
          document: gql(
            EventQueries().fetchAgendaItemCategoriesByOrganization('XYZ'),
          ),
        ),
      );

      when(eventService.fetchAgendaCategories("XYZ"))
          .thenAnswer((_) async => mockResultWithException);

      await model.fetchCategories();

      // Should not crash, categories should remain empty
      expect(model.categories.length, 0);
    });

    test('fetchAgendaItems handles QueryResult with exception gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;
      model.agendaItems.clear();

      final eventService = getAndRegisterEventService();
      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Failed to fetch agenda items')
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().fetchAgendaItemsByEvent('1')),
        ),
      );

      when(eventService.fetchAgendaItems('1'))
          .thenAnswer((_) async => mockResultWithException);

      await model.fetchAgendaItems();

      // Should not crash, agendaItems should remain empty
      expect(model.agendaItems.length, 0);
    });

    test('createAgendaItem handles QueryResult with exception gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Failed to create agenda item')
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().createAgendaItem()),
        ),
      );

      when(
        eventService.createAgendaItem({
          'title': 'Test Agenda',
          'sequence': 1,
          'description': 'desc',
          'duration': '1h',
          'organizationId': 'XYZ',
          'attachments': [],
          'relatedEventId': model.event.id,
          'urls': [],
          'categories': ['cat1'],
        }),
      ).thenAnswer((_) async => mockResultWithException);

      final result = await model.createAgendaItem(
        title: 'Test Agenda',
        duration: '1h',
        attachments: [],
        categories: ['cat1'],
        description: 'desc',
        sequence: 1,
        urls: [],
      );

      // Should return null when service returns exception
      expect(result, isNull);
      expect(model.agendaItems.length, 0);
    });

    test('createVolunteerGroup handles QueryResult with exception gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Failed to create volunteer group')
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().createVolunteerGroup()),
        ),
      );

      when(
        eventService.createVolunteerGroup({
          'eventId': "1",
          'name': 'Group 1',
          'volunteersRequired': 10,
        }),
      ).thenAnswer((_) async => mockResultWithException);

      final newGroup = await model.createVolunteerGroup(event1, 'Group 1', 10);

      // Should return null when service returns exception
      expect(newGroup, isNull);
      expect(model.volunteerGroups.length, 0);
    });

    test(
        'updateAgendaItemSequence handles QueryResult with exception gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1', sequence: 1),
      ]);

      final mockResultWithException = QueryResult(
        source: QueryResultSource.network,
        data: null,
        exception: OperationException(
          linkException: null,
          graphqlErrors: const [
            GraphQLError(message: 'Failed to update agenda item sequence')
          ],
        ),
        options: QueryOptions(
          document: gql(EventQueries().updateAgendaItem()),
        ),
      );

      when(
        eventService.updateAgendaItem('1', {'sequence': 2}),
      ).thenAnswer((_) async => mockResultWithException);

      // Should handle gracefully without crashing
      await model.updateAgendaItemSequence('1', 2);

      // Original item should remain unchanged
      expect(model.agendaItems.first.sequence, 1);
    });

    // ============================================================
    // NULL DATA TESTS - Test QueryResult with null data (no exception)
    // ============================================================

    test('fetchCategories handles QueryResult with null data gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;
      model.categories.clear();

      final eventService = getAndRegisterEventService();
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(
          document: gql(
            EventQueries().fetchAgendaItemCategoriesByOrganization('XYZ'),
          ),
        ),
      );

      when(eventService.fetchAgendaCategories("XYZ"))
          .thenAnswer((_) async => mockResult);

      await model.fetchCategories();

      // Should not crash, categories should remain empty
      expect(model.categories.length, 0);
    });

    test('fetchAgendaItems handles QueryResult with null data gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;
      model.agendaItems.clear();

      final eventService = getAndRegisterEventService();
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(
          document: gql(EventQueries().fetchAgendaItemsByEvent('1')),
        ),
      );

      when(eventService.fetchAgendaItems('1'))
          .thenAnswer((_) async => mockResult);

      await model.fetchAgendaItems();

      // Should not crash, agendaItems should remain empty
      expect(model.agendaItems.length, 0);
    });

    test('createAgendaItem handles QueryResult with null data gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResultWithNullData = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(
          document: gql(EventQueries().createAgendaItem()),
        ),
      );

      when(
        eventService.createAgendaItem({
          'title': 'Test Agenda',
          'sequence': 1,
          'description': 'desc',
          'duration': '1h',
          'organizationId': 'XYZ',
          'attachments': [],
          'relatedEventId': model.event.id,
          'urls': [],
          'categories': ['cat1'],
        }),
      ).thenAnswer((_) async => mockResultWithNullData);

      final result = await model.createAgendaItem(
        title: 'Test Agenda',
        duration: '1h',
        attachments: [],
        categories: ['cat1'],
        description: 'desc',
        sequence: 1,
        urls: [],
      );

      // Should return null when data is null
      expect(result, isNull);
      expect(model.agendaItems.length, 0);
    });

    test(
        'createAgendaItem handles QueryResult with missing mutation data gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResultWithMissingData = QueryResult(
        source: QueryResultSource.network,
        data: {
          // Data exists but mutation field is missing
          'otherField': 'value',
        },
        options: QueryOptions(
          document: gql(EventQueries().createAgendaItem()),
        ),
      );

      when(
        eventService.createAgendaItem({
          'title': 'Test Agenda',
          'sequence': 1,
          'description': 'desc',
          'duration': '1h',
          'organizationId': 'XYZ',
          'attachments': [],
          'relatedEventId': model.event.id,
          'urls': [],
          'categories': ['cat1'],
        }),
      ).thenAnswer((_) async => mockResultWithMissingData);

      final result = await model.createAgendaItem(
        title: 'Test Agenda',
        duration: '1h',
        attachments: [],
        categories: ['cat1'],
        description: 'desc',
        sequence: 1,
        urls: [],
      );

      // Should return null when mutation data is missing
      expect(result, isNull);
      expect(model.agendaItems.length, 0);
    });

    test('createVolunteerGroup handles QueryResult with null data gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResultWithNullData = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(
          document: gql(EventQueries().createVolunteerGroup()),
        ),
      );

      when(
        eventService.createVolunteerGroup({
          'eventId': "1",
          'name': 'Group 1',
          'volunteersRequired': 10,
        }),
      ).thenAnswer((_) async => mockResultWithNullData);

      final newGroup = await model.createVolunteerGroup(event1, 'Group 1', 10);

      // Should return null when data is null
      expect(newGroup, isNull);
      expect(model.volunteerGroups.length, 0);
    });

    test(
        'createVolunteerGroup handles QueryResult with missing mutation data gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      final mockResultWithMissingData = QueryResult(
        source: QueryResultSource.network,
        data: {
          // Data exists but mutation field is missing
          'otherField': 'value',
        },
        options: QueryOptions(
          document: gql(EventQueries().createVolunteerGroup()),
        ),
      );

      when(
        eventService.createVolunteerGroup({
          'eventId': "1",
          'name': 'Group 1',
          'volunteersRequired': 10,
        }),
      ).thenAnswer((_) async => mockResultWithMissingData);

      final newGroup = await model.createVolunteerGroup(event1, 'Group 1', 10);

      // Should return null when mutation data is missing
      expect(newGroup, isNull);
      expect(model.volunteerGroups.length, 0);
    });

    test(
        'updateAgendaItemSequence handles QueryResult with null data gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1', sequence: 1),
      ]);

      final mockResultWithNullData = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(
          document: gql(EventQueries().updateAgendaItem()),
        ),
      );

      when(
        eventService.updateAgendaItem('1', {'sequence': 2}),
      ).thenAnswer((_) async => mockResultWithNullData);

      // Should handle gracefully without crashing
      await model.updateAgendaItemSequence('1', 2);

      // Original item should remain unchanged
      expect(model.agendaItems.first.sequence, 1);
    });

    test(
        'updateAgendaItemSequence handles QueryResult with missing mutation data gracefully',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1', sequence: 1),
      ]);

      final mockResultWithMissingData = QueryResult(
        source: QueryResultSource.network,
        data: {
          // Data exists but mutation field is missing
          'otherField': 'value',
        },
        options: QueryOptions(
          document: gql(EventQueries().updateAgendaItem()),
        ),
      );

      when(
        eventService.updateAgendaItem('1', {'sequence': 2}),
      ).thenAnswer((_) async => mockResultWithMissingData);

      // Should handle gracefully without crashing
      await model.updateAgendaItemSequence('1', 2);

      // Original item should remain unchanged
      expect(model.agendaItems.first.sequence, 1);
    });

    // ============================================================
    // NULL RESULT TESTS - Test when GraphQL service returns null
    // ============================================================

    test('createVolunteerGroup handles empty data gracefully', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      when(
        eventService.createVolunteerGroup({
          'eventId': '1',
          'name': 'Test Group',
          'volunteersRequired': 5,
        }),
      ).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            options: QueryOptions(
              document: gql(EventQueries().createVolunteerGroup()),
            ),
          ));

      // Should handle gracefully without crashing
      final result = await model.createVolunteerGroup(event1, 'Test Group', 5);

      expect(result, isNull);
    });

    test('fetchCategories handles empty data gracefully', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      when(eventService.fetchAgendaCategories("XYZ"))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: null,
                options: QueryOptions(
                  document: gql(EventQueries()
                      .fetchAgendaItemCategoriesByOrganization('XYZ')),
                ),
              ));

      // Should handle gracefully without crashing
      await model.fetchCategories();

      // Categories should remain empty or unchanged
      expect(model.categories, isA<List>());
    });

    test('fetchAgendaItems handles empty data gracefully', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      when(eventService.fetchAgendaItems('1'))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: null,
                options: QueryOptions(
                  document: gql(EventQueries().fetchAgendaItemsByEvent('1')),
                ),
              ));

      // Should handle gracefully without crashing
      await model.fetchAgendaItems();

      // Agenda items should remain empty or unchanged
      expect(model.agendaItems, isA<List>());
    });

    test('createAgendaItem handles empty data gracefully', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      when(
        eventService.createAgendaItem({
          'title': 'Test Item',
          'sequence': 1,
          'description': null,
          'duration': '30',
          'organizationId': 'XYZ',
          'relatedEventId': '1',
          'attachments': <String>[],
          'urls': <String>[],
          'categories': <String>[],
        }),
      ).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            options: QueryOptions(
              document: gql(EventQueries().createAgendaItem()),
            ),
          ));

      // Should handle gracefully without crashing
      final result = await model.createAgendaItem(
        title: 'Test Item',
        duration: '30',
        attachments: [],
        urls: [],
        categories: [],
      );

      expect(result, isNull);
    });

    test('updateAgendaItemSequence handles empty data gracefully', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1', sequence: 1),
      ]);

      when(
        eventService.updateAgendaItem('1', {'sequence': 2}),
      ).thenAnswer((_) async => QueryResult(
            source: QueryResultSource.network,
            data: null,
            options: QueryOptions(
              document: gql(EventQueries().updateAgendaItem()),
            ),
          ));

      // Should handle gracefully without crashing
      await model.updateAgendaItemSequence('1', 2);

      // Original item should remain unchanged
      expect(model.agendaItems.first.sequence, 1);
    });

    // ============================================================
    // ADDITIONAL COVERAGE TESTS
    // ============================================================

    test('selectedCategories getter returns the list', () {
      // Access selectedCategories getter (line 45)
      expect(model.selectedCategories, isA<List<AgendaCategory>>());
    });

    test('setSelectedCategories updates selected categories', () {
      final testCategories = [
        AgendaCategory(id: 'cat1', name: 'Category 1'),
        AgendaCategory(id: 'cat2', name: 'Category 2'),
      ];

      model.setSelectedCategories(testCategories);

      expect(model.selectedCategories.length, 2);
      expect(model.selectedCategories[0].id, 'cat1');
    });

    test('fetchCategories handles exception thrown by service', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      when(eventService.fetchAgendaCategories("XYZ"))
          .thenThrow(Exception('Network error'));

      // Should handle gracefully without crashing
      await model.fetchCategories();

      expect(model.categories, isA<List>());
    });

    test('fetchAgendaItems handles exception thrown by service', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      when(eventService.fetchAgendaItems('1'))
          .thenThrow(Exception('Network error'));

      // Should handle gracefully without crashing
      await model.fetchAgendaItems();

      expect(model.agendaItems, isA<List>());
    });

    test('createAgendaItem handles exception thrown by service', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      // Clear agenda items to ensure consistent sequence (sequence = length + 1 = 1)
      model.agendaItems.clear();

      final eventService = getAndRegisterEventService();

      // Match the exact variables that createAgendaItem will generate
      final expectedVariables = {
        'title': 'Test Item',
        'description': null,
        'duration': '30',
        'attachments': <String>[],
        'relatedEventId': '1',
        'urls': <String>[],
        'categories': <String>[],
        'sequence': 1,
        'organizationId': 'XYZ',
      };

      when(
        eventService.createAgendaItem(expectedVariables),
      ).thenThrow(Exception('Network error'));

      final result = await model.createAgendaItem(
        title: 'Test Item',
        duration: '30',
        attachments: [],
        urls: [],
        categories: [],
      );

      // Should return null and hit the catch block (line 352)
      expect(result, isNull);
    });

    test('createVolunteerGroup handles exception thrown by service', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      when(
        eventService.createVolunteerGroup({
          'eventId': '1',
          'name': 'Test Group',
          'volunteersRequired': 5,
        }),
      ).thenThrow(Exception('Network error'));

      final result = await model.createVolunteerGroup(event1, 'Test Group', 5);

      expect(result, isNull);
    });

    test('updateAgendaItemSequence handles exception thrown by service',
        () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1', sequence: 1),
      ]);

      when(
        eventService.updateAgendaItem('1', {'sequence': 2}),
      ).thenThrow(Exception('Network error'));

      // Should handle gracefully without crashing
      await model.updateAgendaItemSequence('1', 2);

      expect(model.agendaItems.first.sequence, 1);
    });

    test('deleteAgendaItem handles exception thrown by service', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1'),
      ]);

      when(eventService.deleteAgendaItem({"removeAgendaItemId": '1'}))
          .thenThrow(Exception('Network error'));

      // Should handle gracefully without crashing
      await model.deleteAgendaItem('1');

      // Item should still be there since deletion failed
      expect(model.agendaItems.length, 1);
    });

    test('reorderAgendaItems reorders items correctly', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      // Set up agenda items with sequences (items already have correct sequence)
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1', sequence: 1),
        EventAgendaItem(id: '2', title: 'Item 2', sequence: 2),
      ]);

      // Mock updateAgendaItem - when sequences don't match, updateAgendaItemSequence is called
      // After reorder from [1,2] to [2,1], item '2' needs sequence 1, item '1' needs sequence 2
      when(eventService.updateAgendaItem('2', {'sequence': 1})).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: {
            'updateAgendaItem': {
              'id': '2',
              'title': 'Item 2',
              'sequence': 1,
            },
          },
          options: QueryOptions(
            document: gql(EventQueries().updateAgendaItem()),
          ),
        ),
      );

      when(eventService.updateAgendaItem('1', {'sequence': 2})).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: {
            'updateAgendaItem': {
              'id': '1',
              'title': 'Item 1',
              'sequence': 2,
            },
          },
          options: QueryOptions(
            document: gql(EventQueries().updateAgendaItem()),
          ),
        ),
      );

      // Move item from index 0 to index 2 (oldIndex < newIndex case)
      // This moves '1' from index 0 to after '2', so order becomes ['2', '1']
      await model.reorderAgendaItems(0, 2);

      // Verify items were reordered in the list
      expect(model.agendaItems.length, 2);
      expect(model.agendaItems[0].title, 'Item 2');
      expect(model.agendaItems[1].title, 'Item 1');
    });
  });
}
