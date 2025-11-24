// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_info_page.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/event_card.dart';
import 'package:talawa/widgets/event_search_delegate.dart';

import '../../helpers/test_helpers.dart';

Widget createEventSearch() {
  return MaterialApp(
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    navigatorKey: locator<NavigationService>().navigatorKey,
    onGenerateRoute: router.generateRoute,
    home: Scaffold(
      body: BaseView<ExploreEventsViewModel>(
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: EventSearch(
                  eventList: model.events,
                  exploreEventsViewModel: model,
                ),
              );
            },
            icon: const Icon(Icons.search),
          );
        },
      ),
    ),
  );
}

final List<Event> cachedEvents = [
  Event(
    id: "event001",
    name: "Annual Tech Conference",
    description:
        "A conference where tech enthusiasts gather to discuss the latest trends.",
    location: "Tech Park, Silicon Valley",
    recurring: false,
    allDay: true,
    isPublic: true,
    isRegistered: false,
    isRegisterable: true,
    creator: User(id: "user123", name: "Alice Johnson"),
    organization: OrgInfo(id: userConfig.currentOrg.id, name: "Tech Community"),
    admins: [
      User(id: "admin001", name: "Bob Smith"),
      User(id: "admin002", name: "Carol Lee"),
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
    name: "Community Cleanup",
    description:
        "Join us for a community-wide effort to clean up our local park.",
    location: "Central Park",
    recurring: true,
    allDay: false,
    isPublic: true,
    isRegistered: true,
    isRegisterable: true,
    creator: User(id: "user124", name: "John Doe"),
    organization: OrgInfo(id: userConfig.currentOrg.id, name: "Green Earth"),
    admins: [
      User(id: "admin003", name: "Sam Green"),
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
    name: "Coding Workshop",
    description: "A hands-on workshop to improve coding skills.",
    location: "TechHub, Downtown",
    recurring: false,
    allDay: false,
    isPublic: false,
    isRegistered: false,
    isRegisterable: false,
    creator: User(id: "user125", name: "Micheal Young"),
    organization: OrgInfo(id: userConfig.currentOrg.id, name: "Code Masters"),
    admins: [
      User(id: "admin004", name: "Sara Blue"),
    ],
    attendees: [],
  ),
  Event(
    id: "event004",
    name: "Startup Pitch Day",
    description: "Pitch your startup ideas to investors and get feedback.",
    location: "Innovation Hub",
    recurring: false,
    allDay: false,
    isPublic: false,
    isRegistered: true,
    isRegisterable: true,
    creator: User(id: "user126", name: "Emma Davis"),
    organization:
        OrgInfo(id: userConfig.currentOrg.id, name: "Startup Network"),
    admins: [
      User(id: "admin005", name: "Jake Wilson"),
      User(id: "admin006", name: "Nina Harris"),
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

  setUpAll(() {
    registerServices();
    registerViewModels();
    locator.unregister<EventService>();
    locator.registerSingleton<EventService>(EventService());
    final eventsBox = Hive.box<Event>(HiveKeys.eventFeedKey);
    eventsBox.addAll(cachedEvents);
  });

  tearDownAll(() {
    final eventsBox = Hive.box<Event>(HiveKeys.eventFeedKey);
    eventsBox.clear();
    unregisterViewModels();
    unregisterServices();
  });

  group('Test for EventSearch Delegate', () {
    testWidgets('Check if EventSearch shows up', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createEventSearch());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.arrow_back), findsOneWidget);
        expect(find.byIcon(Icons.clear), findsOneWidget);
        expect(find.byType(TextField), findsOneWidget);
        expect(find.byType(EventCard), findsNWidgets(4));
      });
    });
    testWidgets('Check if back button works fine', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createEventSearch());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        final x = find.descendant(
          of: find.byType(AppBar),
          matching: find.byType(IconButton),
        );
        await tester.tap(x.first);
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.arrow_back), findsNothing);
      });
    });

    testWidgets('Check if typing in textfield works', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createEventSearch());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        final textfield = find.byType(TextField);
        await tester.enterText(textfield, 'Coding');
        await tester.pumpAndSettle();

        expect(find.byType(EventCard), findsOneWidget);

        await tester.enterText(textfield, 'teste');
        await tester.pumpAndSettle();

        expect(find.byType(EventCard), findsNothing);
      });
    });

    testWidgets('Check if buildResult works', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createEventSearch());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        final textfield = find.byType(TextField);
        await tester.enterText(textfield, 'Coding');
        await tester.pumpAndSettle();

        await tester.showKeyboard(textfield);
        await tester.pump();

        await tester.testTextInput.receiveAction(TextInputAction.send);
        await tester.pump();

        expect(find.byType(EventCard), findsOneWidget);

        await tester.enterText(textfield, 'teste');
        await tester.pumpAndSettle();

        expect(find.byType(EventCard), findsNothing);
      });
    });
    testWidgets('Check if clear button works fine', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(createEventSearch());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        final x = find.descendant(
          of: find.byType(AppBar),
          matching: find.byType(IconButton),
        );

        final textfield = find.byType(TextField);
        await tester.enterText(textfield, 'test');
        await tester.pumpAndSettle();

        await tester.tap(x.last);
        await tester.pumpAndSettle();
        final textWidget = tester.firstWidget(textfield);
        expect((textWidget as TextField).controller!.text, '');

        await tester.tap(x.last);
        await tester.pumpAndSettle();
        expect(find.byIcon(Icons.clear), findsNothing);
      });
    });

    testWidgets('Check if tapping on event card works', (tester) async {
      mockNetworkImagesFor(() async {
        locator.unregister<NavigationService>();
        locator.registerSingleton(NavigationService());

        await tester.pumpWidget(createEventSearch());
        await tester.pump();
        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        final textfield = find.byType(TextField);
        await tester.enterText(textfield, 'Coding');
        await tester.pumpAndSettle();

        final eventCardFinder = find.byType(EventCard);
        await tester.tap(eventCardFinder);
        await tester.pumpAndSettle();

        expect(find.byType(EventInfoPage), findsOneWidget);
      });
    });
  });
}
