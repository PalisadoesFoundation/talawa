// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/create_agenda_item_page.dart';
import 'package:talawa/views/after_auth_screens/events/manage_agenda_items_screen.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/agenda_item_tile.dart';

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

Widget createManageAgendaScreen() {
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
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('ManageAgendaScreen Widget Tests', () {
    testWidgets('Shows empty state when no agenda items',
        (WidgetTester tester) async {
      await tester.pumpWidget(createManageAgendaScreen());
      await tester.pumpAndSettle();

      expect(find.text('No agenda items yet'), findsOneWidget);
      expect(find.byType(ReorderableListView), findsNothing);
    });

    testWidgets('Shows list of agenda items when present',
        (WidgetTester tester) async {
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'agendaItemByEvent': [
            {
              'id': '1',
              'title': 'Agenda 1',
              'duration': '1h',
              'sequence': 1,
            },
            {
              'id': '2',
              'title': 'Agenda 2',
              'duration': '30m',
              'sequence': 2,
            },
          ],
        },
        options: QueryOptions(
          document: gql(EventQueries().fetchAgendaItemsByEvent('1')),
        ),
      );

      when(eventService.fetchAgendaItems('1'))
          .thenAnswer((_) async => mockResult);

      await tester.pumpWidget(createManageAgendaScreen());
      await tester.pumpAndSettle();

      expect(find.text('No agenda items yet'), findsNothing);
      expect(find.byType(ReorderableListView), findsOneWidget);
      expect(find.byType(ExpandableAgendaItemTile), findsNWidgets(2));
    });

    testWidgets('Can reorder agenda items', (WidgetTester tester) async {
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'agendaItemByEvent': [
            {
              '_id': '1',
              'title': 'Agenda 1',
              'duration': '1h',
              'sequence': 1,
            },
            {
              '_id': '2',
              'title': 'Agenda 2',
              'duration': '30m',
              'sequence': 2,
            },
          ],
        },
        options: QueryOptions(
          document: gql(EventQueries().fetchAgendaItemsByEvent('1')),
        ),
      );

      when(eventService.fetchAgendaItems('1'))
          .thenAnswer((_) async => mockResult);

      await tester.pumpWidget(createManageAgendaScreen());
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

    testWidgets('Can delete agenda item', (WidgetTester tester) async {
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'agendaItemByEvent': [
            {
              '_id': '1',
              'title': 'Agenda 1',
              'duration': '1h',
              'sequence': 1,
            },
            {
              '_id': '2',
              'title': 'Agenda 2',
              'duration': '30m',
              'sequence': 2,
            },
          ],
        },
        options: QueryOptions(
          document: gql(EventQueries().fetchAgendaItemsByEvent('1')),
        ),
      );

      when(eventService.fetchAgendaItems('1'))
          .thenAnswer((_) async => mockResult);
      when(eventService.deleteAgendaItem({"removeAgendaItemId": '1'}))
          .thenAnswer((_) async => true);
      await tester.pumpWidget(createManageAgendaScreen());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("delete_agenda_item1")));
      await tester.pump();
    });

    testWidgets('Can navigate to CreateAgendaItemPage',
        (WidgetTester tester) async {
      await tester.pumpWidget(createManageAgendaScreen());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('add_item_btn')));
      await tester.pumpAndSettle();

      expect(find.byType(CreateAgendaItemPage), findsOneWidget);
    });
  });
}
