import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_calendar.dart';

import '../../../helpers/test_helpers.dart';

/// Creates a test event with the given parameters.
///
/// **params**:
/// * `id`: Event ID
/// * `name`: Event name
/// * `startAt`: Event start date and time
/// * `endAt`: Event end date and time
/// * `isAllDay`: Whether the event is all day
///
/// **returns**:
/// * `Event`: Test event instance
Event createTestEvent({
  required String id,
  required String name,
  required DateTime startAt,
  required DateTime endAt,
  bool isAllDay = false,
  String? location,
}) {
  return Event(
    id: id,
    name: name,
    location: location,
    description: 'Test event description',
    startAt: startAt,
    endAt: endAt,
    allDay: isAllDay,
    isPublic: true,
    isRegisterable: true,
    isRegistered: false,
    creator: User(
      id: "user1",
      name: "Test User",
      email: "test@example.com",
      refreshToken: "testtoken",
      authToken: 'testtoken',
    ),
    organization: OrgInfo(id: 'org1', name: 'Test Org'),
  );
}

/// Creates the EventCalendar widget for testing.
///
/// **params**:
///   None
///
/// **returns**:
/// * `Widget`: EventCalendar wrapped in MaterialApp
Widget createEventCalendarWidget() {
  return MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      const AppLocalizationsDelegate(isTest: true),
    ],
    navigatorKey: navigationService.navigatorKey,
    onGenerateRoute: router.generateRoute,
    home: const EventCalendar(),
  );
}

Widget createEmptyEventCalendar() {
  return MaterialApp(
    navigatorKey: navigationService.navigatorKey,
    home: const EventCalendar([]),
  );
}

Widget createEventCalendarWithNullName() {
  return MaterialApp(
    navigatorKey: navigationService.navigatorKey,
    home: EventCalendar([
      Event(
        name: null,
        startAt: DateTime.parse('2025-07-13T19:10:00.000Z'),
        endAt: DateTime.parse('2025-07-13T20:15:00.000Z'),
      ),
    ]),
  );
}

