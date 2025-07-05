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
import 'package:talawa/models/organization/org_info.dart';
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

    test("test initialization", () {
      final Event event = Event(id: "1");
      final ExploreEventsViewModel exploreEventsViewModel =
          ExploreEventsViewModel();
      model.initialize(
        args: {
          "event": event,
          "exploreEventViewModel": exploreEventsViewModel,
        },
      );
      expect(model.fabTitle, "Register");
    });

    test("Test register for event", () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      when(eventService.registerForAnEvent(model.event.id!))
          .thenAnswer((realInvocation) async {
        return "Event Registered";
      });
      await model.registerForEvent();

      verify(navigationService.pop());
      verify(eventService.registerForAnEvent(model.event.id!));
      expect(model.fabTitle, "Register");
    });

    test("Test getFabTitle function", () {
      final Event event1 = Event(id: "1");
      model.event = event1;
      expect(model.getFabTitle(), "Register");

      final Event event2 = Event(id: "2");
      model.event = event2;
      expect(model.getFabTitle(), "Register");

      final Event event3 = Event(id: "3");
      model.event = event3;
      expect(model.getFabTitle(), "Register");
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
      // Mock userConfig.currentOrg
      final userConfig = getAndRegisterUserConfig();
      when(userConfig.currentOrg)
          .thenReturn(OrgInfo(id: 'XYZ', name: 'Test Org'));

      final mockResponse = {
        'createAgendaItem': {
          '_id': '1',
          'title': 'Test Agenda',
          'description': 'desc',
          'duration': '1h',
          'sequence': 1,
          'createdAt': '2024-01-01T00:00:00Z',
          'createdBy': {
            'user': {
              'id': 'user1',
              'name': 'John Doe',
              'emailAddress': 'john@example.com',
              'avatarURL': null,
              'organizationsWhereMember': {'edges': []},
            },
          },
          'relatedEvent': {
            'id': model.event.id,
            'title': 'Test Event',
            'description': 'Test Event Description',
            'creator': {'id': 'user1', 'name': 'John Doe'},
            'organization': {'id': 'XYZ', 'name': 'Test Org'},
          },
          'organization': {
            'id': 'XYZ',
            'name': 'Test Org',
            'avatarURL': null,
            'description': 'Test Organization',
            'userRegistrationRequired': true,
            'members': {'edges': []},
          },
          'categories': [
            {
              '_id': 'cat1',
              'name': 'Category 1',
              'description': 'Test Category',
            }
          ],
          'attachments': [],
          'urls': [],
        },
      };

      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: mockResponse,
        options: QueryOptions(document: gql(EventQueries().createAgendaItem())),
      );

      // No 'input' wrapper in the expected input
      final Map<String, dynamic> expectedInput = {
        'title': 'Test Agenda',
        'sequence': model.agendaItems.length + 1,
        'description': 'desc',
        'duration': '1h',
        'organizationId': 'XYZ',
        'attachments': [],
        'relatedEventId': model.event.id,
        'urls': [],
        'categories': ['cat1'],
      };

      when(eventService.createAgendaItem(expectedInput))
          .thenAnswer((_) async => mockResult);

      final result = await model.createAgendaItem(
        title: 'Test Agenda',
        duration: '1h',
        attachments: [],
        categories: ['cat1'],
        description: 'desc',
        urls: [],
      );

      expect(result, isNotNull);
      expect(result!.title, 'Test Agenda');
      expect(result.id, '1');
      expect(result.createdBy?.id, 'user1');
      expect(result.organization?.id, 'XYZ');
      expect(result.relatedEvent?.id, model.event.id);
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
          .thenAnswer((_) async => true);

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
    test('reorderAgendaItems - moving item forward', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      // Setup agenda items with specific sequences that will need updating
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1', sequence: 1),
        EventAgendaItem(id: '2', title: 'Item 2', sequence: 2),
        EventAgendaItem(id: '3', title: 'Item 3', sequence: 3),
      ]);

      // Mock the updateAgendaItemSequence calls
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'updateAgendaItem': {
            '_id': '1',
            'title': 'Item 1',
            'sequence': 3,
          },
        },
        options: QueryOptions(document: gql(EventQueries().updateAgendaItem())),
      );

      when(eventService.updateAgendaItem('2', {'sequence': 1}))
          .thenAnswer((_) async => mockResult);
      when(eventService.updateAgendaItem('3', {'sequence': 2}))
          .thenAnswer((_) async => mockResult);
      when(eventService.updateAgendaItem('1', {'sequence': 3}))
          .thenAnswer((_) async => mockResult);

      // Move first item to last position (oldIndex: 0, newIndex: 3)
      await model.reorderAgendaItems(0, 3);

      // Verify the correct update methods were called
      verify(eventService.updateAgendaItem('2', {'sequence': 1}));
      verify(eventService.updateAgendaItem('3', {'sequence': 2}));
      verify(eventService.updateAgendaItem('1', {'sequence': 3}));
    });

    test('reorderAgendaItems - moving item backward', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      // Setup agenda items with specific sequences that will need updating
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1', sequence: 1),
        EventAgendaItem(id: '2', title: 'Item 2', sequence: 2),
        EventAgendaItem(id: '3', title: 'Item 3', sequence: 3),
      ]);

      // Mock the updateAgendaItemSequence calls
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'updateAgendaItem': {
            '_id': '3',
            'title': 'Item 3',
            'sequence': 1,
          },
        },
        options: QueryOptions(document: gql(EventQueries().updateAgendaItem())),
      );

      when(eventService.updateAgendaItem('3', {'sequence': 1}))
          .thenAnswer((_) async => mockResult);
      when(eventService.updateAgendaItem('1', {'sequence': 2}))
          .thenAnswer((_) async => mockResult);
      when(eventService.updateAgendaItem('2', {'sequence': 3}))
          .thenAnswer((_) async => mockResult);

      // Move last item to first position (oldIndex: 2, newIndex: 0)
      await model.reorderAgendaItems(2, 0);

      // Verify the correct update methods were called
      verify(eventService.updateAgendaItem('3', {'sequence': 1}));
      verify(eventService.updateAgendaItem('1', {'sequence': 2}));
      verify(eventService.updateAgendaItem('2', {'sequence': 3}));
    });

    test('reorderAgendaItems - no sequence update needed', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      // Setup agenda items where after reordering, the sequences will match expected values
      // This means the for-loop runs but the if condition is never true
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', title: 'Item 1', sequence: 2),
        EventAgendaItem(id: '2', title: 'Item 2', sequence: 1),
        EventAgendaItem(id: '3', title: 'Item 3', sequence: 3),
      ]);

      // Move second item to first position
      // After this operation:
      // - Item 2 will be at index 0 with sequence 1 (1 == 0 + 1, so no update needed)
      // - Item 1 will be at index 1 with sequence 2 (2 == 1 + 1, so no update needed)
      // - Item 3 will be at index 2 with sequence 3 (3 == 2 + 1, so no update needed)
      await model.reorderAgendaItems(1, 0);

      // Verify the order changed but no sequence updates were called
      expect(model.agendaItems[0].id, '2');
      expect(model.agendaItems[1].id, '1');
      expect(model.agendaItems[2].id, '3');

      // The for-loop runs but the if condition is never true
      // This covers the case where item.sequence == i + 1 for all items
      verifyNever(eventService.updateAgendaItem('2', {'sequence': 1}));
      verifyNever(eventService.updateAgendaItem('1', {'sequence': 2}));
      verifyNever(eventService.updateAgendaItem('3', {'sequence': 3}));
    });

    test('createAgendaItem error handling', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      when(
        eventService.createAgendaItem({
          'title': 'Test Agenda',
          'description': 'Test Description',
          'duration': '1h',
          'eventId': '1',
        }),
      ).thenThrow(Exception('Create agenda item failed'));

      final result = await model.createAgendaItem(
        title: 'Test Agenda',
        description: 'Test Description',
        duration: '1h',
      );

      expect(result, isNull);
    });

    test('deleteAgendaItem error handling', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      model.agendaItems.clear();
      model.agendaItems.add(EventAgendaItem(id: '1', title: 'Item 1'));

      when(eventService.deleteAgendaItem({"removeAgendaItemId": '1'}))
          .thenThrow(Exception('Delete failed'));

      await model.deleteAgendaItem('1');

      // Item should still be in the list since deletion failed
      expect(model.agendaItems.length, 1);
    });

    test('updateAgendaItemSequence error handling', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();
      model.agendaItems.clear();
      model.agendaItems
          .add(EventAgendaItem(id: '1', title: 'Item 1', sequence: 1));

      when(eventService.updateAgendaItem('1', {'sequence': 2}))
          .thenThrow(Exception('Update failed'));

      await model.updateAgendaItemSequence('1', 2);

      // Sequence should remain unchanged since update failed
      expect(model.agendaItems.first.sequence, 1);
    });

    test('fetchAgendaItems error handling', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      // Pre-populate with some items to verify they remain unchanged on error
      model.agendaItems.clear();
      model.agendaItems
          .add(EventAgendaItem(id: 'existing', title: 'Existing Item'));

      when(eventService.fetchAgendaItems('1'))
          .thenThrow(Exception('Fetch failed'));

      await model.fetchAgendaItems();

      // agendaItems should remain unchanged since fetch failed
      expect(model.agendaItems.length, 1);
      expect(model.agendaItems.first.id, 'existing');
    });

    test('fetchCategories error handling', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      // Pre-populate with some categories to verify they remain unchanged on error
      model.categories.clear();
      model.categories
          .add(AgendaCategory(id: 'existing', name: 'Existing Category'));

      when(eventService.fetchAgendaCategories("XYZ"))
          .thenThrow(Exception('Fetch categories failed'));

      await model.fetchCategories();

      // categories should remain unchanged since fetch failed
      expect(model.categories.length, 1);
      expect(model.categories.first.id, 'existing');
    });

    test('setSelectedCategories', () {
      final categories = [
        AgendaCategory(id: '1', name: 'Category 1'),
        AgendaCategory(id: '2', name: 'Category 2'),
      ];

      model.setSelectedCategories(categories);

      expect(model.selectedCategories.length, 2);
      expect(model.selectedCategories[0].id, '1');
      expect(model.selectedCategories[1].id, '2');
    });

    test('createVolunteerGroup error handling', () async {
      final Event event1 = Event(id: "1");
      model.event = event1;

      final eventService = getAndRegisterEventService();

      when(
        eventService.createVolunteerGroup({
          'eventId': '1',
          'name': 'Test Group',
          'volunteersRequired': 5,
        }),
      ).thenThrow(Exception('Create volunteer group failed'));

      final result = await model.createVolunteerGroup(
        event1,
        'Test Group',
        5,
      );

      expect(result, isNull);
    });
  });
}
