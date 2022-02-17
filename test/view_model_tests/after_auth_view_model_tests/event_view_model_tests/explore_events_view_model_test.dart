import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCallbackFunction extends Mock {
  call();
}

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

  final Event newEvent = Event(
    id: "1",
    title: "fake_event_title",
    description: "fake_event_desc",
    attendees: "20",
    location: "fake_event_loc",
    recurring: false,
    startDate: DateTime.now().toString().substring(0, 10),
    endDate: DateTime.now().toString().substring(0, 10),
    startTime: DateFormat('hh:mm:ss').format(DateTime.now()).toString(),
    endTime: DateFormat('hh:mm:ss')
        .format(DateTime.now().add(const Duration(hours: 1)))
        .toString(),
    recurrence: "none",
    isPublic: true,
    isRegistered: true,
    isRegisterable: true,
    organization: userConfig.currentOrg,
  );

  group('Explore Event Tests', () {
    test("Test fetchNewEvents and refreshEvents", () async {
      final model = ExploreEventsViewModel();
      await model.initialise();
      when(eventService.getEvents()).thenAnswer((realInvocation) async {});
      await model.fetchNewEvents();
      verify(eventService.getEvents());

      model.refreshEvents();
      verify(eventService.getEvents());
    });

    test("Test checkIfExistsAndAddNewEvent function", () async {
      final model = ExploreEventsViewModel();
      await model.initialise();
      await model.checkIfExistsAndAddNewEvent(newEvent);
      expect(model.events.isNotEmpty, true);
      expect(model.events.first.id, newEvent.id);
    });

    test("Test deleteEvent function", () async {
      final model = ExploreEventsViewModel();
      await model.initialise();
      await model.checkIfExistsAndAddNewEvent(newEvent);
      expect(model.events.first.id, newEvent.id);
      await model.deleteEvent(eventId: newEvent.id!);
      expect(model.events.contains(newEvent), false);
    });

    test("", () async {
      final model = ExploreEventsViewModel();
      await model.initialise();

      await model.choseValueFromDropdown('All events');
      expect(model.emptyListMessage, "Looks like there aren't any events.");

      await model.choseValueFromDropdown("Created Events");
      bool allCreated = true;
      final userConfig = getAndRegisterUserConfig();
      for (int i = 0; i < model.events.length; i++) {
        if (model.events[i].creator?.id != userConfig.currentUser.id) {
          allCreated = false;
        }
      }
      expect(allCreated, true);
      expect(model.emptyListMessage, "You have not created any event.");

      await model.choseValueFromDropdown("Registered Events");

      allCreated = true;
      bool allRegistered = true;
      for (int i = 0; i < model.events.length; i++) {
        if (model.events[i].creator?.id != userConfig.currentUser.id) {
          allCreated = false;
        }
        if (model.events[i].isRegistered == false) {
          allRegistered = false;
        }
      }
      expect(allCreated, true);
      expect(allRegistered, true);
      expect(model.emptyListMessage, "No registered events are present");

      await model.choseValueFromDropdown('Public Events');
      bool allPublic = true;
      for (int i = 0; i < model.events.length; i++) {
        if (model.events[i].isPublic == false) {
          allPublic = false;
        }
      }
      expect(allPublic, true);
      expect(model.emptyListMessage, "There aren't any public events.");

      await model.choseValueFromDropdown('Private Events');
      bool allPrivate = true;
      for (int i = 0; i < model.events.length; i++) {
        if (model.events[i].isPublic == true) {
          allPrivate = false;
        }
      }
      expect(allPrivate, true);
      expect(model.emptyListMessage, "There aren't any private events.");

      //run default block
      await model.choseValueFromDropdown("Events");
    });
  });
}
