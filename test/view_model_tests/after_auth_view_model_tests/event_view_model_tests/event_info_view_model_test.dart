// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
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
  });
}
