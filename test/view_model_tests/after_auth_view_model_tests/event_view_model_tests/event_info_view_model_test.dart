// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
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

    test("test initialization", () {
      final Event event =
          Event(id: "1", isRegisterable: true, isRegistered: false);
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
  });
}
