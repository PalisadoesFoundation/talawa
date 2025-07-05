// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/explore_event_dialogue.dart';
import 'package:talawa/views/demo_screens/explore_events_demo.dart';
import 'package:talawa/widgets/custom_drawer.dart';
import 'package:talawa/widgets/event_card.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

// class MockBuildContext extends Mock implements BuildContext {}

Widget createExploreEventsScreen(MainScreenViewModel model) => MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      key: const Key('Root'),
      home: Scaffold(
        key: MainScreenViewModel.scaffoldKey,
        drawer: CustomDrawer(
          homeModel: model,
        ),
        body: const DemoExploreEvents(
          key: Key('ExploreEvents'),
        ),
      ),
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: router.generateRoute,
    );

void main() {
  SizeConfig().test();

  final mockEvents = <Event>[
    Event(
      id: 'event1',
      name: 'event title',
      description: 'description',
      startAt: '2024-01-01T00:00:00.000Z',
      endAt: '2024-12-31T23:59:59.000Z',
      creator: User(id: 'admin2'),
    ),
  ];

  late ExploreEventsViewModel exploreEventsViewModel;
  group('Test for DemoExploreEventsPage', () {
    setUpAll(() {
      registerServices();
      registerViewModels();
      exploreEventsViewModel = getAndRegisterExploreEventsViewModel();
    });
    tearDownAll(() {
      unregisterServices();
      unregisterViewModels();
    });
    testWidgets('Test for menu button.', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createExploreEventsScreen(model));

      await tester.pumpAndSettle();

      final menuButton = find.byIcon(Icons.menu);

      await tester.tap(menuButton);
      await tester.pumpAndSettle();

      expect(find.byType(CustomDrawer), findsOneWidget);
    });

    testWidgets('Test for AddDate button.', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createExploreEventsScreen(model));

      await tester.pumpAndSettle();

      final addDateButton = find.textContaining('Add Date');

      await tester.tap(addDateButton);
      await tester.pumpAndSettle();

      expect(find.byType(ExploreEventDialog), findsOneWidget);
    });

    testWidgets('Test for Calendar button', (tester) async {
      final model = MainScreenViewModel();
      final mockModel = ExploreEventsViewModel();
      await tester.pumpWidget(createExploreEventsScreen(model));

      await tester.pumpAndSettle();

      final calendarBtn = find.byIcon(Icons.calendar_month);

      expect(calendarBtn, findsOneWidget);

      await tester.tap(calendarBtn);
      await tester.pumpAndSettle();

      verify(
        navigationService.pushScreen(
          Routes.calendar,
          arguments: mockModel.events,
        ),
      );
    });

    testWidgets('Test for floatingAction button', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createExploreEventsScreen(model));

      await tester.pumpAndSettle();

      final floatingBtn = find.byType(FloatingActionButton);

      expect(floatingBtn, findsOneWidget);

      await tester.tap(floatingBtn);
      await tester.pumpAndSettle();

      verify(
        navigationService.pushScreen(
          "/createEventPage",
        ),
      );
    });

    testWidgets('Test for eventCard.', (tester) async {
      final model = MainScreenViewModel();
      when(exploreEventsViewModel.events).thenAnswer((_) {
        return mockEvents;
      });
      await tester.pumpWidget(createExploreEventsScreen(model));

      await tester.pumpAndSettle();

      final eventCard = find.byType(EventCard).first;

      expect(eventCard, findsOneWidget);

      await tester.tap(eventCard);
      await tester.pumpAndSettle();

      verify(
        navigationService.navigatorKey,
      );
    });

    testWidgets('Test for dropDown button', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createExploreEventsScreen(model));

      await tester.pumpAndSettle();

      final dropDownBtn = find.byType(DropdownButton<String>);

      await tester.tap(dropDownBtn);
      await tester.pumpAndSettle();

      final createEventsBtn = find.textContaining('Created Events');

      expect(createEventsBtn, findsOneWidget);

      await tester.tap(createEventsBtn);
      await tester.pumpAndSettle();
    });

    testWidgets('Test for ExploreEvent dialog', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createExploreEventsScreen(model));

      await tester.pumpAndSettle();

      final dropDownBtn = find.byType(DropdownButton<String>);

      await tester.tap(dropDownBtn);
      await tester.pumpAndSettle();

      final createEventsBtn = find.textContaining('Created Events');

      expect(createEventsBtn, findsOneWidget);

      await tester.tap(createEventsBtn);
      await tester.pumpAndSettle();
    });

    testWidgets('Test for layout when zero events', (tester) async {
      final model = MainScreenViewModel();
      when(exploreEventsViewModel.events).thenReturn(<Event>[]);
      await tester.pumpWidget(createExploreEventsScreen(model));

      await tester.pumpAndSettle();

      final dropDownBtn = find.byType(DropdownButton<String>);

      await tester.tap(dropDownBtn);
      await tester.pumpAndSettle();

      final createEventsBtn = find.textContaining('Created Events');

      expect(createEventsBtn, findsOneWidget);

      await tester.tap(createEventsBtn);
      await tester.pumpAndSettle();
    });
  });
}
