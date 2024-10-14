// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
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

Widget createCreateAgendaItemScreen() {
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
            home: Scaffold(
              body: CreateAgendaItemPage(
                model: model,
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

List<AgendaCategory> testCategories = [
  AgendaCategory(id: '1', name: 'Category 1'),
  AgendaCategory(id: '2', name: 'Category 2'),
];

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

  group('CreateAgendaItemPage Widget Tests', () {
    testWidgets("Check if create agenda item screen shows up", (tester) async {
      await tester.pumpWidget(createCreateAgendaItemScreen());
      await tester.pumpAndSettle();

      expect(find.byType(CreateAgendaItemPage), findsOneWidget);
    });

    testWidgets('Category selection works correctly',
        (WidgetTester tester) async {
      final mockResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'agendaItemCategoriesByOrganization': [
            {
              'id': '1',
              'name': 'Category 1',
            },
            {
              'id': '2',
              'name': 'Category 2',
            },
          ],
        },
        options: QueryOptions(
          document: gql(
            EventQueries().fetchAgendaItemCategoriesByOrganization('XYZ'),
          ),
        ),
      );

      when(eventService.fetchAgendaCategories("XYZ"))
          .thenAnswer((_) async => mockResult);
      await tester.pumpWidget(createCreateAgendaItemScreen());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButtonFormField<AgendaCategory>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Category 1').last);
      await tester.pumpAndSettle();

      expect(find.byType(Chip), findsOneWidget);
      expect(find.text('Category 1'), findsNWidgets(2));
    });

    testWidgets('Add button works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createCreateAgendaItemScreen());
      await tester.pumpAndSettle();

      // Fill in the required fields
      await tester.enterText(
        find.byKey(const Key('create_event_agenda_tf1')),
        'Test Agenda Item',
      );
      await tester.enterText(
        find.byKey(const Key('create_event_agenda_tf2')),
        'Test Description',
      );
      await tester.enterText(
        find.byKey(const Key('create_event_agenda_duration')),
        '00:30',
      );

      await tester.tap(find.byKey(const Key('add_agenda')));
      await tester.pumpAndSettle();

      expect(find.byType(CreateAgendaItemPage), findsNothing);
    });

    testWidgets('Add URL works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createCreateAgendaItemScreen());
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byType(TextFormField).at(3),
        'https://example.com',
      );
      await tester.pumpAndSettle();
      await tester.tap(
        find.byKey(const Key('add_url')),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Chip), findsOneWidget);
      expect(find.text('https://example.com'), findsOneWidget);
    });

    testWidgets('Add Attachments button is present',
        (WidgetTester tester) async {
      await tester.pumpWidget(createCreateAgendaItemScreen());
      await tester.pumpAndSettle();

      expect(find.text('Add Attachments'), findsOneWidget);
    });
  });
}
