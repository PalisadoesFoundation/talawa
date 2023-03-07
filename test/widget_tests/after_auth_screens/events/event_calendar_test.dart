// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_calendar.dart';

import '../../../helpers/test_helpers.dart';

Widget createEventCalendar() {
  return MaterialApp(
    navigatorKey: navigationService.navigatorKey,
    home: EventCalendar([
      Event(
        title: 'Test',
        startDate: '07/14/2022',
        startTime: '7:00 PM',
        endDate: '07/14/2022',
        endTime: '8:00 PM',
      )
    ]),
  );
}

void main() {
  setUp(() {
    registerServices();
  });
  group('Tests for EventCalendar', () {
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
  });
}
