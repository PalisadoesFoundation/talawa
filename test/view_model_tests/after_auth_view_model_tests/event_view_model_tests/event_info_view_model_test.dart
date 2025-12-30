// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
  });

  setUpAll(() {
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('Event Info Tests', () {
    test("test initialization", () async {
      final model = EventInfoViewModel();
      final Event event =
          Event(id: "1", isRegisterable: true, isRegistered: false);

      await model.initialize(event);

      expect(model.fabTitle, "Register");
      expect(model.event.id, "1");
    });

    test("Test register for event", () async {
      final model = EventInfoViewModel();
      final Event event1 =
          Event(id: "1", isRegisterable: true, isRegistered: false);
      model.event = event1;

      when(eventService.registerForAnEvent(model.event.id!))
          .thenAnswer((realInvocation) async {
        return QueryResult(
          source: QueryResultSource.network,
          data: {
            'registerForEvent': {'id': model.event.id}
          },
          options: QueryOptions(document: gql('')),
        );
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
      final model = EventInfoViewModel();
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
      final model = EventInfoViewModel();
      final Event event1 = Event(id: "1");
      model.event = event1;
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
      final model = EventInfoViewModel();
      final Event event1 = Event(id: "1");
      model.event = event1;

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
      final model = EventInfoViewModel();
      final Event event1 = Event(id: "1");
      model.event = event1;
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
      final model = EventInfoViewModel();
      final Event event1 = Event(id: "1");
      model.event = event1;
      model.volunteerGroups.clear();
      when(eventService.fetchVolunteerGroupsByEvent("1"))
          .thenThrow(Exception('Failed to fetch volunteer groups'));

      await model.fetchVolunteerGroups('1');

      expect(model.volunteerGroups.length, 0);
    });

    test('createAgendaItem success', () async {
      final model = EventInfoViewModel();
      final Event event1 = Event(id: "1");
      model.event = event1;
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'createAgendaItem': {
            'id': '1',
            'name': 'Test Agenda',
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
      expect(result!.name, 'Test Agenda');
      expect(model.agendaItems.length, 1);
      expect(model.agendaItems.first.name, 'Test Agenda');
    });
    test('deleteAgendaItem success', () async {
      final model = EventInfoViewModel();
      final Event event1 = Event(id: "1");
      model.event = event1;
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', name: 'Item 1'),
        EventAgendaItem(id: '2', name: 'Item 2'),
      ]);

      when(eventService.deleteAgendaItem({"removeAgendaItemId": '1'}))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {
                  'removeAgendaItem': {'id': '1'}
                },
                options: QueryOptions(document: gql('')),
              ));
      await model.deleteAgendaItem('1');

      expect(model.agendaItems.length, 1);
      expect(model.agendaItems.first.id, '2');
    });

    test('updateAgendaItemSequence success', () async {
      final model = EventInfoViewModel();
      final Event event1 = Event(id: "1");
      model.event = event1;
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'updateAgendaItem': {
            '_id': '1',
            'name': 'Updated Item',
            'sequence': 2,
          },
        },
        options: QueryOptions(document: gql(EventQueries().updateAgendaItem())),
      );
      model.agendaItems.clear();
      model.agendaItems.addAll([
        EventAgendaItem(id: '1', name: 'Item 1', sequence: 1),
        EventAgendaItem(id: '2', name: 'Item 2', sequence: 2),
      ]);

      when(
        eventService.updateAgendaItem(
          '1',
          {'sequence': 2},
        ),
      ).thenAnswer((_) async => mockResult);

      await model.updateAgendaItemSequence('1', 2);

      expect(model.agendaItems.first.sequence, 2);
      expect(model.agendaItems.first.name, 'Updated Item');
    });

    test('fetchCategories success', () async {
      final model = EventInfoViewModel();
      final Event event1 = Event(id: "1");
      model.event = event1;
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
  });
}
