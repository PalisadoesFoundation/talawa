// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/database_mutation_functions.dart';
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
    startAt: "2024-09-10T09:00:00.000Z",
    endAt: "2024-09-10T17:00:00.000Z",
    creator: User(id: "user123", firstName: "Alice Johnson"),
    organization: OrgInfo(id: userConfig.currentOrg.id, name: "Tech Community"),
  ),
  Event(
    id: "event002",
    name: "Community Cleanup",
    description:
        "Join us for a community-wide effort to clean up our local park.",
    startAt: "2024-08-25T08:00:00.000Z",
    endAt: "2024-08-25T12:00:00.000Z",
    creator: User(id: "user124", firstName: "John Doe"),
    organization: OrgInfo(id: userConfig.currentOrg.id, name: "Green Earth"),
  ),
  Event(
    id: "event003",
    name: "Coding Workshop",
    description: "A hands-on workshop to improve coding skills.",
    startAt: "2024-09-15T10:00:00.000Z",
    endAt: "2024-09-15T16:00:00.000Z",
    creator: User(id: "user125", firstName: "Micheal Young"),
    organization: OrgInfo(id: userConfig.currentOrg.id, name: "Code Masters"),
  ),
  Event(
    id: "event004",
    name: "Startup Pitch Day",
    description: "Pitch your startup ideas to investors and get feedback.",
    startAt: "2024-10-05T11:00:00.000Z",
    endAt: "2024-10-05T15:00:00.000Z",
    creator: User(id: "user126", firstName: "Emma Davis"),
    organization:
        OrgInfo(id: userConfig.currentOrg.id, name: "Startup Network"),
  ),
];

void main() {
  SizeConfig().test();

  setUpAll(() {
    registerServices();
    registerViewModels();

    // Mock the GraphQL query for eventsByOrganizationId to prevent API calls
    final databaseFunctions = locator<DataBaseMutationFunctions>();
    when(databaseFunctions.gqlAuthQuery('eventsByOrganizationId'))
        .thenAnswer((_) async => QueryResult(
              options: QueryOptions(document: gql('')),
              data: {
                'eventsByOrganizationId': cachedEvents
                    .map((event) => {
                          'id': event.id,
                          'name': event.name,
                          'description': event.description,
                          'startAt': event.startAt,
                          'endAt': event.endAt,
                          'organization': {
                            'id': event.organization?.id,
                            'name': event.organization?.name,
                          },
                          'creator': {
                            'id': event.creator?.id,
                            'name': event.creator?.firstName,
                          },
                          'updater': {
                            'id': event.creator?.id,
                            'name': event.creator?.firstName,
                          },
                          'attachments': [],
                        },)
                    .toList(),
              },
              source: QueryResultSource.network,
            ),);

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
