// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_calendar.dart';

import '../../../helpers/test_helpers.dart';

Widget createEventCalendar() {
  return MaterialApp(
    navigatorKey: navigationService.navigatorKey,
    home: EventCalendar([
      Event(
        title: 'Test',
        startDate: '07/14/2022',
        startTime: '14:23:01',
        endDate: '07/14/2022',
        endTime: '21:23:01',
      ),
    ]),
  );
}

void main() {
  setUp(() {
    registerServices();
  });
  group("Test for _parseTime function", () {
    test("Test parsing valid time string", () {
      const timeString = "5:30 PM";
      final parsedTime = parseTime(timeString);
      final expectedTime = DateFormat("h:mm a").parse(timeString);
      expect(parsedTime, expectedTime);
    });
    test("Test for invalid time string", () {
      const timeString = "invalid String ";

      expect(() => parseTime(timeString), throwsException);
    });
    test("Test parsing  string in hms format", () {
      const timeString = "12:12:12";

      final parsedTime = parseTime(timeString);
      final expectTime = DateFormat('Hms').parse(timeString);

      expect(expectTime, parsedTime);
    });
  });
  group('Tests for EventCalendar', () {
    setUp(() => locator.registerSingleton(EventCalendarViewModel()));
    tearDown(() => locator.unregister<EventCalendarViewModel>());
    testWidgets('Testing if EventCalendar shows up', (tester) async {
      await tester.pumpWidget(createEventCalendar());
      await tester.pump();

      expect(find.byType(EventCalendar), findsOneWidget);
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

    test("dateRangePickerController getter", () async {
      final EventCalendarViewModel model = EventCalendarViewModel();
      expect(model.dateRangePickerController, isA<DateRangePickerController>());
      expect(model.eventList, isA<List<Event>>());
    });
  });
}