Widget createEventCalendarWithMultipleEvents() {
  return MaterialApp(
    navigatorKey: navigationService.navigatorKey,
    home: EventCalendar([
      for (int i = 0; i < 8; i++)
        Event(
          name: 'Event $i',
          startAt: DateTime.parse('2025-07-${13 + i}T19:10:00.000Z'),
          endAt: DateTime.parse('2025-07-${13 + i}T20:15:00.000Z'),
        ),
    ]),
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    SizeConfig().test();
    registerServices();
    registerViewModels();
  });

  tearDown(() {
    unregisterViewModels();
    unregisterServices();
  });

  group('EventCalendar Widget Tests', () {
    testWidgets('EventCalendar renders correctly', (tester) async {
      await tester.pumpWidget(createEventCalendarWidget());
      await tester.pumpAndSettle();

      expect(find.byType(EventCalendar), findsOneWidget);
      expect(find.byType(SfCalendar), findsOneWidget);
      expect(find.text('Explore Events'), findsOneWidget);
    });

    testWidgets('AppBar contains required action buttons', (tester) async {
      await tester.pumpWidget(createEventCalendarWidget());
      await tester.pumpAndSettle();

      // Check for menu icon
      expect(find.byIcon(Icons.menu), findsOneWidget);

      // Check for date_range icon
      expect(find.byIcon(Icons.date_range), findsOneWidget);

      // Check for add icon
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('Tapping date_range icon shows date picker', (tester) async {
      await tester.pumpWidget(createEventCalendarWidget());
      await tester.pumpAndSettle();

      // Tap the date range icon
      await tester.tap(find.byIcon(Icons.date_range));
      await tester.pumpAndSettle();

      // Verify date picker appears
      expect(find.byType(CalendarDatePicker), findsOneWidget);
    });

    testWidgets('Tapping add icon navigates to event form', (tester) async {
      await tester.pumpWidget(createEventCalendarWidget());
      await tester.pumpAndSettle();

      // Tap the add icon
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Navigation would be verified by checking the route
      verify(navigationService.pushScreen('/eventPageForm')).called(1);
    });

    testWidgets('Calendar displays in month view by default', (tester) async {
      await tester.pumpWidget(createEventCalendarWidget());
      await tester.pumpAndSettle();

      final calendar = tester.widget<SfCalendar>(find.byType(SfCalendar));
      expect(calendar.view, CalendarView.month);
    });

    testWidgets('Menu icon opens drawer when available', (tester) async {
      // Create a scaffold with drawer
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            const AppLocalizationsDelegate(isTest: true),
          ],
          navigatorKey: navigationService.navigatorKey,
          home: const Scaffold(
            drawer: Drawer(child: Text('Drawer')),
            body: EventCalendar(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Tap menu icon
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      // Drawer should be visible
      expect(find.text('Drawer'), findsOneWidget);
    });
  });

  group('EventCalendarViewModel Tests', () {
    test('ViewModel initializes with correct default values', () {
      final model = EventCalendarViewModel();

      expect(model.eventList, isEmpty);
      expect(model.calendarController, isA<CalendarController>());
      expect(model.dateRangePickerController, isA<DateRangePickerController>());

      model.dispose();
    });

    test('ViewModel initializes and sets month view', () async {
      final model = EventCalendarViewModel();
      model.initialize();

      // Wait for async initialization to complete
      await Future.delayed(const Duration(milliseconds: 100));

      expect(model.calendarView, CalendarView.month);

      model.dispose();

      // Wait for dispose to complete
      await Future.delayed(const Duration(milliseconds: 100));
    });

    test('dispose cancels subscriptions and disposes controllers', () async {
      final model = EventCalendarViewModel();
      model.initialize();

      // Wait for initialization
      await Future.delayed(const Duration(milliseconds: 100));

      // Should not throw when disposing
      expect(() => model.dispose(), returnsNormally);

      // Wait for dispose to complete
      await Future.delayed(const Duration(milliseconds: 100));
    });
  });

  group('Event Model Date Parsing Tests', () {
    test('Event startDate formats correctly', () {
      final event = createTestEvent(
        id: '1',
        name: 'Test',
        startAt: DateTime.parse('2025-07-13T19:10:00.000Z'),
        endAt: DateTime.parse('2025-07-13T20:15:00.000Z'),
      );

      expect(event.startDate, isNotNull);
      expect(event.startDate, contains('2025-07-13'));
    });

    test('Event endDate formats correctly', () {
      final event = createTestEvent(
        id: '1',
        name: 'Test',
        startAt: DateTime.parse('2025-07-13T19:10:00.000Z'),
        endAt: DateTime.parse('2025-07-14T20:15:00.000Z'),
      );

      expect(event.endDate, isNotNull);
      expect(event.endDate, contains('2025-07-14'));
    });

    test('Event startTime formats correctly', () {
      final event = createTestEvent(
        id: '1',
        name: 'Test',
        startAt: DateTime.parse('2025-07-13T14:30:00.000Z').toLocal(),
        endAt: DateTime.parse('2025-07-13T16:45:00.000Z').toLocal(),
      );

      expect(event.startTime, isNotEmpty);
      expect(event.startTime, matches(RegExp(r'\d{2}:\d{2} [AP]M')));
    });

    test('Event endTime formats correctly', () {
      final event = createTestEvent(
        id: '1',
        name: 'Test',
        startAt: DateTime.parse('2025-07-13T14:30:00.000Z').toLocal(),
        endAt: DateTime.parse('2025-07-13T16:45:00.000Z').toLocal(),
      );

      expect(event.endTime, isNotEmpty);
      expect(event.endTime, matches(RegExp(r'\d{2}:\d{2} [AP]M')));
    });

    test('All-day event properties', () {
      final event = createTestEvent(
        id: '1',
        name: 'All Day Event',
        startAt: DateTime(2025, 7, 15),
        endAt: DateTime(2025, 7, 15, 23, 59),
        isAllDay: true,
      );

      expect(event.allDay, isTrue);
      expect(event.startDate, '2025-07-15');
      expect(event.endDate, '2025-07-15');
    });
  });
}
