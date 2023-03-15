// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_info_body.dart';
import 'package:talawa/views/after_auth_screens/venue/map_screen.dart';
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
    latitude: viewOnMap ? 40.730610 : null,
    longitude: viewOnMap ? -73.935242 : null,
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
    registrants: [
      User(
        firstName: "Test",
        lastName: "User",
      ),
    ],
    isRegisterable: true,
    isRegistered: false,
  );
}

final exploreEventsViewModel = ExploreEventsViewModel();
late EventInfoViewModel _eventInfoViewModel;

Widget createEventInfoBody({
  bool isPublic = true,
  bool viewOnMap = true,
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
                isPublic: isPublic,
                viewOnMap: viewOnMap,
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
  testSetupLocator();
  // locator<GraphqlConfig>().test();
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
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
      expect(find.text("00/00/0000 - 12/12/9999"), findsOneWidget);
      expect(find.text("00:00 - 24:00"), findsOneWidget);
      expect(find.text("iitbhu, varanasi"), findsOneWidget);
      expect(find.text("View on map"), findsOneWidget);
      expect(find.text("test_event_description"), findsOneWidget);
      expect(find.text("ravidi_admin_one shaikh_admin_one"), findsOneWidget);
      expect(find.text("Test User"), findsOneWidget); // Registrants
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

      // No way to test for now as onTap does nothing.
      // Update this test accordingly in future.

      await tester.tap(find.byKey(const Key("Attendee0")));
      await tester.tap(find.byKey(const Key("Admins0")));

      // View on map
      expect(find.byType(MapScreen), findsNothing);

      await tester.tap(find.textContaining("View on map"));
      await tester.pumpAndSettle();

      // expect(find.byType(MapScreen), findsOneWidget);
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
    testWidgets("Private event", (tester) async {
      await tester.pumpWidget(createEventInfoBody(isPublic: false));
      await tester.pumpAndSettle();

      expect(find.text("private"), findsOneWidget);
      expect(find.byIcon(Icons.lock), findsOneWidget);
    });

    testWidgets("Public event", (tester) async {
      await tester.pumpWidget(createEventInfoBody(isPublic: true));
      await tester.pumpAndSettle();

      expect(find.text("public"), findsOneWidget);
      expect(find.byIcon(Icons.lock_open), findsOneWidget);
    });

    testWidgets("Show View on map", (tester) async {
      // Show view on map

      await tester.pumpWidget(createEventInfoBody());
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is GestureDetector &&
              widget.child is Text &&
              (widget.child! as Text).data == "View on map",
        ),
        findsOneWidget,
      );
    });

    testWidgets("Hide View on map", (tester) async {
      // Don't show view on map

      await tester.pumpWidget(createEventInfoBody(viewOnMap: false));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is GestureDetector &&
              widget.child is Text &&
              (widget.child! as Text).data == "View on map",
        ),
        findsNothing,
      );
    });

    testWidgets("Loading indicator", (tester) async {
      // Don't show view on map

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
