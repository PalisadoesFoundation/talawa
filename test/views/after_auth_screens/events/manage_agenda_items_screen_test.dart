// ignore_for_file: talawa_api_doc
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/create_agenda_item_page.dart';
import 'package:talawa/views/after_auth_screens/events/edit_agenda_item_page.dart';
import 'package:talawa/views/after_auth_screens/events/manage_agenda_items_screen.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/agenda_item_tile.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Event getTestEvent({
  bool isPublic = false,
  bool viewOnMap = true,
  bool asAdmin = false,
  String id = "1",
  List<EventAgendaItem>? agendaItems,
}) {
  return Event(
    id: id,
    name: "test_event",
    creator: User(
      id: asAdmin ? "xzy1" : "acb1",
      firstName: "ravidi",
      lastName: "shaikh",
    ),
    isPublic: isPublic,
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
    agendaItems: agendaItems,
  );
}

Widget createManageAgendaScreen(
  String id, {
  List<EventAgendaItem>? agendaItems,
}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return BaseView<EventInfoViewModel>(
        onModelReady: (model) {
          model.initialize(
            args: {
              "event": getTestEvent(
                isPublic: true,
                viewOnMap: false,
                asAdmin: true,
                id: id,
                agendaItems: agendaItems,
              ),
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
            home: const Scaffold(
              body: ManageAgendaScreen(),
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
  testSetupLocator();
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    registerServices();
    locator<SizeConfig>().test();
  });
  tearDownAll(() {
    unregisterServices();
  });

  setUp(() {
    when(userConfig.currentOrg).thenReturn(
      OrgInfo(id: 'XYZ', name: 'Test Organization'),
    );

    // Mock default empty categories response
    when(eventService.fetchAgendaCategories('XYZ')).thenAnswer(
      (_) async => QueryResult(
        source: QueryResultSource.network,
        data: {'agendaItemCategoriesByOrganization': []},
        options: QueryOptions(
          document: gql(
            EventQueries().fetchAgendaItemCategoriesByOrganization('XYZ'),
          ),
        ),
      ),
    );
  });

  group('ManageAgendaScreen Widget Tests', () {
    testWidgets('Shows empty state when no agenda items',
        (WidgetTester tester) async {
      await tester.pumpWidget(createManageAgendaScreen('1'));
      await tester.pumpAndSettle();

      expect(find.text('No agenda items yet'), findsOneWidget);
      expect(find.byType(ReorderableListView), findsNothing);
    });

    testWidgets('Shows list of agenda items when present',
        (WidgetTester tester) async {
      final agendaItems = [
        EventAgendaItem(
          id: '1',
          name: 'Agenda 1',
          duration: '1h',
          sequence: 1,
        ),
        EventAgendaItem(
          id: '2',
          name: 'Agenda 2',
          duration: '30m',
          sequence: 2,
        ),
      ];

      await tester
          .pumpWidget(createManageAgendaScreen('1', agendaItems: agendaItems));
      await tester.pumpAndSettle();

      expect(find.text('No agenda items yet'), findsNothing);
      expect(find.byType(ReorderableListView), findsOneWidget);
      expect(find.byType(ExpandableAgendaItemTile), findsNWidgets(2));
    });

    testWidgets('Can reorder agenda items', (WidgetTester tester) async {
      final agendaItems = [
        EventAgendaItem(
          id: '1',
          name: 'Agenda 1',
          duration: '1h',
          sequence: 1,
        ),
        EventAgendaItem(
          id: '2',
          name: 'Agenda 2',
          duration: '30m',
          sequence: 2,
        ),
      ];

      await tester
          .pumpWidget(createManageAgendaScreen('1', agendaItems: agendaItems));
      await tester.pumpAndSettle();

      final firstItemFinder = find.text('Agenda 1');
      final secondItemFinder = find.text('Agenda 2');

      expect(firstItemFinder, findsOneWidget);
      expect(secondItemFinder, findsOneWidget);

      await tester.drag(
        find.byKey(const Key('reorder_icon')).first,
        const Offset(0, 200),
      );
      await tester.pumpAndSettle();
    });

    testWidgets('Can navigate to EditAgendaItemPage and update agenda item',
        (WidgetTester tester) async {
      final agendaItems = [
        EventAgendaItem(
          id: '1',
          name: 'Agenda 1',
          duration: '1h',
          sequence: 1,
        ),
      ];

      await tester
          .pumpWidget(createManageAgendaScreen('2', agendaItems: agendaItems));
      await tester.pumpAndSettle();

      // Find and tap the edit button
      final Finder editButtonFinder =
          find.byKey(const Key('edit_agenda_item1'));
      await tester.tap(editButtonFinder);
      await tester.pumpAndSettle();

      // Verify navigation to EditAgendaItemPage
      expect(find.byType(EditAgendaItemPage), findsOneWidget);

      // Simulate returning without changes (true)
      Navigator.of(tester.element(find.byType(EditAgendaItemPage))).pop(true);
      await tester.pumpAndSettle();
    });

    testWidgets('Delete agenda item shows toast notification',
        (WidgetTester tester) async {
      final agendaItems = [
        EventAgendaItem(
          id: '1',
          name: 'Agenda 1',
          duration: '1h',
          sequence: 1,
        ),
      ];

      when(eventService.deleteAgendaItem({"removeAgendaItemId": "1"}))
          .thenAnswer((_) async => true);

      await tester
          .pumpWidget(createManageAgendaScreen('1', agendaItems: agendaItems));
      await tester.pumpAndSettle();

      // Find and tap the delete button
      final Finder deleteButtonFinder =
          find.byKey(const Key('delete_agenda_item1'));
      await tester.tap(deleteButtonFinder);

      // Pump the widget to trigger the delete operation
      await tester.pumpAndSettle();

      // Verify toast appears with correct content
      final Finder toastTitleFinder = find.descendant(
        of: find.byType(ToastCard),
        matching: find.byType(Text),
      );

      expect(toastTitleFinder, findsOneWidget);

      final Text toastTitle = tester.widget<Text>(toastTitleFinder);
      expect(toastTitle.data, 'Agenda item removed');

      // Verify icon
      expect(find.byIcon(Icons.error_outline), findsOneWidget);

      // Verify toast styling
      final ToastCard toastCard =
          tester.widget<ToastCard>(find.byType(ToastCard));
      expect(toastCard.color, Colors.black.withAlpha((0.8 * 255).toInt()));

      // Wait for auto-dismiss
      await tester.pump(const Duration(seconds: 2));
    });

    testWidgets('Can delete agenda item', (WidgetTester tester) async {
      final agendaItems = [
        EventAgendaItem(
          id: '1',
          name: 'Agenda 1',
          duration: '1h',
          sequence: 1,
        ),
        EventAgendaItem(
          id: '2',
          name: 'Agenda 2',
          duration: '30m',
          sequence: 2,
        ),
      ];

      when(eventService.deleteAgendaItem({"removeAgendaItemId": '1'}))
          .thenAnswer((_) async => true);

      await tester
          .pumpWidget(createManageAgendaScreen('1', agendaItems: agendaItems));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("delete_agenda_item1")));
      await tester.pump();
    });

    testWidgets('Can navigate to CreateAgendaItemPage',
        (WidgetTester tester) async {
      await tester.pumpWidget(createManageAgendaScreen('1'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('add_item_btn')));
      await tester.pumpAndSettle();

      expect(find.byType(CreateAgendaItemPage), findsOneWidget);
    });
  });
}
