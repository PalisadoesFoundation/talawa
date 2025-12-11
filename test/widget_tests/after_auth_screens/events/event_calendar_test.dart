import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_calendar.dart';

import '../../../helpers/test_helpers.dart';

class _MockInvalidEvent extends Event {
  _MockInvalidEvent() : super(name: 'Invalid');

  @override
  String? get startDate => 'invalid-date';

  @override
  String? get endDate => 'invalid-date';

  @override
  String get startTime => '10:00 AM';

  @override
  String get endTime => '11:00 AM';
}

Widget createEventCalendar() {
  return MaterialApp(
    navigatorKey: navigationService.navigatorKey,
    home: EventCalendar([
      Event(
        name: 'Test',
        startAt: DateTime.parse('2025-07-13T19:10:00.000Z'),
        endAt: DateTime.parse('2025-07-13T20:15:00.000Z'),
      ),
    ]),
  );
}

Widget createEventCalender2() {
  return MaterialApp(
    navigatorKey: navigationService.navigatorKey,
    home: EventCalendar([
      Event(
        name: 'Test2',
        startAt: DateTime.parse('2022-07-14T19:10:00.000Z'),
        endAt: DateTime.parse('2022-07-14T20:15:00.000Z'),
      ),
    ]),
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
  setUp(() {
    registerServices();
  });
  group("Test for _parseTime function", () {
    group('Tests for EventCalendar', () {
      setUp(() => locator.registerSingleton(EventCalendarViewModel()));
      tearDown(() => locator.unregister<EventCalendarViewModel>());
      testWidgets('Testing if EventCalendar shows up', (tester) async {
        await tester.pumpWidget(createEventCalendar());
        await tester.pump();

        expect(find.byType(EventCalendar), findsOneWidget);
      });

      testWidgets('Testing if invalid date format throws exception',
          (tester) async {
        final widget = MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: EventCalendar([_MockInvalidEvent()]),
        );

        await tester.pumpWidget(widget);

        final exception = tester.takeException();
        expect(exception, isNotNull);
        expect(exception, isA<Exception>());
        expect(
          exception.toString(),
          contains('Invalid date format'),
        );
      });

      testWidgets('Testing EventCalendar with null event name', (tester) async {
        await tester.pumpWidget(createEventCalendarWithNullName());
        await tester.pump();

        expect(find.byType(EventCalendar), findsOneWidget);

        final eventCalendar =
            tester.widget<EventCalendar>(find.byType(EventCalendar));
        final event = eventCalendar.eventList[0];
        expect(event.name, isNull);
      });

      testWidgets(
          'Testing EventCalendar with multiple events for color cycling',
          (tester) async {
        await tester.pumpWidget(createEventCalendarWithMultipleEvents());
        await tester.pump();

        expect(find.byType(EventCalendar), findsOneWidget);

        final eventCalendar =
            tester.widget<EventCalendar>(find.byType(EventCalendar));

        expect(eventCalendar.eventList.length, 8);
      });

      testWidgets('Testing onViewChanged callback is triggered',
          (tester) async {
        await tester.pumpWidget(createEventCalendar());
        await tester.pump();

        final calendarFinder = find.byType(SfCalendar);
        expect(calendarFinder, findsOneWidget);

        final SfCalendar calendar = tester.widget(calendarFinder);
        expect(calendar.onViewChanged, isNotNull);

        final testArgs = ViewChangedDetails(
          [
            DateTime(2025, 7, 1),
            DateTime(2025, 7, 2),
            DateTime(2025, 7, 3),
          ],
        );

        calendar.onViewChanged!(testArgs);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      });

      testWidgets('Testing if tapping on date_range shows datePicker',
          (tester) async {
        await tester.pumpWidget(createEventCalendar());
        await tester.pump();

        await tester.tap(find.byIcon(Icons.date_range));
        await tester.pumpAndSettle();

        expect(find.byType(CalendarDatePicker), findsOneWidget);

        await tester.tap(find.text('16'));
        await tester.tap(find.text('OK'));
        await tester.pump();
      });

      testWidgets('calendarViewSelection', (tester) async {
        await tester.pumpWidget(
          createEventCalendar(),
        );

        await tester.pump();

        final popupButtonFinder = find.byType(PopupMenuButton<String>);

        await tester.tap(popupButtonFinder);
        await tester.pumpAndSettle();

        await tester.tap(find.text("Day"));
        await tester.pumpAndSettle();

        await tester.tap(popupButtonFinder);
        await tester.pumpAndSettle();

        await tester.tap(find.text("Month"));
        await tester.pumpAndSettle();

        await tester.tap(popupButtonFinder);
        await tester.pumpAndSettle();

        await tester.tap(find.text("Schedule"));
        await tester.pumpAndSettle();

        await tester.tap(popupButtonFinder);
        await tester.pumpAndSettle();

        expect(find.text("Day"), findsOne);
        expect(find.text("Month"), findsOne);
        expect(find.text("Schedule"), findsOne);
      });

      testWidgets("Testing if EventCalendar handles different date formats",
          (tester) async {
        await tester.pumpWidget(createEventCalender2());
        await tester.pump();

        expect(find.byType(EventCalendar), findsOneWidget);
        final eventCalendar =
            tester.widget<EventCalendar>(find.byType(EventCalendar));
        final event = eventCalendar.eventList[0];

        DateTime? startDate;
        DateTime? endDate;
        if (event.startDate?.contains('/') == true) {
          startDate = DateFormat('MM/dd/yyyy').parse(event.startDate!);
        } else {
          startDate = DateFormat('yyyy-MM-dd').parse(event.startDate!);
        }
        if (event.endDate?.contains('/') == true) {
          endDate = DateFormat('MM/dd/yyyy').parse(event.endDate!);
        } else {
          endDate = DateFormat('yyyy-MM-dd').parse(event.endDate!);
        }

        expect(startDate, DateFormat('yyyy-MM-dd').parse('2022-07-14'));
        expect(endDate, DateFormat('yyyy-MM-dd').parse('2022-07-14'));
      });
    });
    test("dateRangePickerController getter", () {
      final EventCalendarViewModel model = EventCalendarViewModel();
      expect(model.dateRangePickerController, isA<DateRangePickerController>());
      expect(model.eventList, isA<List<Event>>());
    });

    test('parseTime parses 12-hour and 24-hour time formats', () {
      // 12-hour format
      final dt1 = parseTime('6:30 PM');
      expect(dt1.hour, 18);
      expect(dt1.minute, 30);

      // 24-hour format fallback
      final dt2 = parseTime('18:45:00');
      expect(dt2.hour, 18);
      expect(dt2.minute, 45);

      // Invalid format throws
      expect(() => parseTime('invalid'), throwsException);
    });
  });
}
