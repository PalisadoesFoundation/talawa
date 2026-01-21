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
  bool isAllDay = false,
  String? progressLabel,
  int? sequenceNumber,
  int? totalCount,
  Event? baseEvent,
  List<Attendee>? attendees,
  List<User>? admins,
  RecurrenceRule? customRecurrenceRule,
}) {
  return Event(
    id: "1",
    name: "test_event",
    creator: User(
      id: asAdmin ? "xzy1" : "acb1",
      name: "ravidi shaikh",
    ),
    isPublic: isPublic,
    allDay: isAllDay,
    location: "iitbhu, varanasi",
    description: "test_event_description",
    startAt: DateTime.parse('2025-07-28T09:00:00.000Z'),
    endAt: DateTime.parse('2025-07-30T17:00:00.000Z'),
    progressLabel: progressLabel,
    sequenceNumber: sequenceNumber,
    totalCount: totalCount,
    baseEvent: baseEvent,
    admins: admins ??
        [
          User(
            name: "ravidi_admin_one shaikh_admin_one",
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
    recurrenceRule: customRecurrenceRule ??
        (hasRecurrence
            ? RecurrenceRule(
                frequency: 'WEEKLY',
                interval: 1,
                byDay: ['MO', 'WE', 'FR'],
              )
            : null),
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
  bool isAllDay = false,
  String? progressLabel,
  int? sequenceNumber,
  int? totalCount,
  Event? baseEvent,
  List<Attendee>? attendees,
  List<User>? admins,
  RecurrenceRule? customRecurrenceRule,
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
              isAllDay: isAllDay,
              progressLabel: progressLabel,
              sequenceNumber: sequenceNumber,
              totalCount: totalCount,
              baseEvent: baseEvent,
              attendees: attendees,
              admins: admins,
              customRecurrenceRule: customRecurrenceRule,
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

    testWidgets("Shows attendee list when attendees exist", (tester) async {
      final attendees = [
        Attendee(id: "1", firstName: "John", lastName: "Doe"),
        Attendee(id: "2", firstName: "Jane", lastName: "Smith"),
      ];

      await tester.pumpWidget(
        createEventInfoBody(attendees: attendees),
      );
      await tester.pumpAndSettle();

      // Should show attendee names
      expect(find.textContaining("John Doe"), findsOneWidget);
      expect(find.textContaining("Jane Smith"), findsOneWidget);
      // Should not show "No attendees yet"
      expect(find.text("No attendees yet"), findsNothing);
    });

    testWidgets("Shows 'All day' chip when event is all day", (tester) async {
      await tester.pumpWidget(createEventInfoBody(isAllDay: true));
      await tester.pumpAndSettle();

      expect(find.text("All day"), findsOneWidget);
      expect(find.byType(Chip), findsOneWidget);

      // Verify chip styling
      final chip = tester.widget<Chip>(find.byType(Chip));
      expect(chip.padding, EdgeInsets.zero);
      expect(chip.materialTapTargetSize, MaterialTapTargetSize.shrinkWrap);
    });

    testWidgets("Does not show 'All day' chip when event is not all day",
        (tester) async {
      await tester.pumpWidget(createEventInfoBody(isAllDay: false));
      await tester.pumpAndSettle();

      expect(find.text("All day"), findsNothing);
      expect(find.byType(Chip), findsNothing);
    });

    testWidgets("Shows public event icon correctly", (tester) async {
      await tester.pumpWidget(createEventInfoBody(isPublic: true));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.lock_open), findsOneWidget);
      expect(find.text("public"), findsOneWidget);
    });

    testWidgets("Shows private event icon correctly", (tester) async {
      await tester.pumpWidget(createEventInfoBody(isPublic: false));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.lock), findsOneWidget);
      expect(find.text("private"), findsOneWidget);
    });

    testWidgets("Shows progress label in recurring event section",
        (tester) async {
      await tester.pumpWidget(
        createEventInfoBody(
          hasRecurrence: true,
          progressLabel: "Event 3 of 10",
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("Recurring Event"), findsOneWidget);
      expect(find.text("Event 3 of 10"), findsOneWidget);
      expect(find.byIcon(Icons.event_repeat), findsOneWidget);
    });

    testWidgets("Shows sequence number and total count", (tester) async {
      await tester.pumpWidget(
        createEventInfoBody(
          hasRecurrence: true,
          sequenceNumber: 5,
          totalCount: 12,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("Event 5 of 12"), findsOneWidget);
      expect(find.byIcon(Icons.numbers), findsOneWidget);
    });

    testWidgets("Shows base event information", (tester) async {
      final baseEvent = Event(
        id: "base1",
        name: "Conference Series",
      );

      await tester.pumpWidget(
        createEventInfoBody(
          hasRecurrence: true,
          baseEvent: baseEvent,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("Part of: Conference Series"), findsOneWidget);
      expect(find.byIcon(Icons.event_note), findsOneWidget);
    });

    testWidgets("Shows base event with fallback name when name is null",
        (tester) async {
      final baseEvent = Event(
        id: "base1",
        name: null,
      );

      await tester.pumpWidget(
        createEventInfoBody(
          hasRecurrence: true,
          baseEvent: baseEvent,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("Part of: Event series"), findsOneWidget);
    });
  });

  group("Recurrence Rule Formatting Tests", () {
    testWidgets("Formats daily recurrence rule correctly", (tester) async {
      final rule = RecurrenceRule(
        frequency: 'DAILY',
        interval: 1,
      );

      await tester.pumpWidget(
        createEventInfoBody(
          customRecurrenceRule: rule,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining("Repeats daily"), findsOneWidget);
    });

    testWidgets("Formats daily recurrence with interval correctly",
        (tester) async {
      final rule = RecurrenceRule(
        frequency: 'DAILY',
        interval: 3,
      );

      await tester.pumpWidget(
        createEventInfoBody(
          customRecurrenceRule: rule,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining("Repeats every 3 days"), findsOneWidget);
    });

    testWidgets("Formats weekly recurrence with days correctly",
        (tester) async {
      final rule = RecurrenceRule(
        frequency: 'WEEKLY',
        interval: 2,
        byDay: ['MO', 'WE', 'FR'],
      );

      await tester.pumpWidget(
        createEventInfoBody(
          customRecurrenceRule: rule,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining("Repeats every 2 weeks"), findsOneWidget);
      expect(find.textContaining("on MO, WE, FR"), findsOneWidget);
    });

    testWidgets("Formats monthly recurrence with month day correctly",
        (tester) async {
      final rule = RecurrenceRule(
        frequency: 'MONTHLY',
        interval: 1,
        byMonthDay: [15, 30],
      );

      await tester.pumpWidget(
        createEventInfoBody(
          customRecurrenceRule: rule,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining("Repeats monthly"), findsOneWidget);
      expect(find.textContaining("on day 15, 30"), findsOneWidget);
    });

    testWidgets("Formats yearly recurrence with months correctly",
        (tester) async {
      final rule = RecurrenceRule(
        frequency: 'YEARLY',
        interval: 1,
        byMonth: [6, 12],
      );

      await tester.pumpWidget(
        createEventInfoBody(
          customRecurrenceRule: rule,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining("Repeats yearly"), findsOneWidget);
      expect(find.textContaining("in 6, 12"), findsOneWidget);
    });

    testWidgets("Formats recurrence with count correctly", (tester) async {
      final rule = RecurrenceRule(
        frequency: 'WEEKLY',
        interval: 1,
        count: 5,
      );

      await tester.pumpWidget(
        createEventInfoBody(
          customRecurrenceRule: rule,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining("Repeats weekly"), findsOneWidget);
      expect(find.textContaining(", 5 times"), findsOneWidget);
    });

    testWidgets("Formats recurrence with end date correctly", (tester) async {
      final rule = RecurrenceRule(
        frequency: 'DAILY',
        interval: 1,
        recurrenceEndDate: DateTime.parse('2025-12-31T00:00:00.000Z'),
      );

      await tester.pumpWidget(
        createEventInfoBody(
          customRecurrenceRule: rule,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining("Repeats daily"), findsOneWidget);
      expect(find.textContaining(", until Dec 31, 2025"), findsOneWidget);
    });

    testWidgets("Formats unknown frequency correctly", (tester) async {
      final rule = RecurrenceRule(
        frequency: 'CUSTOM',
        interval: 1,
      );

      await tester.pumpWidget(
        createEventInfoBody(
          customRecurrenceRule: rule,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining("custom"), findsOneWidget);
    });

    testWidgets("Formats unknown frequency with interval 1 correctly",
        (tester) async {
      final rule = RecurrenceRule(
        frequency: 'UNKNOWN_FREQ',
        interval: 1,
      );

      await tester.pumpWidget(
        createEventInfoBody(
          customRecurrenceRule: rule,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining("unknown_freq"), findsOneWidget);
    });

    testWidgets("Formats unknown frequency with interval > 1 correctly",
        (tester) async {
      final rule = RecurrenceRule(
        frequency: 'CUSTOM_TYPE',
        interval: 3,
      );

      await tester.pumpWidget(
        createEventInfoBody(
          customRecurrenceRule: rule,
        ),
      );
      await tester.pumpAndSettle();

      // Should show "Repeats every 3 custom_types"
      expect(find.textContaining("Repeats every 3"), findsOneWidget);
      expect(find.textContaining("custom_type"), findsOneWidget);
    });
  });
}
