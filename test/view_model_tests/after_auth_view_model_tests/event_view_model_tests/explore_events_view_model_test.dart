// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCallbackFunction extends Mock {
  void call();
}

class _MockStreamSubscription<T> extends Mock
    implements StreamSubscription<T> {}

class _MockStream<T> extends Mock implements Stream<T> {
  @override
  StreamSubscription<T> listen(
    void Function(T event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      _MockStreamSubscription<T>();
}

class _MockNavigationService extends Mock implements NavigationService {
  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void pushDialog(Widget dialog) {
    showDialog<CustomAlertDialog>(
      context: navigatorKey.currentContext!,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();

  late Event newEvent;
  setUp(() async {
    registerServices();
    await locator.unregister<NavigationService>();
    locator.registerSingleton<NavigationService>(_MockNavigationService());
    locator<SizeConfig>().test();
    newEvent = Event(
      id: "1",
      title: "fake_event_title",
      description: "fake_event_desc",
      attendees: "20",
      location: "fake_event_loc",
      recurring: false,
      startDate: DateTime.now().toString().substring(0, 10),
      endDate: DateTime.now().toString().substring(0, 10),
      startTime: "1900",
      endTime: "2000",
      recurrence: "none",
      creator: User(id: 'Test Id'),
      isPublic: true,
      isRegistered: true,
      isRegisterable: true,
      organization: OrgInfo(id: 'XYZ'),
    );
  });

  tearDown(() {
    unregisterServices();
  });

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

    test(
        "Test checkIfExistsAndAddNewEvent function when start time is not parsable",
        () async {
      final model = ExploreEventsViewModel();
      newEvent.startTime = "09:00:00";
      newEvent.organization!.id = 'Test Id 1';
      await model.checkIfExistsAndAddNewEvent(newEvent);
      expect(model.events, isEmpty);
      expect(model.events.length, 0);
      // expect(model.events.first.id, '1');
    });
    testWidgets(
        "Test function of CustomAlertDialog when deleteEvent function is executed",
        (tester) async {
      final model = ExploreEventsViewModel();
      when(model.eventService.deleteEvent(newEvent.id!))
          .thenAnswer((realInvocation) async => 1);

      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(body: Container()),
        ),
      );
      await tester.pumpAndSettle();
      await model.checkIfExistsAndAddNewEvent(newEvent);
      await model.deleteEvent(eventId: newEvent.id!);
      await tester.pumpAndSettle();
      final customFinder = find.byType(CustomAlertDialog);
      expect(customFinder, findsOneWidget);

      final successFinder = find.byKey(const Key('Delete'));
      await tester.tap(successFinder);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(model.events, isEmpty);
    });

    test("Test chooseValueFromDropdown function", () async {
      final model = ExploreEventsViewModel();
      await model.initialise();

      await model.choseValueFromDropdown('All Events');
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
    test("Test get event service", () async {
      final model = ExploreEventsViewModel();
      expect(model.eventService, isA<EventService>());
    });
    test(
        "Test chooseValueFromDropdown when value is Registered Events and _bufferEvents is not empty",
        () async {
      final model = ExploreEventsViewModel();
      when(userConfig.currentOrg)
          .thenAnswer((realInvocation) => OrgInfo(id: '1'));
      when(userConfig.currentOrgInfoStream)
          .thenAnswer((realInvocation) => _MockStream<OrgInfo>());
      when(eventService.eventStream)
          .thenAnswer((realInvocation) => _MockStream<Event>());

      await model.checkIfExistsAndAddNewEvent(newEvent);
      await model.initialise();
      await model.choseValueFromDropdown('Registered Events');
      expect(model.emptyListMessage, "No registered events are present");
    });
  });
}
