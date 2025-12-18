// ignore_for_file: talawa_api_doc, unused_element
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/volunteer_groups_screen.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Event getTestEvent({
  bool isPublic = false,
  bool viewOnMap = true,
  bool asAdmin = false,
}) {
  return Event(
    id: "1",
    title: "test_event",
    creator: User(
      id: asAdmin ? "xzy1" : "acb1",
      firstName: "ravidi",
      lastName: "shaikh",
    ),
    isPublic: isPublic,
    startDate: "00/00/0000",
    endDate: "12/12/9999",
    startTime: "00:00",
    endTime: "24:00",
    location: "iitbhu, varanasi",
    description: "test_event_description",
    admins: [
      User(
        firstName: "ravidi_admin_one",
        lastName: "shaikh_admin_one",
      ),
      User(
        firstName: "ravidi_admin_two",
        lastName: "shaikh_admin_two",
      ),
    ],
    attendees: [
      Attendee(
        id: "1",
        firstName: "Test",
        lastName: "User",
      ),
    ],
    isRegisterable: true,
  );
}

Widget volunteerGroupsScreen({
  bool isPublic = true,
  bool viewOnMap = true,
  bool asAdmin = true,
}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return BaseView<EventInfoViewModel>(
        onModelReady: (model) {
          model.initialize(
            args: {
              "event": getTestEvent(),
              "exploreEventViewModel": ExploreEventsViewModel(),
            },
          );
        },
        builder: (context, model, child) {
          return MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: [
              const AppLocalizationsDelegate(isTest: true),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: Scaffold(
              body: VolunteerGroupsScreen(
                event: getTestEvent(),
                model: EventInfoViewModel(),
              ),
            ),
            navigatorKey: locator<NavigationService>().navigatorKey,
            onGenerateRoute: router.generateRoute,
          );
        },
      );
    },
  );
}

