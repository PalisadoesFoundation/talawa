import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/comment_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';
import '../../../helpers/test_locator.dart';

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
  late Event newEvent;

  setUpAll(() async {
    testSetupLocator();
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();
    registerServices();
    await locator.unregister<NavigationService>();
    locator.registerSingleton<NavigationService>(_MockNavigationService());
    locator<SizeConfig>().test();
    newEvent = Event(
      id: "1",
      name: "fake_event_title",
      description: "fake_event_desc",
      attendees: [Attendee(id: 'Test Id')],
      location: "fake_event_loc",
      recurring: false,
      creator: User(id: 'xzy1'),
      isPublic: true,
      isRegistered: true,
      isRegisterable: true,
      organization: OrgInfo(id: 'XYZ'),
    );
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('Explore Event Tests', () {
    test("Test checkIfExistsAndAddNewEvent function", () async {
      final model = ExploreEventsViewModel();
      await model.initialise();
      await model.checkIfExistsAndAddNewEvents([newEvent]);
      expect(model.events.isNotEmpty, true);
      expect(model.events.first.id, newEvent.id);
      expect(model.uniqueEventIds.isNotEmpty, true);
      expect(model.bufferEvents.isNotEmpty, true);
    });

    test(
        "Test checkIfExistsAndAddNewEvent function when start time is not parsable",
        () async {
      final model = ExploreEventsViewModel();

      newEvent.organization!.id = 'Test Id 1';
      await model.checkIfExistsAndAddNewEvents([newEvent]);
      expect(model.events, isEmpty);
      expect(model.events.length, 0);
    });

    test("Test chooseValueFromDropdown function", () async {
      final model = ExploreEventsViewModel();
      await model.initialise();

      await model.choseValueFromDropdown('All Events');
      expect(model.emptyListMessage, "Looks like there aren't any events.");

      await model.choseValueFromDropdown("My Events");
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
    test("Test get event service", () {
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
          .thenAnswer((realInvocation) => _MockStream<List<Event>>());

      await model.checkIfExistsAndAddNewEvents([newEvent]);
      await model.initialise();
      await model.choseValueFromDropdown('Registered Events');
      expect(model.emptyListMessage, "No registered events are present");
    });
    test(
        "Test chooseValueFromDropdown when value is Registered Events and _bufferEvents is not empty",
        () {
      final model = ExploreEventsViewModel();
      final List<Event> userEvents = model.userEvents;
      expect(userEvents, []);
    });
    testWidgets(
        "Test function of CustomAlertDialog when deleteEvent function is executed",
        (tester) async {
      final model = ExploreEventsViewModel();
      when(model.eventService.deleteEvent(newEvent.id!)).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(
            document: gql(CommentQueries().getPostsComments()),
          ),
          data: {
            'post': {'comments': []},
          },
          source: QueryResultSource.network,
        ),
      );

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
      await model.checkIfExistsAndAddNewEvents([newEvent]);
      await model.deleteEvent(eventId: newEvent.id!);
      await tester.pumpAndSettle();
      final customFinder = find.byType(CustomAlertDialog);
      expect(customFinder, findsOneWidget);

      final successFinder = find.byKey(const Key('Delete'));
      await tester.tap(successFinder);
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(CustomProgressDialog), findsOneWidget);
    });

    test('Test onScroll function triggers pagination', () async {
      when(eventService.hasMoreEvents).thenReturn(true);
      when(eventService.nextPage()).thenAnswer((_) async {});
      when(eventService.eventStream).thenAnswer((_) => Stream.value([]));

      final model = ExploreEventsViewModel();
      await model.initialise();

      // Mock scroll controller position
      final mockScrollController = MockScrollController();
      final mockScrollPosition = MockScrollPosition();
      when(mockScrollController.hasClients).thenReturn(true);
      when(mockScrollController.position).thenReturn(mockScrollPosition);
      when(mockScrollPosition.pixels).thenReturn(500.0);
      when(mockScrollPosition.maxScrollExtent)
          .thenReturn(520.0); // Within 50px threshold

      model.scrollController = mockScrollController;

      // Call the public onScroll function
      model.onScroll();

      // Wait for async operations
      await Future.delayed(Duration.zero);

      // Verify nextPage was called
      verify(eventService.nextPage()).called(1);
    });
    test('Test onScroll function has no clients', () async {
      when(eventService.hasMoreEvents).thenReturn(true);
      when(eventService.nextPage()).thenAnswer((_) async {});
      when(eventService.eventStream).thenAnswer((_) => Stream.value([]));

      final model = ExploreEventsViewModel();
      await model.initialise();

      // Mock scroll controller position
      final mockScrollController = MockScrollController();
      when(mockScrollController.hasClients).thenReturn(false);

      model.scrollController = mockScrollController;

      // Call the public onScroll function
      model.onScroll();

      // Wait for async operations
      await Future.delayed(Duration.zero);

      // Verify nextPage was called
      verifyNever(eventService.nextPage());
    });
    test('Test fetchNextEvents sets pagination state and calls nextPage',
        () async {
      final model = ExploreEventsViewModel();

      when(eventService.hasMoreEvents).thenReturn(true);
      when(eventService.nextPage()).thenAnswer((_) async {});
      when(eventService.eventStream).thenAnswer((_) => Stream.value([]));

      await model.initialise();

      // Verify initial state
      expect(model.isPaginating, isFalse);
      expect(model.state, ViewState.idle);

      // Call fetchNextEvents
      await model.fetchNextEvents();

      // Verify final state
      expect(model.isPaginating, isFalse);
      expect(model.state, ViewState.idle);

      // Verify nextPage was called
      verify(eventService.nextPage()).called(1);
    });
    test("Test refresh events function", () async {
      final model = ExploreEventsViewModel();
      await model.refreshEvents();
      expect(model.state, ViewState.idle);
      expect(model.events.isEmpty, true);
      expect(model.userEvents.isEmpty, true);
      expect(model.uniqueEventIds.isEmpty, true);
      expect(model.bufferEvents.isEmpty, true);
      verify(eventService.refreshFeed()).called(1);
    });
  });
}
