import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/widgets/date_time_picker.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

final chooseDate = DateTime(2020, 04, 03);
final cancelDate = DateTime(2017, 11, 16);
late DateTime testDate;

const chooseTime = TimeOfDay(hour: 10, minute: 10);
const cancelTime = TimeOfDay(hour: 5, minute: 5);
late TimeOfDay testTime;

Widget dateTimePicker({required dynamic checkProp, bool isTimeType = false}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
    home: Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            if (isTimeType) {
              testTime =
                  await customTimePicker(initialTime: checkProp as TimeOfDay);
            } else {
              testDate =
                  await customDatePicker(initialDate: checkProp as DateTime);
            }
          },
          child: const Text('Open'),
        ),
      ),
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  registerServices();

  group('TimePicker tests', () {
    testWidgets('Check if time picker shows up', (tester) async {
      await tester.pumpWidget(
          dateTimePicker(checkProp: TimeOfDay.now(), isTimeType: true));

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(TimePickerDialog), findsOneWidget);
    });

    testWidgets('Check if selecting a time works', (tester) async {
      await tester
          .pumpWidget(dateTimePicker(checkProp: chooseTime, isTimeType: true));

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.textContaining('OK'));

      expect(testTime, chooseTime);
    });

    testWidgets('Check if cancelling the time picker works', (tester) async {
      await tester
          .pumpWidget(dateTimePicker(checkProp: cancelTime, isTimeType: true));

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.textContaining('CANCEL'));

      expect(testTime, cancelTime);
    });
  });

  group('DatePicker tests', () {
    testWidgets('Check if date picker shows up', (tester) async {
      await tester.pumpWidget(dateTimePicker(checkProp: DateTime.now()));

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(DatePickerDialog), findsOneWidget);
    });

    testWidgets('Check if selecting a date works', (tester) async {
      await tester.pumpWidget(dateTimePicker(checkProp: chooseDate));

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.textContaining('OK'));

      expect(testDate, chooseDate);
    });

    testWidgets('Check if cancelling the date picker works', (tester) async {
      await tester.pumpWidget(dateTimePicker(checkProp: cancelDate));

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.textContaining('CANCEL'));

      expect(testDate, cancelDate);
    });
  });
}
