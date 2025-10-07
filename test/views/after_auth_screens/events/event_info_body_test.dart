import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/models/events/recurrence_rule_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_info_body.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

late EventInfoViewModel _eventInfoViewModel;

/// Creates a test event with configurable properties.
Event getTestEvent({
  bool isPublic = true,
  bool asAdmin = false,
  bool hasRecurrence = false,
  bool hasVenues = false,
  List<Attendee>? attendees,
  List<User>? admins,
}) {
  return Event(
    id: "1",
    name: "test_event",
    creator: User(
      id: asAdmin ? "xzy1" : "acb1",
      firstName: "ravidi",
      lastName: "shaikh",
    ),
    isPublic: isPublic,
    location: "iitbhu, varanasi",
    description: "test_event_description",
    startAt: DateTime.parse('2025-07-28T09:00:00.000Z'),
    endAt: DateTime.parse('2025-07-30T17:00:00.000Z'),
    admins: admins ??
        [
          User(
            firstName: "ravidi_admin_one",
            lastName: "shaikh_admin_one",
          ),
        ],
    attendees: attendees ??
        [
          Attendee(
            id: "1",
            firstName: "Test",
            lastName: "User",
          ),
        ],
    isRegisterable: true,
    recurrenceRule: hasRecurrence
        ? RecurrenceRule(
            frequency: 'WEEKLY',
            interval: 1,
            byDay: ['MO', 'WE', 'FR'],
          )
        : null,
    venues: hasVenues
        ? [
            Venue(
              id: 'venue1',
              name: 'Main Hall',
            ),
          ]
        : null,
  );
}

/// Creates the EventInfoBody widget with necessary wrappers.
Widget createEventInfoBody({
  bool isPublic = true,
  bool asAdmin = false,
  bool hasRecurrence = false,
  bool hasVenues = false,
  List<Attendee>? attendees,
  List<User>? admins,
}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return BaseView<EventInfoViewModel>(
        onModelReady: (model) {
          model.initialize(
            getTestEvent(
              isPublic: isPublic,
              asAdmin: asAdmin,
              hasRecurrence: hasRecurrence,
              hasVenues: hasVenues,
              attendees: attendees,
              admins: admins,
            ),
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
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group("EventInfoBody Comprehensive Tests", () {
    testWidgets("Renders all basic event information correctly",
        (tester) async {
      await tester.pumpWidget(createEventInfoBody());
      await tester.pumpAndSettle();

      // Verify widget exists
      expect(find.byType(EventInfoBody), findsOneWidget);
      expect(find.byType(SliverToBoxAdapter), findsOneWidget);

      // Verify all text content
      expect(find.text("test_event"), findsOneWidget);
      expect(find.text("Created by: ravidi shaikh"), findsOneWidget);
      expect(find.text("2025-07-28 - 2025-07-30"), findsOneWidget);
      expect(find.text("09:00 AM - 05:00 PM"), findsOneWidget);
      expect(find.text("iitbhu, varanasi"), findsOneWidget);
      expect(find.text("test_event_description"), findsOneWidget);
    });

    testWidgets("Shows recurrence information when event is recurring",
        (tester) async {
      await tester.pumpWidget(createEventInfoBody(hasRecurrence: true));
      await tester.pumpAndSettle();

      expect(find.text("Recurring Event"), findsOneWidget);
      expect(find.byIcon(Icons.repeat), findsOneWidget);
      expect(find.textContaining("Repeats weekly"), findsOneWidget);
    });

    testWidgets("Shows venues when provided", (tester) async {
      await tester.pumpWidget(createEventInfoBody(hasVenues: true));
      await tester.pumpAndSettle();

      expect(find.text("Venues"), findsOneWidget);
      expect(find.text("Main Hall"), findsOneWidget);
    });

    testWidgets("Handles empty admins list correctly", (tester) async {
      await tester.pumpWidget(
        createEventInfoBody(
          admins: [],
        ),
      );
      await tester.pumpAndSettle();

      // Should not crash and should handle gracefully
      expect(find.byType(EventInfoBody), findsOneWidget);
    });

    testWidgets("Shows loading state correctly", (tester) async {
      await tester.pumpWidget(createEventInfoBody());
      await tester.pumpAndSettle();

      // Set to busy state
      _eventInfoViewModel.setState(ViewState.busy);
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets("Shows 'No attendees yet' when attendees list is empty",
        (tester) async {
      await tester.pumpWidget(
        createEventInfoBody(
          attendees: [],
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("No attendees yet"), findsOneWidget);
    });
  });
}
