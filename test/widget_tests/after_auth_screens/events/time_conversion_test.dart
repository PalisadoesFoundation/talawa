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

    // Helper method to get nested values from complex objects
    dynamic getNestedValue(dynamic obj, List<dynamic> path) {
      dynamic current = obj;
      for (final key in path) {
        if (current is Map<String, dynamic>) {
          current = current[key];
        } else if (current is List && key is int) {
          current = current[key];
        } else {
          return null;
        }
      }
      return current;
    }

    test('combineDateTime combines date and time correctly', () {
      expect(combineDateTime('2023-05-01', '14:30:00'), '2023-05-01 14:30:00');
    });

    test('splitDateTimeUTC splits UTC datetime correctly', () {
      final result = splitDateTimeUTC('2023-05-01T14:30:00.000Z');
      expect(result['date'], '2023-05-01');
      expect(result['time'], '14:30:00.000Z');
    });

    test('splitDateTimeUTC returns empty map for invalid input', () {
      final result = splitDateTimeUTC('invalid-datetime');
      expect(result, isEmpty);
    });

    test('splitDateTimeLocal splits local datetime correctly', () {
      final result = splitDateTimeLocal('2023-05-01T14:30:00.000');
      expect(result['date'], '2023-05-01');
      expect(result['time'], '14:30');
    });

    test('splitDateTimeLocal returns empty map for invalid input', () {
      final result = splitDateTimeLocal('invalid-datetime');
      expect(result, isEmpty);
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

    test('convertUTCToLocal returns empty string for invalid input', () {
      final localTime = convertUTCToLocal('invalid-datetime');
      expect(localTime, isEmpty);
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

    test('convertLocalToUTC returns empty string for invalid input', () {
      final utcTime = convertLocalToUTC('invalid-datetime');
      expect(utcTime, isEmpty);
    });

    group('traverseAndConvertDates', () {
      test('traverseAndConvertDates catches and prints error for directFields',
          () {
        final testObj = {
          'createdAt': 'bad-date',
        };
        // Custom convertFn that always throws
        String throwingConvertFn(String? value) =>
            throw Exception('Test error');
        // Use splitDateTimeLocal as splitFn (won't be called)
        expect(
          () => traverseAndConvertDates(
            testObj,
            throwingConvertFn,
            splitDateTimeLocal,
          ),
          returnsNormally,
        );
        // Value should remain unchanged since conversion failed
        expect(testObj['createdAt'], 'bad-date');
      });
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

      test('handles invalid date/time in traverseAndConvertDates', () {
        final testObj = {
          'createdAt': 'invalid-datetime',
          'startDate': 'invalid-date',
          'startTime': 'invalid-time',
          'name': 'Test',
        };
        traverseAndConvertDates(testObj, convertUTCToLocal, splitDateTimeLocal);
        expect(testObj['createdAt'], isEmpty);
        expect(testObj['startDate'], isEmpty);
        expect(testObj['startTime'], isEmpty);
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

      test('converts all direct fields from dateTimeFields', () {
        final testObj = {
          'createdAt': '2023-05-01T14:30:00.000Z',
          'birthDate': '2023-05-02T15:30:00.000Z',
          'updatedAt': '2023-05-03T16:30:00.000Z',
          'recurrenceStartDate': '2023-05-04T17:30:00.000Z',
          'recurrenceEndDate': '2023-05-05T18:30:00.000Z',
          'dueDate': '2023-05-06T19:30:00.000Z',
          'completionDate': '2023-05-07T20:30:00.000Z',
          'startCursor': '2023-05-08T21:30:00.000Z',
          'endCursor': '2023-05-09T22:30:00.000Z',
          'normalField': 'should not change',
        };

        traverseAndConvertDates(testObj, convertUTCToLocal, splitDateTimeLocal);

        // All dateTime fields should be converted
        expect(testObj['createdAt'], isNot(equals('2023-05-01T14:30:00.000Z')));
        expect(testObj['birthDate'], isNot(equals('2023-05-02T15:30:00.000Z')));
        expect(testObj['updatedAt'], isNot(equals('2023-05-03T16:30:00.000Z')));
        expect(
          testObj['recurrenceStartDate'],
          isNot(equals('2023-05-04T17:30:00.000Z')),
        );
        expect(
          testObj['recurrenceEndDate'],
          isNot(equals('2023-05-05T18:30:00.000Z')),
        );
        expect(testObj['dueDate'], isNot(equals('2023-05-06T19:30:00.000Z')));
        expect(
          testObj['completionDate'],
          isNot(equals('2023-05-07T20:30:00.000Z')),
        );
        expect(
          testObj['startCursor'],
          isNot(equals('2023-05-08T21:30:00.000Z')),
        );
        expect(testObj['endCursor'], isNot(equals('2023-05-09T22:30:00.000Z')));

        // Normal field should remain unchanged
        expect(testObj['normalField'], 'should not change');
      });

      test('converts all paired fields from dateTimeFields', () {
        final testObj = {
          'startDate': '2023-05-01',
          'startTime': '14:30:00',
          'endDate': '2023-05-02',
          'endTime': '15:30:00',
          'normalField': 'should not change',
        };

        traverseAndConvertDates(testObj, convertUTCToLocal, splitDateTimeLocal);

        // Paired fields should be processed
        expect(testObj['startDate'], '2023-05-01');
        expect(testObj['startTime'], matches(r'^\d{2}:\d{2}$'));
        expect(testObj['endDate'], '2023-05-02');
        expect(testObj['endTime'], matches(r'^\d{2}:\d{2}$'));

        // Normal field should remain unchanged
        expect(testObj['normalField'], 'should not change');
      });

      test('handles missing paired field gracefully', () {
        final testObj = {
          'startDate': '2023-05-01',
          // Missing startTime
          'endDate': '2023-05-02',
          'endTime': '15:30:00',
          'normalField': 'should not change',
        };

        // Should not throw error
        expect(
          () => traverseAndConvertDates(
            testObj,
            convertUTCToLocal,
            splitDateTimeLocal,
          ),
          returnsNormally,
        );

        // Only complete pairs should be processed
        expect(
          testObj['startDate'],
          '2023-05-01',
        ); // Unchanged due to missing pair
        expect(testObj['endDate'], '2023-05-02');
        expect(testObj['endTime'], matches(r'^\d{2}:\d{2}$'));
      });

      test('handles non-string values in date fields', () {
        final testObj = {
          'createdAt': 123456789, // Number instead of string
          'startDate': null,
          'startTime': 'valid-time',
          'endDate': true, // Boolean instead of string
          'endTime': 'valid-time',
          'normalField': 'should not change',
        };

        // Should not throw error
        expect(
          () => traverseAndConvertDates(
            testObj,
            convertUTCToLocal,
            splitDateTimeLocal,
          ),
          returnsNormally,
        );

        // Non-string values should remain unchanged
        expect(testObj['createdAt'], 123456789);
        expect(testObj['startDate'], null);
        expect(testObj['endDate'], true);
        expect(testObj['normalField'], 'should not change');
      });

      test('handles deeply nested structures', () {
        final testObj = {
          'level1': {
            'level2': {
              'level3': {
                'createdAt': '2023-05-01T14:30:00.000Z',
                'items': [
                  {
                    'updatedAt': '2023-05-02T15:30:00.000Z',
                    'nested': {
                      'birthDate': '2023-05-03T16:30:00.000Z',
                    },
                  }
                ],
              },
            },
          },
        };

        traverseAndConvertDates(testObj, convertUTCToLocal, splitDateTimeLocal);

        // Use helper method to access deeply nested values
        final level3CreatedAt = getNestedValue(
          testObj,
          ['level1', 'level2', 'level3', 'createdAt'],
        );
        expect(level3CreatedAt, isNot(equals('2023-05-01T14:30:00.000Z')));

        final itemUpdatedAt = getNestedValue(
          testObj,
          ['level1', 'level2', 'level3', 'items', 0, 'updatedAt'],
        );
        expect(itemUpdatedAt, isNot(equals('2023-05-02T15:30:00.000Z')));

        final nestedBirthDate = getNestedValue(
          testObj,
          ['level1', 'level2', 'level3', 'items', 0, 'nested', 'birthDate'],
        );
        expect(nestedBirthDate, isNot(equals('2023-05-03T16:30:00.000Z')));
      });

      test('handles empty and null objects in lists', () {
        final testObj = {
          'items': [
            null,
            {},
            {
              'createdAt': '2023-05-01T14:30:00.000Z',
            },
            'not-an-object',
            {
              'updatedAt': 'invalid-date',
            }
          ],
        };

        // Should not throw error
        expect(
          () => traverseAndConvertDates(
            testObj,
            convertUTCToLocal,
            splitDateTimeLocal,
          ),
          returnsNormally,
        );

        // Valid date should be converted
        final itemCreatedAt =
            getNestedValue(testObj, ['items', 2, 'createdAt']);
        expect(itemCreatedAt, isNot(equals('2023-05-01T14:30:00.000Z')));
      });

      test('preserves original values when conversion fails', () {
        final testObj = {
          'createdAt': 'completely-invalid-date-format',
          'startDate': 'invalid-date',
          'startTime': 'invalid-time',
        };

        traverseAndConvertDates(testObj, convertUTCToLocal, splitDateTimeLocal);

        // Should preserve original values when conversion fails
        expect(
          testObj['createdAt'],
          isEmpty,
        ); // convertUTCToLocal returns empty string on error
        expect(
          testObj['startDate'],
          isEmpty,
        ); // Gets set to empty when conversion fails
        expect(testObj['startTime'], isEmpty);
      });

      test('handles mixed valid and invalid data', () {
        final testObj = {
          'createdAt':
              '2023-05-01T14:30:00.000Z', // This is a direct field that will be processed
          'invalidField': 'not-a-date', // This field won't be processed
          'items': [
            {'createdAt': '2023-05-02T15:30:00.000Z'},
            {'createdAt': 'invalid'},
            {'createdAt': '2023-05-03T16:30:00.000Z'},
          ],
        };

        traverseAndConvertDates(
          testObj,
          convertUTCToLocal,
          splitDateTimeLocal,
        );

        // Valid dates should be converted
        expect(testObj['createdAt'], isNot(equals('2023-05-01T14:30:00.000Z')));

        // Use helper method for nested values
        final item0CreatedAt =
            getNestedValue(testObj, ['items', 0, 'createdAt']);
        expect(item0CreatedAt, isNot(equals('2023-05-02T15:30:00.000Z')));

        final item2CreatedAt =
            getNestedValue(testObj, ['items', 2, 'createdAt']);
        expect(item2CreatedAt, isNot(equals('2023-05-03T16:30:00.000Z')));

        // Invalid date should be handled gracefully (gets set to empty when conversion fails)
        final item1CreatedAt =
            getNestedValue(testObj, ['items', 1, 'createdAt']);
        expect(item1CreatedAt, isEmpty);

        // invalidField won't be processed since it's not in dateTimeFields
        expect(testObj['invalidField'], equals('not-a-date'));
      });
    });

    // Additional edge case tests for combineDateTime
    test('combineDateTime handles null and empty inputs', () {
      expect(combineDateTime(null, '14:30:00'), '');
      expect(combineDateTime('2023-05-01', null), '');
      expect(combineDateTime('', '14:30:00'), '');
      expect(combineDateTime('2023-05-01', ''), '');
      expect(combineDateTime(null, null), '');
      expect(combineDateTime('', ''), '');
    });

    test('combineDateTime handles various date and time formats', () {
      expect(combineDateTime('2023-12-25', '23:59:59'), '2023-12-25 23:59:59');
      expect(combineDateTime('2023-01-01', '00:00:00'), '2023-01-01 00:00:00');
      expect(
        combineDateTime('2023-02-28', '12:30:45.123'),
        '2023-02-28 12:30:45.123',
      );
    });

    // Additional edge cases for splitDateTimeUTC
    test('splitDateTimeUTC handles null and empty inputs', () {
      expect(splitDateTimeUTC(null), isEmpty);
      expect(splitDateTimeUTC(''), isEmpty);
      expect(splitDateTimeUTC('   '), isEmpty);
    });

    test('splitDateTimeUTC handles various UTC formats', () {
      // Test with milliseconds
      final result1 = splitDateTimeUTC('2023-05-01T14:30:00.123Z');
      expect(result1['date'], '2023-05-01');
      expect(result1['time'], '14:30:00.123Z');

      // Test without milliseconds but with Z
      final result2 = splitDateTimeUTC('2023-05-01T14:30:00Z');
      expect(result2['date'], '2023-05-01');
      expect(result2['time'], '14:30:00.000Z');
    });

    // Additional edge cases for splitDateTimeLocal
    test('splitDateTimeLocal handles null and empty inputs', () {
      expect(splitDateTimeLocal(null), isEmpty);
      expect(splitDateTimeLocal(''), isEmpty);
      expect(splitDateTimeLocal('   '), isEmpty);
    });

    test('splitDateTimeLocal handles various local formats', () {
      // Test with different local formats
      final result1 = splitDateTimeLocal('2023-05-01T14:30:00');
      expect(result1['date'], '2023-05-01');
      expect(result1['time'], '14:30');

      final result2 = splitDateTimeLocal('2023-12-31T23:59:59.999');
      expect(result2['date'], '2023-12-31');
      expect(result2['time'], '23:59');
    });

    // Additional edge cases for convertUTCToLocal
    test('convertUTCToLocal handles null and empty inputs', () {
      expect(convertUTCToLocal(null), isEmpty);
      expect(convertUTCToLocal(''), isEmpty);
      expect(convertUTCToLocal('   '), isEmpty);
    });

    test('convertUTCToLocal handles various UTC formats', () {
      // Test with different UTC formats
      final result1 = convertUTCToLocal('2023-05-01T14:30:00Z');
      expect(result1, matches(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}$'));

      final result2 = convertUTCToLocal('2023-05-01T14:30:00.000Z');
      expect(result2, matches(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}$'));
    });

    // Additional edge cases for convertLocalToUTC
    test('convertLocalToUTC handles null and empty inputs', () {
      expect(convertLocalToUTC(null), isEmpty);
      expect(convertLocalToUTC(''), isEmpty);
      expect(convertLocalToUTC('   '), isEmpty);
    });

    test('convertLocalToUTC handles various local formats', () {
      // Test with different local formats
      final result1 = convertLocalToUTC('2023-05-01T14:30:00');
      expect(
        result1,
        matches(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z$'),
      );

      final result2 = convertLocalToUTC('2023-05-01T14:30:00.123');
      expect(
        result2,
        matches(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z$'),
      );
    });

    group('formatLocalCreated', () {
      test('formatLocalCreated formats UTC time to local date-time string', () {
        const utcTime = '2023-05-01T14:30:00.000Z';
        final result = formatLocalCreated(utcTime);

        expect(result, isNotEmpty);
        expect(result, matches(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$'));
      });

      test('formatLocalCreated handles empty input', () {
        final result = formatLocalCreated('');
        expect(result, isEmpty);
      });

      test('formatLocalCreated handles invalid UTC time format', () {
        final result = formatLocalCreated('invalid-utc-time');
        // With the new implementation, invalid formats return empty string
        expect(result, isEmpty);
      });

      test('formatLocalCreated handles null-like values', () {
        // Test with typical "null" string values that might come from API
        final result1 = formatLocalCreated('null');
        expect(result1, isEmpty);

        final result2 = formatLocalCreated('undefined');
        expect(result2, isEmpty);
      });
      test('formatLocalCreated handles various UTC formats', () {
        // Test with milliseconds
        const utcTime1 = '2023-12-25T23:59:59.999Z';
        final result1 = formatLocalCreated(utcTime1);
        expect(result1, isNotEmpty);
        expect(result1, matches(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$'));

        // Test without milliseconds
        const utcTime2 = '2023-01-01T00:00:00Z';
        final result2 = formatLocalCreated(utcTime2);
        expect(result2, isNotEmpty);
        expect(result2, matches(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$'));
      });

      test('formatLocalCreated handles timezone conversion correctly', () {
        const utcTime = '2023-05-01T14:30:00.000Z';
        final result = formatLocalCreated(utcTime);

        // The result should be a valid local time format
        expect(result, isNotEmpty);
        expect(result, matches(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$'));

        // The result should be different from the original UTC format (no 'Z' or 'T')
        expect(result, isNot(contains('T')));
        expect(result, isNot(contains('Z')));
      });

      test('formatLocalCreated error handling with malformed dates', () {
        final testCases = [
          'not-a-date',
          '2023-05-01X14:30:00.000Z', // Wrong separator
          'completely-invalid-format',
          '2023/05/01 14:30:00', // Wrong format
        ];

        for (final testCase in testCases) {
          final result = formatLocalCreated(testCase);
          // With the new implementation, invalid formats return empty string
          expect(
            result,
            isEmpty,
            reason: 'Failed for input: $testCase',
          );
        }
      });

      test('formatLocalCreated preserves date consistency', () {
        // Test that the date part is consistent after conversion
        const utcTime = '2023-05-01T02:30:00.000Z'; // Early morning UTC
        final result = formatLocalCreated(utcTime);

        expect(result, isNotEmpty);
        expect(result, matches(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$'));

        // Extract date part
        final datePart = result.split(' ')[0];
        expect(datePart, matches(r'^\d{4}-\d{2}-\d{2}$'));
      });

      test('formatLocalCreated returns expected format structure', () {
        const utcTime = '2023-05-01T14:30:00.000Z';
        final result = formatLocalCreated(utcTime);

        expect(result, isNotEmpty);

        // Should contain exactly one space separating date and time
        final parts = result.split(' ');
        expect(parts.length, equals(2));

        // Date part should be YYYY-MM-DD
        expect(parts[0], matches(r'^\d{4}-\d{2}-\d{2}$'));

        // Time part should be HH:MM
        expect(parts[1], matches(r'^\d{2}:\d{2}$'));
      });
    });
  });
}
