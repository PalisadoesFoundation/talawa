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
import '../../../helpers/test_helpers.mocks.dart';
import '../../../helpers/test_locator.dart';

Event getTestEvent({
  bool asAdmin = false,
}) {
  return Event(
    id: "1",
    name: "test_event",
    description: "test_event_description",
    startAt: "2024-01-01T00:00:00.000Z",
    endAt: "2024-12-31T23:59:59.000Z",
    creator: User(
      id: asAdmin ? "xzy1" : "acb1",
      firstName: "ravidi",
      lastName: "shaikh",
    ),
  );
}

EventVolunteerGroup group1 = EventVolunteerGroup(
  id: "volunteer_group",
  event: Event(
    id: "1",
    name: "test_event",
    description: "test_event_description",
    startAt: "2024-01-01T00:00:00.000Z",
    endAt: "2024-12-31T23:59:59.000Z",
  ),
  creator: User(id: "creator_id"),
  volunteers: [
    EventVolunteer(
      id: "volunteer_id_1",
      user: User(
        id: "existing_user_1", // Add ID to avoid null comparison
        firstName: "first1",
        lastName: "last1",
      ),
      response: null,
    ),
    EventVolunteer(
      id: "volunteer_id_2",
      user: User(
        id: "existing_user_2", // Add ID to avoid null comparison
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
  event: Event(
    id: "1",
    name: "test_event",
    description: "test_event_description",
    startAt: "2024-01-01T00:00:00.000Z",
    endAt: "2024-12-31T23:59:59.000Z",
  ),
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

    // Mock EventService methods to avoid GraphQL errors
    final mockEventService = locator<EventService>() as MockEventService;

    // Mock fetchAgendaCategories
    final categoryResult = QueryResult(
      source: QueryResultSource.network,
      data: {
        'agendaItemCategoriesByOrganization': [],
      },
      options: QueryOptions(
        document:
            gql(EventQueries().fetchAgendaItemCategoriesByOrganization('org')),
      ),
    );
    when(mockEventService.fetchAgendaCategories(any))
        .thenAnswer((_) async => categoryResult);

    // Mock fetchAgendaItems
    final agendaResult = QueryResult(
      source: QueryResultSource.network,
      data: {
        'agendaItemByEvent': [],
      },
      options: QueryOptions(
        document: gql(EventQueries().fetchAgendaItemsByEvent('1')),
      ),
    );
    when(mockEventService.fetchAgendaItems(any))
        .thenAnswer((_) async => agendaResult);

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
          '_id': "volunteer_fakeUser1", // Unique volunteer record ID
          'user': {
            'id': "fakeUser1", // Use 'id' not '_id' for fromOrg: true
            'name': 'Parag xoxo', // Use full name for fromOrg: true
            'avatarURL': null,
          },
          'response': null,
        },
      };

      final mockResult2 = {
        'createEventVolunteer': {
          '_id': "volunteer_fakeUser2", // Unique volunteer record ID
          'user': {
            'id': "fakeUser2", // Use 'id' not '_id' for fromOrg: true
            'name': 'Parag1 xoxo', // Use full name for fromOrg: true
            'avatarURL': null,
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

      // First time opening the add volunteers bottom sheet
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

      // Select both available members
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

      // Add the selected volunteers
      await tester.tap(find.text("Done"));
      await tester.pumpAndSettle();

      // Second time opening the add volunteers bottom sheet
      // Now there should be no available members since we added them all
      await tester.tap(find.text("Add Volunteers"));
      await tester.pumpAndSettle();

      // The members list should not be present because there are no available members
      expect(
        find.byKey(
          const Key("members_list_key"),
        ),
        findsNothing,
      );

      // Should show the "no members" message instead
      expect(
        find.text("There aren't any members in this organization."),
        findsOneWidget,
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
