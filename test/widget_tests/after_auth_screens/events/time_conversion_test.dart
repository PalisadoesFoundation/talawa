import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/time_conversion.dart';

import '../../../helpers/test_helpers.dart';

void main() {
  group('Time Conversion Utils', () {
    setUp(() {
      registerServices();
    });

    tearDown(() {
      unregisterServices();
    });

    test('combineDateTime combines date and time correctly', () {
      expect(combineDateTime('2023-05-01', '14:30:00'), '2023-05-01 14:30:00');
    });

    test('splitDateTimeUTC splits UTC datetime correctly', () {
      final result = splitDateTimeUTC('2023-05-01T14:30:00.000Z');
      expect(result['date'], '2023-05-01');
      expect(result['time'], '14:30:00.000Z');
    });

    test('splitDateTimeLocal splits local datetime correctly', () {
      final result = splitDateTimeLocal('2023-05-01T14:30:00.000');
      expect(result['date'], '2023-05-01');
      expect(result['time'], '14:30');
    });

    test('convertUTCToLocal converts UTC to local time', () {
      const utcTime = '2023-05-01T14:30:00.000Z';
      final localTime = convertUTCToLocal(utcTime);
      expect(localTime, isNot(equals(utcTime)));
      expect(
        localTime,
        matches(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}$'),
      );
    });

    test('convertLocalToUTC converts local to UTC time', () {
      const localTime = '2023-05-01T14:30:00.000';
      final utcTime = convertLocalToUTC(localTime);
      expect(utcTime, isNot(equals(localTime)));
      expect(
        utcTime,
        matches(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z$'),
      );
    });

    group('traverseAndConvertDates', () {
      test('converts direct fields', () {
        final testObj = {
          'createdAt': '2023-05-01T14:30:00.000Z',
          'name': 'Test',
        };
        traverseAndConvertDates(testObj, convertUTCToLocal, splitDateTimeLocal);
        expect(testObj['createdAt'], isNot(equals('2023-05-01T14:30:00.000Z')));
        expect(
          testObj['createdAt'],
          matches(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}$'),
        );
      });

      test('converts paired fields', () {
        final testObj = {
          'startDate': '2023-05-01',
          'startTime': '14:30:00',
          'name': 'Test',
        };
        traverseAndConvertDates(testObj, convertUTCToLocal, splitDateTimeLocal);
        expect(testObj['startDate'], '2023-05-01');
        expect(testObj['startTime'], matches(r'^\d{2}:\d{2}$'));
      });

      test('converts nested objects', () {
        final testObj = {
          'user': {
            'createdAt': '2023-05-01T14:30:00.000Z',
            'name': 'Test User',
          },
        };
        traverseAndConvertDates(testObj, convertUTCToLocal, splitDateTimeLocal);
        expect(
          testObj['user']?['createdAt'],
          isNot(equals('2023-05-01T14:30:00.000Z')),
        );
        expect(
          testObj['user']?['createdAt'],
          matches(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}$'),
        );
      });

      test('converts objects in lists', () {
        withClock(Clock.fixed(DateTime.utc(2023, 5, 1, 12, 0)), () {
          final testObj = {
            'items': [
              {'createdAt': '2023-05-01T14:30:00.000Z'},
              {'createdAt': '2023-05-02T15:45:00.000Z'},
            ],
          };
          traverseAndConvertDates(
            testObj,
            convertUTCToLocal,
            splitDateTimeLocal,
          );
          expect(
            testObj['items']?[0]['createdAt'],
            isNot(equals('2023-05-01T14:30:00.000Z')),
          );
          expect(
            testObj['items']?[0]['createdAt'],
            matches(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}$'),
          );
          expect(
            testObj['items']?[1]['createdAt'],
            isNot(equals('2023-05-02T15:45:00.000Z')),
          );
          expect(
            testObj['items']?[1]['createdAt'],
            matches(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}$'),
          );
        });
      });
    });
  });
}
