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

late EventInfoViewModel _eventInfoViewModel;
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
          _eventInfoViewModel = model;
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

  group("Widget Tests for VolunteerGroupscreen", () {
    testWidgets("Check if VolunteerGroupscreen shows up", (tester) async {
      await tester.pumpWidget(volunteerGroupsScreen());
      await tester.pumpAndSettle();

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
    });

    testWidgets("Check if no groups show up", (tester) async {
      await tester.pumpWidget(volunteerGroupsScreen());
      await tester.pumpAndSettle();

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
      expect(find.text("There aren't any volunteer groups"), findsOneWidget);
    });
    testWidgets("Check if groups show up", (tester) async {
      final mockEventService = locator<EventService>();
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

      when(mockEventService.fetchVolunteerGroupsByEvent("1"))
          .thenAnswer((_) async => mockGroups);

      when(
        mockEventService.createVolunteerGroup({
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

      await tester.pumpWidget(volunteerGroupsScreen());
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
    testWidgets("Check if no groups show up", (tester) async {
      final mockEventService = locator<EventService>();

      when(mockEventService.fetchVolunteerGroupsByEvent("1"))
          .thenAnswer((_) async => []);

      await tester.pumpWidget(volunteerGroupsScreen());
      await tester.pumpAndSettle();

      expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
      expect(find.text("There aren't any volunteer groups"), findsOneWidget);
    });
    testWidgets("Check if add group method throw error show up",
        (tester) async {
      final mockEventService = locator<EventService>();
      final mockGroups = [
        EventVolunteerGroup(name: "Group 1", createdAt: "2027-09-08"),
        EventVolunteerGroup(name: "Group 2", createdAt: "2027-09-09"),
      ];

      when(mockEventService.fetchVolunteerGroupsByEvent("1"))
          .thenAnswer((_) async => mockGroups);

      when(
        mockEventService.createVolunteerGroup({
          'eventId': "1",
          'name': "New Group",
          'volunteersRequired': 5,
        }),
      ).thenThrow("exception");

      await tester.pumpWidget(volunteerGroupsScreen());
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
    testWidgets("Check if add group method throw entre data show up",
        (tester) async {
      final mockEventService = locator<EventService>();
      final mockGroups = [
        EventVolunteerGroup(name: "Group 1", createdAt: "2027-09-08"),
        EventVolunteerGroup(name: "Group 2", createdAt: "2027-09-09"),
      ];

      when(mockEventService.fetchVolunteerGroupsByEvent("1"))
          .thenAnswer((_) async => mockGroups);

      when(
        mockEventService.createVolunteerGroup({
          'eventId': "1",
          'name': "New Group",
          'volunteersRequired': 5,
        }),
      ).thenThrow("exception");

      await tester.pumpWidget(volunteerGroupsScreen());
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
  });
}
