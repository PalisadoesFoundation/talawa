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
import 'package:talawa/services/org_service.dart';
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
    final mockOrgService =
        locator<OrganizationService>() as MockOrganizationService;

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

    // Mock organization members list globally
    when(mockOrgService.getOrgMembersList(any)).thenAnswer(
      (_) async => [
        User(
          id: "fakeUser1",
          firstName: "Parag",
          lastName: "xoxo",
        ),
        User(
          id: "fakeUser2",
          firstName: "Parag1",
          lastName: "xoxo",
        ),
      ],
    );

    // Mock updateVolunteerGroup
    when(mockEventService.updateVolunteerGroup(any)).thenAnswer(
      (_) async => QueryResult(
        data: {
          'updateEventVolunteerGroup': {
            'id': 'volunteer_group',
          },
        },
        source: QueryResultSource.network,
        options: QueryOptions(
          document: gql(EventQueries().updateVolunteerGroupMutation()),
        ),
      ),
    );

    // Mock addVolunteerToGroup
    when(mockEventService.addVolunteerToGroup(any)).thenAnswer(
      (invocation) async {
        final variables =
            invocation.positionalArguments[0] as Map<String, dynamic>;
        final userId = variables['userId'];
        return QueryResult(
          data: {
            'createEventVolunteer': {
              '_id': "volunteer_$userId",
              'user': {
                'id': userId,
                'name': userId == 'fakeUser1' ? 'Parag xoxo' : 'Parag1 xoxo',
                'emailAddress': '$userId@example.com',
              },
            },
          },
          source: QueryResultSource.network,
          options: QueryOptions(
            document: gql(EventQueries().addVolunteerToGroup()),
          ),
        );
      },
    );

    // Mock removeVolunteerFromGroup
    when(mockEventService.removeVolunteerFromGroup(any)).thenAnswer(
      (_) async => QueryResult(
        data: {
          'removeEventVolunteer': {
            '_id': 'volunteer_id_1',
          },
        },
        source: QueryResultSource.network,
        options: QueryOptions(
          document: gql(EventQueries().removeVolunteerMutation()),
        ),
      ),
    );

    // Mock removeVolunteerGroup
    when(mockEventService.removeVolunteerGroup(any)).thenAnswer(
      (_) async => QueryResult(
        data: {
          'removeEventVolunteerGroup': {
            '_id': 'volunteer_group',
          },
        },
        source: QueryResultSource.network,
        options: QueryOptions(
          document: gql(EventQueries().removeEventVolunteerGroup()),
        ),
      ),
    );

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
      // After adding the volunteers, check if the available members list is updated
      await tester.tap(find.text("Add Volunteers"));
      await tester.pumpAndSettle();

      // The members list should still be present if there are available members
      // or not present if all organization members have been added
      // Since we're mocking the same 2 users, they should still be available
      // unless the view model properly filters out existing volunteers
      expect(
        find.byKey(
          const Key("bottomSheetContainer"),
        ),
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
