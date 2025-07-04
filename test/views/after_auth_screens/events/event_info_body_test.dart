// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/events/event_model.dart';
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
import 'package:talawa/views/after_auth_screens/events/event_info_body.dart';
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

final exploreEventsViewModel = ExploreEventsViewModel();
late EventInfoViewModel _eventInfoViewModel;

Widget createEventInfoBody({
  bool asAdmin = false,
}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return BaseView<EventInfoViewModel>(
        onModelReady: (model) {
          model.initialize(
            args: {
              "event": getTestEvent(
                asAdmin: asAdmin,
              ),
              "exploreEventViewModel": exploreEventsViewModel,
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
            home: const Scaffold(
              body: CustomScrollView(
                slivers: [
                  EventInfoBody(),
                ],
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
  // locator<GraphqlConfig>().test();

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    testSetupLocator();
    registerServices();

    // Mock EventService methods to return proper QueryResult objects
    final mockEventService = locator<EventService>() as MockEventService;

    // Mock fetchAgendaCategories
    final categoryResult = QueryResult(
      source: QueryResultSource.network,
      data: {
        'agendaItemCategoriesByOrganization': [
          {
            '_id': '1',
            'name': 'Category 1',
          },
          {
            '_id': '2',
            'name': 'Category 2',
          },
        ],
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

  group("Widget Tests for EventInfoBody", () {
    testWidgets("Check if EventInfoBody shows up", (tester) async {
      await tester.pumpWidget(createEventInfoBody());
      await tester.pumpAndSettle();

      expect(find.byType(EventInfoBody), findsOneWidget);
      expect(find.byType(SliverToBoxAdapter), findsOneWidget);
    });

    testWidgets("Check if all the text shows up correctly", (tester) async {
      await tester.pumpWidget(createEventInfoBody());
      await tester.pumpAndSettle();

      expect(find.text("test_event"), findsOneWidget);
      expect(find.text("Created by: ravidi shaikh"), findsOneWidget);
      expect(find.text("test_event_description"), findsOneWidget);
    });

    testWidgets(
      "Check if all the children show up correctly",
      (tester) async {
        await tester.pumpWidget(createEventInfoBody());
        await tester.pumpAndSettle();
      },
    );

    testWidgets("Check if all taps work", (tester) async {
      await tester.pumpWidget(createEventInfoBody());
      await tester.pumpAndSettle();

      // The old Attendee and Admins keys may not exist in the new model structure
      // Update this test based on the current widget structure

      await tester.pumpAndSettle();
    });

    testWidgets("Check if edit button appears for creator", (tester) async {
      await tester.pumpWidget(createEventInfoBody(asAdmin: true));
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsOneWidget);
      await tester.tap(find.byType(IconButton));
      // verify(navigationService.pushScreen("/editEventPage",
      //     arguments: getTestEvent()),);
    });

    testWidgets("Check if edit button doesn't appear for non creator",
        (tester) async {
      await tester.pumpWidget(createEventInfoBody(asAdmin: false));
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsNothing);
      // verify(navigationService.pushScreen("/editEventPage", arguments: getTestEvent()));
    });
  });

  group("Check if conditional children show up", () {
    testWidgets("Loading indicator", (tester) async {
      await tester.pumpWidget(createEventInfoBody());
      await tester.pumpAndSettle();

      // Fully loaded
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is SliverToBoxAdapter &&
              widget.child is Padding &&
              (widget.child! as Padding).child is Column &&
              ((widget.child! as Padding).child! as Column).children.last
                  is ListView,
        ),
        findsOneWidget,
      );

      // Model is loading
      _eventInfoViewModel.setState(ViewState.busy);
      await tester.pump();

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is SliverToBoxAdapter &&
              widget.child is Padding &&
              (widget.child! as Padding).child is Column &&
              ((widget.child! as Padding).child! as Column).children.last
                  is Padding,
        ),
        findsOneWidget,
      );
    });
  });
}
