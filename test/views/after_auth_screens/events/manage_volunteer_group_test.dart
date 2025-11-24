// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/manage_volunteer_group_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/manage_volunteer_group.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Event getTestEvent({
  bool isPublic = true,
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

EventVolunteerGroup group1 = EventVolunteerGroup(
  id: "volunteer_group",
  event: Event(id: "1"),
  creator: User(id: "creator_id"),
  volunteers: [
    EventVolunteer(
      id: "volunteer_id_1",
      user: User(
        firstName: "first1",
        lastName: "last1",
      ),
      response: null,
    ),
    EventVolunteer(
      id: "volunteer_id_2",
      user: User(
        firstName: "first2",
        lastName: "last2",
      ),
      response: null,
    ),
  ],
  volunteersRequired: 2,
  name: "test_group",
);

EventVolunteerGroup group2 = EventVolunteerGroup(
  id: "volunteer_group2",
  event: Event(id: "1"),
  creator: User(id: "creator_id"),
  volunteers: [],
  volunteersRequired: 2,
  name: "test_group",
);

Widget createManageGroupScreen1(EventVolunteerGroup group) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return BaseView<ManageVolunteerGroupViewModel>(
        onModelReady: (model) {
          model.initialize(getTestEvent(), group);
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
              body: ManageGroupScreen(
                group: group,
                event: getTestEvent(),
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

  group("Widget Tests for ManageGroupScreen", () {
    testWidgets("Check if ManageGroupScreen shows up", (tester) async {
      await tester.pumpWidget(createManageGroupScreen1(group1));
      await tester.pumpAndSettle();

      expect(find.byType(ManageGroupScreen), findsOneWidget);
    });

    testWidgets("Check if all volunteers shows up correctly", (tester) async {
      await tester.pumpWidget(createManageGroupScreen1(group1));
      await tester.pumpAndSettle();

      expect(find.byType(ManageGroupScreen), findsOneWidget);
      expect(find.text('No volunteers yet'), findsNothing);
      expect(find.text("first1 last1"), findsOneWidget);
      expect(find.text("first2 last2"), findsOneWidget);
      expect(find.text("Add Volunteers"), findsOneWidget);
    });

    testWidgets(
      "Check if edit group button work properly",
      (tester) async {
        final mockEventService = locator<EventService>();
        final mockResult = {
          'updateEventVolunteerGroup': {
            'id': 'volunteer_group',
          },
        };

        when(
          mockEventService.updateVolunteerGroup({
            'id': group1.id,
            'data': {
              'eventId': getTestEvent().id,
              'name': "Updated Group",
              'volunteersRequired': 20,
            },
          }),
        ).thenAnswer(
          (_) async => QueryResult(
            data: mockResult,
            source: QueryResultSource.network,
            options: QueryOptions(
              document: gql(EventQueries().updateVolunteerGroupMutation()),
            ),
          ),
        );
        await tester.pumpWidget(createManageGroupScreen1(group1));
        await tester.pumpAndSettle();

        expect(find.byType(ManageGroupScreen), findsOneWidget);
        expect(find.text('No volunteers yet'), findsNothing);
        expect(find.text("first1 last1"), findsOneWidget);
        expect(find.text('Add Volunteers'), findsOneWidget);
        expect(find.text("Edit Group"), findsOneWidget);

        await tester.tap(find.text("Edit Group"));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);

        await tester.tap(find.text("Cancel"));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsNothing);

        await tester.tap(find.text("Edit Group"));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);

        await tester.enterText(
          find.byKey(const Key('groupNameField')),
          'Updated Group',
        );

        await tester.pumpAndSettle();
        await tester.enterText(
          find.byKey(const Key('groupVolunteerRequiredField')),
          '20',
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsNothing);

        expect(find.text('Updated Group'), findsOneWidget);
      },
    );

    testWidgets("Check add volunteer button work properly", (tester) async {
      final mockEventService = locator<EventService>();

      final mockResult1 = {
        'createEventVolunteer': {
          '_id': "fakeUser1",
          'user': {
            'user': {
              'id': "fakeUser1",
              'name': 'Parag xoxo',
            },
          },
          'response': null,
        },
      };

      final mockResult2 = {
        'createEventVolunteer': {
          '_id': "fakeUser2",
          'user': {
            'user': {
              'id': "fakeUser2",
              'name': 'Parag1 xoxo',
            },
          },
          'response': null,
        },
      };

      when(
        mockEventService.addVolunteerToGroup({
          'eventId': "1",
          'userId': "fakeUser1",
          'groupId': "volunteer_group",
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          data: mockResult1,
          source: QueryResultSource.network,
          options:
              QueryOptions(document: gql(EventQueries().addVolunteerToGroup())),
        ),
      );

      when(
        mockEventService.addVolunteerToGroup({
          'eventId': "1",
          'userId': "fakeUser2",
          'groupId': "volunteer_group",
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          data: mockResult2,
          source: QueryResultSource.network,
          options:
              QueryOptions(document: gql(EventQueries().addVolunteerToGroup())),
        ),
      );
      await tester.pumpWidget(createManageGroupScreen1(group1));
      await tester.pumpAndSettle();

      expect(find.byType(ManageGroupScreen), findsOneWidget);
      expect(find.text('No volunteers yet'), findsNothing);
      expect(find.text("first1 last1"), findsOneWidget);
      expect(find.text('Add Volunteers'), findsOneWidget);
      expect(find.text("Edit Group"), findsOneWidget);

      await tester.tap(find.text("Add Volunteers"));
      await tester.pumpAndSettle();

      expect(
        find.byKey(
          const Key("bottomSheetContainer"),
        ),
        findsOneWidget,
      );

      expect(
        find.byKey(
          const Key("members_list_key"),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          const Key("checkBox0"),
        ),
        findsOneWidget,
      );

      await tester.tap(
        find.byKey(
          const Key("checkBox0"),
        ),
      );
      await tester.tap(
        find.byKey(
          const Key("checkBox1"),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text("Done"));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Add Volunteers"));
      await tester.pumpAndSettle();

      expect(
        find.byKey(
          const Key("members_list_key"),
        ),
        findsNothing,
      );
    });

    testWidgets("Check if deleting volunteer work properly", (tester) async {
      await tester.pumpWidget(createManageGroupScreen1(group1));
      await tester.pumpAndSettle();

      expect(find.byType(ManageGroupScreen), findsOneWidget);
      expect(find.text('No volunteers yet'), findsNothing);
      expect(find.text("first1 last1"), findsOneWidget);
      expect(find.text('Add Volunteers'), findsOneWidget);
      expect(find.text("Edit Group"), findsOneWidget);

      expect(find.byKey(const Key("volunteers")), findsNWidgets(2));

      await tester.tap(find.byKey(const Key("delete_volunteer0")));
      await tester.pumpAndSettle();
    });

    testWidgets("Check if no volunteer text shows up when no volunteer",
        (tester) async {
      await tester.pumpWidget(createManageGroupScreen1(group2));
      await tester.pumpAndSettle();

      expect(find.byType(ManageGroupScreen), findsOneWidget);
      expect(find.text('No volunteers yet'), findsOneWidget);
      expect(find.text('Add Volunteers'), findsOneWidget);
      expect(find.text("Edit Group"), findsOneWidget);
    });

    testWidgets("Check if deleting volunteer group work properly",
        (tester) async {
      await tester.pumpWidget(createManageGroupScreen1(group1));
      await tester.pumpAndSettle();

      expect(find.byType(ManageGroupScreen), findsOneWidget);
      expect(find.text('No volunteers yet'), findsNothing);
      expect(find.text("first1 last1"), findsOneWidget);
      expect(find.text('Add Volunteers'), findsOneWidget);
      expect(find.text("Edit Group"), findsOneWidget);

      expect(find.byKey(const Key("volunteers")), findsNWidgets(2));

      await tester.tap(find.text('Delete Group'));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("Delete_group_dialogue")), findsOneWidget);

      await tester.tap(find.text("Cancel"));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("Delete_group_dialogue")), findsNothing);

      await tester.tap(find.text('Delete Group'));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Delete"));
      await tester.pumpAndSettle();
    });
  });
}
