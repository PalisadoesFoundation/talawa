// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_calendar.dart';
import 'package:talawa/views/after_auth_screens/events/explore_event_dialogue.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/widgets/custom_drawer.dart';
import 'package:talawa/widgets/event_card.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';
import '../../../helpers/test_locator.dart';

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
        body: const ExploreEvents(
          key: Key('ExploreEvents'),
        ),
      ),
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: router.generateRoute,
    );

void main() {
  SizeConfig().test();
  setUp(() {
    registerServices();
    registerViewModels();
  });
  tearDown(() {
    unregisterViewModels();
  });
  group("Test Explore Events Screen Widget:", () {
    testWidgets("Testing if drawer opens up", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pump();
        // find by icon menu
        expect(find.byIcon(Icons.menu), findsOneWidget);
        // tap on icon menu
        await tester.tap(find.byIcon(Icons.menu));
        await tester.pump();

        // expect the drawer to be open
        expect(find.byType(CustomDrawer), findsOneWidget);
      });
    });
    testWidgets("Testing if showSearch works", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.search), findsOneWidget);

        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.clear), findsOneWidget);
        expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      });
    });
    testWidgets("Testing if refresh works", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        await tester.drag(
          find.byKey(const Key('ExploreEvents')),
          const Offset(0, 500),
        );
        await tester.pumpAndSettle();

        verify(locator<ExploreEventsViewModel>().refreshEvents()).called(2);
      });
    });
    testWidgets("Testing if tapping on add icon and EventCard works",
        (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();

        verify(locator<NavigationService>().pushScreen("/createEventPage"))
            .called(1);

        await tester.tap(find.byType(EventCard));
        await tester.pumpAndSettle();

        verify(
          locator<NavigationService>()
              .pushScreen("/eventInfo", arguments: anyNamed('arguments')),
        ).called(1);
      });
    });
    testWidgets("Testing if drop down button works", (tester) async {
      await mockNetworkImages(() async {
        locator.unregister<ExploreEventsViewModel>();

        final model = ExploreEventsViewModel();
        locator.registerSingleton(model);

        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(DropdownButtonHideUnderline));
        await tester.pumpAndSettle();

        await tester.tap(find.bySemanticsLabel('Created Events'));
        await tester.pumpAndSettle();

        expect(model.chosenValue, 'Created Events');
      });
    });
    testWidgets("Testing if tapping on calendar works", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Add Date'));
        await tester.pump();

        expect(find.byType(ExploreEventDialog), findsOneWidget);
      });
    });
    testWidgets("Testing if tapping on calendar works", (tester) async {
      await mockNetworkImages(() async {
        locator.unregister<EventService>();

        final StreamController<Event> streamController = StreamController();
        final Stream<Event> stream =
            streamController.stream.asBroadcastStream();

        final service = MockEventService();
        when(service.eventStream).thenAnswer((invocation) => stream);
        locator.registerSingleton<EventService>(service);

        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        expect(
          find.text("Looks like there aren't any events."),
          findsOneWidget,
        );
      });
    });
    testWidgets("Testing if tapping on Calendar button works", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        expect(find.byType(EventCalendar), findsNothing);

        await tester.tap(
          find.byIcon(
            Icons.calendar_month,
          ),
        );
        await tester.pumpAndSettle();
      });
    });
  });
}
