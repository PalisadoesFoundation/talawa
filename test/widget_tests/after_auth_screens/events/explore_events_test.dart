// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_calendar.dart';
import 'package:talawa/views/after_auth_screens/events/explore_event_dialogue.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/widgets/custom_drawer.dart';
import 'package:talawa/widgets/event_card.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';
import '../../../helpers/test_locator.dart';

Widget createExploreEventsScreen(MainScreenViewModel model) => MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      key: const Key('Root'),
      home: Scaffold(
        key: MainScreenViewModel.scaffoldKey,
        drawer: CustomDrawer(
          homeModel: model,
        ),
        body: const ExploreEvents(
          key: Key('ExploreEvents'),
        ),
      ),
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: router.generateRoute,
    );

final List<Event> cachedEvents = [
  Event(
    id: "event001",
    title: "Annual Tech Conference",
    description:
        "A conference where tech enthusiasts gather to discuss the latest trends.",
    location: "Tech Park, Silicon Valley",
    recurring: false,
    allDay: true,
    startDate: "2024-09-10",
    endDate: "2024-09-10",
    startTime: "09:00 AM",
    endTime: "05:00 PM",
    isPublic: true,
    isRegistered: false,
    isRegisterable: true,
    creator: User(id: "user123", firstName: "Alice Johnson"),
    organization: OrgInfo(id: userConfig.currentOrg.id, name: "Tech Community"),
    admins: [
      User(id: "admin001", firstName: "Bob Smith"),
      User(id: "admin002", firstName: "Carol Lee"),
    ],
    attendees: [
      Attendee(
        id: "attendee001",
        firstName: "David",
        lastName: "Brown",
        image: "https://example.com/david.jpg",
      ),
      Attendee(
        id: "attendee002",
        firstName: "Eve",
        lastName: "White",
        image: "https://example.com/eve.jpg",
      ),
    ],
  ),
  Event(
    id: "event002",
    title: "Community Cleanup",
    description:
        "Join us for a community-wide effort to clean up our local park.",
    location: "Central Park",
    recurring: true,
    allDay: false,
    startDate: "2024-08-25",
    endDate: "2024-08-25",
    startTime: "08:00 AM",
    endTime: "12:00 PM",
    isPublic: true,
    isRegistered: true,
    isRegisterable: true,
    creator: User(id: "user124", firstName: "John Doe"),
    organization: OrgInfo(id: userConfig.currentOrg.id, name: "Green Earth"),
    admins: [
      User(id: "admin003", firstName: "Sam Green"),
    ],
    attendees: [
      Attendee(
        id: "attendee003",
        firstName: "Paul",
        lastName: "Black",
        image: "https://example.com/paul.jpg",
      ),
    ],
  ),
  Event(
    id: "event003",
    title: "Coding Workshop",
    description: "A hands-on workshop to improve coding skills.",
    location: "TechHub, Downtown",
    recurring: false,
    allDay: false,
    startDate: "2024-09-15",
    endDate: "2024-09-15",
    startTime: "10:00 AM",
    endTime: "04:00 PM",
    isPublic: false,
    isRegistered: false,
    isRegisterable: false,
    creator: User(id: "user125", firstName: "Micheal Young"),
    organization: OrgInfo(id: userConfig.currentOrg.id, name: "Code Masters"),
    admins: [
      User(id: "admin004", firstName: "Sara Blue"),
    ],
    attendees: [],
  ),
  Event(
    id: "event004",
    title: "Startup Pitch Day",
    description: "Pitch your startup ideas to investors and get feedback.",
    location: "Innovation Hub",
    recurring: false,
    allDay: false,
    startDate: "2024-10-05",
    endDate: "2024-10-05",
    startTime: "11:00 AM",
    endTime: "03:00 PM",
    isPublic: false,
    isRegistered: true,
    isRegisterable: true,
    creator: User(id: "user126", firstName: "Emma Davis"),
    organization:
        OrgInfo(id: userConfig.currentOrg.id, name: "Startup Network"),
    admins: [
      User(id: "admin005", firstName: "Jake Wilson"),
      User(id: "admin006", firstName: "Nina Harris"),
    ],
    attendees: [
      Attendee(
        id: "attendee004",
        firstName: "Chris",
        lastName: "Miller",
        image: "https://example.com/chris.jpg",
      ),
    ],
  ),
];

void main() {
  SizeConfig().test();
  setUp(() {
    registerServices();
    registerViewModels();
    locator.unregister<EventService>();
    locator.registerSingleton<EventService>(EventService());
    final eventBox = Hive.box<Event>(HiveKeys.eventFeedKey);
    eventBox.addAll(cachedEvents);
  });
  tearDown(() {
    unregisterViewModels();
  });
  group("Test Explore Events Screen Widget:", () {
    testWidgets("Testing if tapping on calendar works", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Filter by Date'));
        await tester.pump();

        expect(find.byType(ExploreEventDialog), findsOneWidget);
      });
    });
    testWidgets("Testing if tapping on calendar works", (tester) async {
      await mockNetworkImages(() async {
        locator.unregister<EventService>();

        final StreamController<List<Event>> streamController =
            StreamController();
        final Stream<List<Event>> stream =
            streamController.stream.asBroadcastStream();

        final service = MockEventService();
        when(service.eventStream).thenAnswer((invocation) => stream);
        locator.registerSingleton<EventService>(service);

        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        expect(
          find.text("Looks like there aren't any events."),
          findsOneWidget,
        );
      });
    });
    testWidgets("Testing if drawer opens up", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pump();
        // find by icon menu
        expect(find.byIcon(Icons.menu), findsOneWidget);
        // tap on icon menu
        await tester.tap(find.byIcon(Icons.menu));
        await tester.pump();

        // expect the drawer to be open
        expect(find.byType(CustomDrawer), findsOneWidget);
      });
    });
    testWidgets("Testing if showSearch works", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.search), findsOneWidget);

        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.clear), findsOneWidget);
        expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      });
    });
    testWidgets("Testing if refresh works", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        await tester.drag(
          find.byKey(const Key('ExploreEvents')),
          const Offset(0, 500),
        );
        await tester.pumpAndSettle();

        verify(locator<ExploreEventsViewModel>().refreshEvents()).called(2);
      });
    });
    testWidgets("Testing if tapping on add icon and EventCard works",
        (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();

        verify(locator<NavigationService>().pushScreen("/createEventPage"))
            .called(1);

        await tester.tap(find.byType(EventCard).first);
        await tester.pumpAndSettle();

        verify(
          locator<NavigationService>()
              .pushScreen("/eventInfo", arguments: anyNamed('arguments')),
        ).called(1);
      });
    });
    testWidgets("Testing if drop down button works", (tester) async {
      await mockNetworkImages(() async {
        locator.unregister<ExploreEventsViewModel>();

        final model = ExploreEventsViewModel();
        locator.registerSingleton(model);

        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        await tester.tap(find.bySemanticsLabel('Filters'));
        await tester.pumpAndSettle();
        await tester.pump();
        await tester.tap(find.byKey(const Key('Public Events')));
        await tester.pumpAndSettle();
        expect(model.chosenValue, 'Public Events');
      });
    });
    testWidgets("Testing if tapping on Calendar button works", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        expect(find.byType(EventCalendar), findsNothing);

        await tester.tap(
          find.byIcon(
            Icons.calendar_month,
          ),
        );
        await tester.pumpAndSettle();
      });
    });
  });
}