/// Helper to setup mocks and pump widget with groups
Future<void> setupAndPumpWithGroups(
  WidgetTester tester,
  List<EventVolunteerGroup> groups, {
  Future<void> Function()? additionalSetup,
}) async {
  final mockEventService = locator<EventService>();
  when(mockEventService.fetchVolunteerGroupsByEvent("1"))
      .thenAnswer((_) async => groups);

  when(mockEventService.fetchAgendaCategories("1"))
      .thenAnswer((_) async => QueryResult(
            options: QueryOptions(document: gql('query {}')),
            source: QueryResultSource.network,
          ));
  when(mockEventService.fetchAgendaItems("1"))
      .thenAnswer((_) async => QueryResult(
            options: QueryOptions(document: gql('query {}')),
            source: QueryResultSource.network,
          ));

  if (additionalSetup != null) {
    await additionalSetup();
  }

  await tester.pumpWidget(volunteerGroupsScreen());
  await tester.pumpAndSettle();
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    testSetupLocator();
    registerServices();

    locator<SizeConfig>().test();
  });

  tearDownAll(() {
    unregisterServices();
  });

  setUp(() {
    reset(locator<EventService>());
    reset(locator<NavigationService>());
    when(locator<NavigationService>().navigatorKey)
        .thenReturn(GlobalKey<NavigatorState>());
  });

  group("Widget Tests for VolunteerGroupscreen", () {
    testWidgets("Check if VolunteerGroupscreen shows up", (tester) async {
      await setupAndPumpWithGroups(tester, []);

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
    });

    testWidgets(
        "Check if no groups are displayed when there are no volunteer groups",
        (tester) async {
      await setupAndPumpWithGroups(tester, []);

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
      expect(find.text("There aren't any volunteer groups"), findsOneWidget);
    });
    testWidgets("Check if groups show up", (tester) async {
      final mockGroups = [
        EventVolunteerGroup(name: "Group 1", createdAt: "2027-09-08"),
        EventVolunteerGroup(name: "Group 2", createdAt: "2027-09-09"),
      ];
      final mockResult2 = {
        'createEventVolunteerGroup': {
          '_id': "fakeUser2",
          'name': "New Group",
          'volunteersRequired': 5,
          'volunteers': [],
        },
      };

      await setupAndPumpWithGroups(
        tester,
        mockGroups,
        additionalSetup: () async {
          when(
            locator<EventService>().createVolunteerGroup({
              'eventId': "1",
              'name': "New Group",
              'volunteersRequired': 5,
            }),
          ).thenAnswer(
            (realInvocation) async => QueryResult(
              data: mockResult2,
              source: QueryResultSource.network,
              options: QueryOptions(
                document: gql(EventQueries().createVolunteerGroup()),
              ),
            ),
          );
        },
      );

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
      expect(find.text("There aren't any volunteer groups"), findsNothing);
      expect(find.byKey(const Key("group_data")), findsNWidgets(2));

      expect(find.byKey(const Key("add_group_btn")), findsOneWidget);
      await tester.tap(find.byKey(const Key("add_group_btn")));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("add_grp_dialogue")), findsOneWidget);

      await tester.enterText(
        find.byKey(const Key("group_name_field")),
        "New Group",
      );
      await tester.enterText(
        find.byKey(const Key("volunteers_required_field")),
        "5",
      );

      await tester.tap(find.text('Create Group'));
      await tester.pumpAndSettle();

      expect(
        find.text('Failed to create group'),
        findsNothing,
      );
    });
    testWidgets("Check if edit group icon show up", (tester) async {
      final mockGroups = [
        EventVolunteerGroup(
          name: "Group 1",
          createdAt: "2027-09-08",
          volunteersRequired: 5,
        ),
        EventVolunteerGroup(
          name: "Group 2",
          createdAt: "2027-09-09",
          volunteersRequired: 5,
        ),
      ];

      await setupAndPumpWithGroups(tester, mockGroups);

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
      expect(find.text("There aren't any volunteer groups"), findsNothing);
      expect(find.byKey(const Key("group_data")), findsNWidgets(2));

      expect(find.byIcon(Icons.edit), findsNWidgets(2));

      await tester.tap(find.byIcon(Icons.edit).first);
      await tester.pumpAndSettle();
    });
    testWidgets("Check if no groups show up", (tester) async {
      await setupAndPumpWithGroups(tester, []);

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
      expect(find.text("There aren't any volunteer groups"), findsOneWidget);
    });
    testWidgets("Check if add group method throw error show up",
        (tester) async {
      final mockGroups = [
        EventVolunteerGroup(name: "Group 1", createdAt: "2027-09-08"),
        EventVolunteerGroup(name: "Group 2", createdAt: "2027-09-09"),
      ];

      await setupAndPumpWithGroups(
        tester,
        mockGroups,
        additionalSetup: () async {
          when(
            locator<EventService>().createVolunteerGroup({
              'eventId': "1",
              'name': "New Group",
              'volunteersRequired': 5,
            }),
          ).thenThrow("exception");
        },
      );

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
      expect(find.text("There aren't any volunteer groups"), findsNothing);
      expect(find.byKey(const Key("group_data")), findsNWidgets(2));

      expect(find.byKey(const Key("add_group_btn")), findsOneWidget);
      await tester.tap(find.byKey(const Key("add_group_btn")));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("add_grp_dialogue")), findsOneWidget);
      expect(find.text("Cancel"), findsOneWidget);

      await tester.tap(find.text("Cancel"));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("add_grp_dialogue")), findsNothing);
      await tester.tap(find.byKey(const Key("add_group_btn")));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key("group_name_field")),
        "New Group",
      );
      await tester.enterText(
        find.byKey(const Key("volunteers_required_field")),
        "5",
      );

      await tester.tap(find.text('Create Group'));
      await tester.pumpAndSettle();

      expect(
        find.text('Failed to create group'),
        findsOneWidget,
      );
    });
    testWidgets("Check if add group method validates entered data",
        (tester) async {
      final mockGroups = [
        EventVolunteerGroup(name: "Group 1", createdAt: "2027-09-08"),
        EventVolunteerGroup(name: "Group 2", createdAt: "2027-09-09"),
      ];

      await setupAndPumpWithGroups(tester, mockGroups);

      await tester.pumpAndSettle();

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
      expect(find.text("There aren't any volunteer groups"), findsNothing);
      expect(find.byKey(const Key("group_data")), findsNWidgets(2));

      expect(find.byKey(const Key("add_group_btn")), findsOneWidget);
      await tester.tap(find.byKey(const Key("add_group_btn")));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("add_grp_dialogue")), findsOneWidget);

      await tester.enterText(
        find.byKey(const Key("group_name_field")),
        "",
      );
      await tester.enterText(
        find.byKey(const Key("volunteers_required_field")),
        "0",
      );

      await tester.tap(find.text('Create Group'));
      await tester.pumpAndSettle();

      expect(
        find.text('Please enter valid data'),
        findsOneWidget,
      );
    });
    testWidgets("Check if invalid date is handled correctly", (tester) async {
      final mockGroups = [
        EventVolunteerGroup(
          name: "Srikar's Team",
          createdAt: "invalid-date-string",
          volunteersRequired: 5,
        ),
      ];

      await setupAndPumpWithGroups(tester, mockGroups);

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
      expect(find.text("Invalid date"), findsOneWidget);
    });

    testWidgets("Check if pull to refresh calls fetchVolunteerGroups",
        (tester) async {
      final mockEventService = locator<EventService>();
      final mockGroups = [
        EventVolunteerGroup(
          name: "Srikar's Team",
          createdAt: "2027-09-08",
          volunteersRequired: 5,
        ),
      ];

      await setupAndPumpWithGroups(tester, mockGroups);

      await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
      await tester.pumpAndSettle();

      verify(mockEventService.fetchVolunteerGroupsByEvent("1")).called(2);
    });

    testWidgets("Check if edit group navigation works with correct arguments",
        (tester) async {
      final mockNavigationService = locator<NavigationService>();
      final mockGroups = [
        EventVolunteerGroup(
          name: "Srikar's Team",
          createdAt: "2027-09-08",
          volunteersRequired: 5,
        ),
      ];

      await setupAndPumpWithGroups(tester, mockGroups);

      await tester.tap(find.byIcon(Icons.edit).first);
      await tester.pumpAndSettle();

      verify(
        mockNavigationService.pushScreen(
          "/manageVolunteerScreen",
          arguments: argThat(
            isA<List>()
                .having((list) => list.length, 'length', 2)
                .having((list) => list[0], 'event', isA<Event>())
                .having(
                  (list) => list[1],
                  'group',
                  isA<EventVolunteerGroup>()
                      .having((g) => g.name, 'name', "Srikar's Team"),
                ),
            named: 'arguments',
          ),
        ),
      ).called(1);
    });

    testWidgets("Check if successful group creation navigates to manage screen",
        (tester) async {
      final mockEventService = locator<EventService>();
      final mockNavigationService = locator<NavigationService>();
      final mockGroups = [
        EventVolunteerGroup(name: "Srikar's Team", createdAt: "2027-09-08"),
      ];
      final newGroupMap = {
        '_id': "fakeUser2",
        'name': "Srikar's Team",
        'volunteersRequired': 5,
        'volunteers': [],
      };

      await setupAndPumpWithGroups(
        tester,
        mockGroups,
        additionalSetup: () async {
          when(
            mockEventService.createVolunteerGroup({
              'eventId': "1",
              'name': "Srikar's Team",
              'volunteersRequired': 5,
            }),
          ).thenAnswer(
            (realInvocation) async => QueryResult(
              data: {'createEventVolunteerGroup': newGroupMap},
              source: QueryResultSource.network,
              options: QueryOptions(
                document: gql(EventQueries().createVolunteerGroup()),
              ),
            ),
          );
        },
      );

      await tester.tap(find.byKey(const Key("add_group_btn")));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key("group_name_field")),
        "Srikar's Team",
      );
      await tester.enterText(
        find.byKey(const Key("volunteers_required_field")),
        "5",
      );

      await tester.tap(find.text('Create Group'));
      await tester.pumpAndSettle();

      verify(
        mockNavigationService.pushScreen(
          "/manageVolunteerScreen",
          arguments: argThat(
            isA<List>()
                .having((list) => list.length, 'length', 2)
                .having((list) => list[0], 'event', isA<Event>())
                .having(
                  (list) => list[1],
                  'group',
                  isA<EventVolunteerGroup>()
                      .having((g) => g.name, 'name', "Srikar's Team")
                      .having(
                        (g) => g.volunteersRequired,
                        'volunteersRequired',
                        5,
                      ),
                ),
            named: 'arguments',
          ),
        ),
      ).called(1);
    });

    testWidgets("Check if null date is handled correctly", (tester) async {
      final mockGroups = [
        EventVolunteerGroup(
          name: "Srikar's Team",
          createdAt: null,
          volunteersRequired: 5,
        ),
      ];

      await setupAndPumpWithGroups(tester, mockGroups);

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
      expect(find.text("N/A"), findsOneWidget);
    });

    testWidgets(
        "Check if createVolunteerGroup returning null shows failure message",
        (tester) async {
      final mockEventService = locator<EventService>();
      final mockGroups = [
        EventVolunteerGroup(name: "Srikar's Team", createdAt: "2027-09-08"),
      ];

      await setupAndPumpWithGroups(
        tester,
        mockGroups,
        additionalSetup: () async {
          when(
            mockEventService.createVolunteerGroup({
              'eventId': "1",
              'name': "Srikar's Team",
              'volunteersRequired': 5,
            }),
          ).thenAnswer(
            (realInvocation) async => QueryResult(
              options: QueryOptions(document: gql('query {}')),
              source: QueryResultSource.network,
            ),
          );
        },
      );

      await tester.tap(find.byKey(const Key("add_group_btn")));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key("group_name_field")),
        "Srikar's Team",
      );
      await tester.enterText(
        find.byKey(const Key("volunteers_required_field")),
        "5",
      );

      await tester.tap(find.text('Create Group'));
      await tester.pumpAndSettle();

      expect(find.text('Failed to create group'), findsOneWidget);
    });
  });
}
