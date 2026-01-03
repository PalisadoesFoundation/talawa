import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/recurrence_utils.dart';
import 'package:talawa/constants/recurrence_values.dart';

void main() {
  group('RecurrenceUtils', () {
    group('getDaySuffix', () {
      test('should return correct suffix for days 1-3', () {
        expect(RecurrenceUtils.getDaySuffix(1), 'st');
        expect(RecurrenceUtils.getDaySuffix(2), 'nd');
        expect(RecurrenceUtils.getDaySuffix(3), 'rd');
      });

      test('should return "th" for days 4-10', () {
        expect(RecurrenceUtils.getDaySuffix(4), 'th');
        expect(RecurrenceUtils.getDaySuffix(5), 'th');
        expect(RecurrenceUtils.getDaySuffix(6), 'th');
        expect(RecurrenceUtils.getDaySuffix(7), 'th');
        expect(RecurrenceUtils.getDaySuffix(8), 'th');
        expect(RecurrenceUtils.getDaySuffix(9), 'th');
        expect(RecurrenceUtils.getDaySuffix(10), 'th');
      });

      test('should return "th" for days 11-13 (special case)', () {
        expect(RecurrenceUtils.getDaySuffix(11), 'th');
        expect(RecurrenceUtils.getDaySuffix(12), 'th');
        expect(RecurrenceUtils.getDaySuffix(13), 'th');
      });

      test('should return correct suffix for days 14-31', () {
        expect(RecurrenceUtils.getDaySuffix(14), 'th');
        expect(RecurrenceUtils.getDaySuffix(21), 'st');
        expect(RecurrenceUtils.getDaySuffix(22), 'nd');
        expect(RecurrenceUtils.getDaySuffix(23), 'rd');
        expect(RecurrenceUtils.getDaySuffix(24), 'th');
        expect(RecurrenceUtils.getDaySuffix(31), 'st');
      });
    });

    group('getWeekDayOccurrenceInMonth', () {
      test('should return 1 for first week of month', () {
        // First Monday of January 2024
        final date = DateTime(2024, 1, 1);
        expect(RecurrenceUtils.getWeekDayOccurrenceInMonth(date), 1);

        // First Tuesday of January 2024
        final date2 = DateTime(2024, 1, 2);
        expect(RecurrenceUtils.getWeekDayOccurrenceInMonth(date2), 1);
      });

      test('should return 2 for second week of month', () {
        // Second Monday of January 2024
        final date = DateTime(2024, 1, 8);
        expect(RecurrenceUtils.getWeekDayOccurrenceInMonth(date), 2);

        // Second Tuesday of January 2024
        final date2 = DateTime(2024, 1, 9);
        expect(RecurrenceUtils.getWeekDayOccurrenceInMonth(date2), 2);
      });

      test('should return 3 for third week of month', () {
        // Third Monday of January 2024
        final date = DateTime(2024, 1, 15);
        expect(RecurrenceUtils.getWeekDayOccurrenceInMonth(date), 3);
      });

      test('should return 4 for fourth week of month', () {
        // Fourth Monday of January 2024
        final date = DateTime(2024, 1, 22);
        expect(RecurrenceUtils.getWeekDayOccurrenceInMonth(date), 4);
      });

      test('should return 5 for fifth week of month', () {
        // Fifth Monday of January 2024
        final date = DateTime(2024, 1, 29);
        expect(RecurrenceUtils.getWeekDayOccurrenceInMonth(date), 5);
      });
    });

    group('isLastOccurrenceOfWeekDay', () {
      test('should return true for last occurrence of weekday in month', () {
        // Last Monday of January 2024 (Jan 29)
        final date = DateTime(2024, 1, 29);
        expect(RecurrenceUtils.isLastOccurrenceOfWeekDay(date), true);

        // Last Friday of January 2024 (Jan 26)
        final date2 = DateTime(2024, 1, 26);
        expect(RecurrenceUtils.isLastOccurrenceOfWeekDay(date2), true);
      });

      test('should return false for not last occurrence of weekday in month',
          () {
        // First Monday of January 2024 (Jan 1)
        final date = DateTime(2024, 1, 1);
        expect(RecurrenceUtils.isLastOccurrenceOfWeekDay(date), false);

        // Second Monday of January 2024 (Jan 8)
        final date2 = DateTime(2024, 1, 8);
        expect(RecurrenceUtils.isLastOccurrenceOfWeekDay(date2), false);
      });

      test('should handle February correctly', () {
        // Last Monday of February 2024 (Feb 26)
        final date = DateTime(2024, 2, 26);
        expect(RecurrenceUtils.isLastOccurrenceOfWeekDay(date), true);

        // Not last Monday of February 2024 (Feb 19)
        final date2 = DateTime(2024, 2, 19);
        expect(RecurrenceUtils.isLastOccurrenceOfWeekDay(date2), false);
      });
    });

    group('convertDayNamesToShortCodes', () {
      test('should convert single day to short code', () {
        final result =
            RecurrenceUtils.convertDayNamesToShortCodes({WeekDays.monday});
        expect(result, [DayCodes.monday]);
      });

      test('should convert multiple days to short codes', () {
        final result = RecurrenceUtils.convertDayNamesToShortCodes({
          WeekDays.monday,
          WeekDays.friday,
          WeekDays.sunday,
        });
        expect(result, [DayCodes.monday, DayCodes.friday, DayCodes.sunday]);
      });

      test('should convert all days to short codes', () {
        final result = RecurrenceUtils.convertDayNamesToShortCodes({
          WeekDays.monday,
          WeekDays.tuesday,
          WeekDays.wednesday,
          WeekDays.thursday,
          WeekDays.friday,
          WeekDays.saturday,
          WeekDays.sunday,
        });
        expect(result, [
          DayCodes.monday,
          DayCodes.tuesday,
          DayCodes.wednesday,
          DayCodes.thursday,
          DayCodes.friday,
          DayCodes.saturday,
          DayCodes.sunday,
        ]);
      });

      test('should return empty list for empty input', () {
        final result = RecurrenceUtils.convertDayNamesToShortCodes({});
        expect(result, []);
      });
    });

    group('convertShortCodesToWeekDays', () {
      test('should convert single short code to weekday', () {
        final result =
            RecurrenceUtils.convertShortCodesToWeekDays([DayCodes.monday]);
        expect(result, {WeekDays.monday});
      });

      test('should convert multiple short codes to weekdays', () {
        final result = RecurrenceUtils.convertShortCodesToWeekDays([
          DayCodes.monday,
          DayCodes.friday,
          DayCodes.sunday,
        ]);
        expect(result, {WeekDays.monday, WeekDays.friday, WeekDays.sunday});
      });

      test('should convert all short codes to weekdays', () {
        final result = RecurrenceUtils.convertShortCodesToWeekDays([
          DayCodes.monday,
          DayCodes.tuesday,
          DayCodes.wednesday,
          DayCodes.thursday,
          DayCodes.friday,
          DayCodes.saturday,
          DayCodes.sunday,
        ]);
        expect(result, {
          WeekDays.monday,
          WeekDays.tuesday,
          WeekDays.wednesday,
          WeekDays.thursday,
          WeekDays.friday,
          WeekDays.saturday,
          WeekDays.sunday,
        });
      });

      test('should return empty set for empty input', () {
        final result = RecurrenceUtils.convertShortCodesToWeekDays([]);
        expect(result, <String>{});
      });

      test('should ignore invalid codes', () {
        final result = RecurrenceUtils.convertShortCodesToWeekDays([
          DayCodes.monday,
          'INVALID',
          DayCodes.friday,
        ]);
        expect(result, {WeekDays.monday, WeekDays.friday});
      });
    });

    group('weekdayToShortCode', () {
      test('should convert all weekdays to correct short codes', () {
        expect(
          RecurrenceUtils.weekdayToShortCode(DateTime.monday),
          DayCodes.monday,
        );
        expect(
          RecurrenceUtils.weekdayToShortCode(DateTime.tuesday),
          DayCodes.tuesday,
        );
        expect(
          RecurrenceUtils.weekdayToShortCode(DateTime.wednesday),
          DayCodes.wednesday,
        );
        expect(
          RecurrenceUtils.weekdayToShortCode(DateTime.thursday),
          DayCodes.thursday,
        );
        expect(
          RecurrenceUtils.weekdayToShortCode(DateTime.friday),
          DayCodes.friday,
        );
        expect(
          RecurrenceUtils.weekdayToShortCode(DateTime.saturday),
          DayCodes.saturday,
        );
        expect(
          RecurrenceUtils.weekdayToShortCode(DateTime.sunday),
          DayCodes.sunday,
        );
      });

      test('should return Monday as default for invalid weekday', () {
        expect(RecurrenceUtils.weekdayToShortCode(0), DayCodes.monday);
        expect(RecurrenceUtils.weekdayToShortCode(8), DayCodes.monday);
        expect(RecurrenceUtils.weekdayToShortCode(-1), DayCodes.monday);
      });
    });

    group('getRecurrenceRuleText', () {
      test('should generate correct text for daily recurrence', () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.daily,
          interval: 1,
          weekDays: {},
          never: true,
        );
        expect(result, 'Daily');
      });

      test('should generate correct text for daily recurrence with interval',
          () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.daily,
          interval: 2,
          weekDays: {},
          never: true,
        );
        expect(result, 'Every 2 days');
      });

      test('should generate correct text for weekly recurrence', () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.weekly,
          interval: 1,
          weekDays: {WeekDays.monday, WeekDays.friday},
          never: true,
        );
        expect(result, 'Weekly on Monday, Friday');
      });

      test('should generate correct text for weekly recurrence with interval',
          () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.weekly,
          interval: 2,
          weekDays: {WeekDays.monday},
          never: true,
        );
        expect(result, 'Every 2 weeks on Monday');
      });

      test('should generate correct text for weekly recurrence with all days',
          () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.weekly,
          interval: 1,
          weekDays: {
            WeekDays.monday,
            WeekDays.tuesday,
            WeekDays.wednesday,
            WeekDays.thursday,
            WeekDays.friday,
            WeekDays.saturday,
            WeekDays.sunday,
          },
          never: true,
        );
        expect(result, 'Weekly on every day');
      });

      test('should generate correct text for weekly recurrence with weekdays',
          () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.weekly,
          interval: 1,
          weekDays: {
            WeekDays.monday,
            WeekDays.tuesday,
            WeekDays.wednesday,
            WeekDays.thursday,
            WeekDays.friday,
          },
          never: true,
        );
        expect(result, 'Weekly on weekdays');
      });

      test('should generate correct text for weekly recurrence with weekends',
          () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.weekly,
          interval: 1,
          weekDays: {WeekDays.saturday, WeekDays.sunday},
          never: true,
        );
        expect(result, 'Weekly on weekends');
      });

      test('should generate correct text for monthly recurrence by day', () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.monthly,
          interval: 1,
          weekDays: {},
          byMonthDay: [15],
          never: true,
        );
        expect(result, 'Monthly on day 15');
      });

      test('should generate correct text for monthly recurrence with interval',
          () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.monthly,
          interval: 2,
          weekDays: {},
          byMonthDay: [15],
          never: true,
        );
        expect(result, 'Every 2 months on day 15');
      });

      test(
          'should generate correct text for monthly recurrence by weekday position',
          () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.monthly,
          interval: 1,
          weekDays: {WeekDays.monday},
          useDayOfWeekMonthly: true,
          byPosition: 2,
          never: true,
        );
        expect(result, 'Monthly on the 2 nd Monday');
      });

      test('should generate correct text for yearly recurrence by day', () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.yearly,
          interval: 1,
          weekDays: {},
          byMonthDay: [15],
          byMonth: [6],
          never: true,
        );
        expect(result, 'Yearly in June on day 15');
      });

      test('should generate correct text for yearly recurrence with interval',
          () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.yearly,
          interval: 2,
          weekDays: {},
          byMonthDay: [15],
          byMonth: [6],
          never: true,
        );
        expect(result, 'Every 2 years in June on day 15');
      });

      test(
          'should generate correct text for yearly recurrence by weekday position',
          () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.yearly,
          interval: 1,
          weekDays: {WeekDays.monday},
          byMonth: [6],
          useDayOfWeekYearly: true,
          byPosition: 3,
          never: true,
        );
        expect(result, 'Yearly in June on the 3 rd Monday');
      });

      test('should add end condition for count', () {
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.daily,
          interval: 1,
          weekDays: {},
          never: false,
          count: 5,
        );
        expect(result, 'Daily, 5 times');
      });

      test('should add end condition for end date', () {
        final endDate = DateTime(2024, 12, 31);
        final result = RecurrenceUtils.getRecurrenceRuleText(
          frequency: Frequency.daily,
          interval: 1,
          weekDays: {},
          never: false,
          endDate: endDate,
        );
        expect(result, 'Daily, until Dec 31, 2024');
      });
    });

    group('buildRecurrenceData', () {
      test('should build daily recurrence data', () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.daily,
          interval: 2,
          weekDays: {},
          eventStartDate: DateTime(2024, 1, 1),
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['frequency'], Frequency.daily);
        expect(result['interval'], 2);
        expect(result['never'], true);
      });

      test('should build weekly recurrence data with specific days', () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.weekly,
          interval: 1,
          weekDays: {WeekDays.monday, WeekDays.friday},
          eventStartDate: DateTime(2024, 1, 1),
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['frequency'], Frequency.weekly);
        expect(result['interval'], 1);
        expect(result['byDay'], [DayCodes.monday, DayCodes.friday]);
        expect(result['never'], true);
      });

      test(
          'should build weekly recurrence data with default day from start date',
          () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.weekly,
          interval: 1,
          weekDays: {},
          eventStartDate: DateTime(2024, 1, 1), // Monday
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['frequency'], Frequency.weekly);
        expect(result['interval'], 1);
        expect(result['byDay'], [DayCodes.monday]);
        expect(result['never'], true);
      });

      test('should build monthly recurrence data by day of month', () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.monthly,
          interval: 1,
          weekDays: {},
          eventStartDate: DateTime(2024, 1, 15),
          byMonthDay: [15, 30],
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['frequency'], Frequency.monthly);
        expect(result['interval'], 1);
        expect(result['byMonthDay'], [15, 30]);
        expect(result['never'], true);
      });

      test(
          'should build monthly recurrence data with default day from start date',
          () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.monthly,
          interval: 1,
          weekDays: {},
          eventStartDate: DateTime(2024, 1, 15),
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['frequency'], Frequency.monthly);
        expect(result['interval'], 1);
        expect(result['byMonthDay'], [15]);
        expect(result['never'], true);
      });

      test('should build monthly recurrence data by weekday position', () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.monthly,
          interval: 1,
          weekDays: {WeekDays.monday},
          eventStartDate: DateTime(2024, 1, 1),
          byPosition: 2,
          useDayOfWeekMonthly: true,
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['frequency'], Frequency.monthly);
        expect(result['interval'], 1);
        expect(result['byDay'], ['2${DayCodes.monday}']);
        expect(result['never'], true);
      });

      test(
          'should build monthly recurrence data with default position from start date',
          () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.monthly,
          interval: 1,
          weekDays: {},
          eventStartDate: DateTime(2024, 1, 8), // Second Monday
          useDayOfWeekMonthly: true,
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['frequency'], Frequency.monthly);
        expect(result['interval'], 1);
        expect(result['byDay'], ['2${DayCodes.monday}']);
        expect(result['never'], true);
      });

      test('should build yearly recurrence data by day of month', () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.yearly,
          interval: 1,
          weekDays: {},
          eventStartDate: DateTime(2024, 6, 15),
          byMonthDay: [15],
          byMonth: [6],
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['frequency'], Frequency.yearly);
        expect(result['interval'], 1);
        expect(result['byMonth'], [6]);
        expect(result['byMonthDay'], [15]);
        expect(result['never'], true);
      });

      test(
          'should build yearly recurrence data with default month from start date',
          () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.yearly,
          interval: 1,
          weekDays: {},
          eventStartDate: DateTime(2024, 6, 15),
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['frequency'], Frequency.yearly);
        expect(result['interval'], 1);
        expect(result['byMonth'], [6]);
        expect(result['byMonthDay'], [15]);
        expect(result['never'], true);
      });

      test('should build yearly recurrence data by weekday position', () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.yearly,
          interval: 1,
          weekDays: {WeekDays.monday},
          eventStartDate: DateTime(2024, 6, 1),
          byMonth: [6],
          byPosition: 3,
          useDayOfWeekYearly: true,
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['frequency'], Frequency.yearly);
        expect(result['interval'], 1);
        expect(result['byMonth'], [6]);
        expect(result['byDay'], ['3${DayCodes.monday}']);
        expect(result['never'], true);
      });

      test(
          'should build yearly recurrence data with default position from start date',
          () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.yearly,
          interval: 1,
          weekDays: {},
          eventStartDate: DateTime(2024, 6, 8), // Second Saturday
          byMonth: [6],
          useDayOfWeekYearly: true,
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['frequency'], Frequency.yearly);
        expect(result['interval'], 1);
        expect(result['byMonth'], [6]);
        expect(result['byDay'], ['2${DayCodes.saturday}']);
        expect(result['never'], true);
      });

      test('should add count when eventEndType is after', () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.daily,
          interval: 1,
          weekDays: {},
          eventStartDate: DateTime(2024, 1, 1),
          count: 10,
          never: false,
          eventEndType: EventEndTypes.after,
        );

        expect(result['count'], 10);
        expect(result['never'], false);
      });

      test('should add endDate when eventEndType is on', () {
        final endDate = DateTime(2024, 12, 31);
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.daily,
          interval: 1,
          weekDays: {},
          eventStartDate: DateTime(2024, 1, 1),
          recurrenceEndDate: endDate,
          never: false,
          eventEndType: EventEndTypes.on,
        );

        expect(result['endDate'], endDate.toUtc().toIso8601String());
        expect(result['never'], false);
      });

      test('should set never to true when eventEndType is never', () {
        final result = RecurrenceUtils.buildRecurrenceData(
          frequency: Frequency.daily,
          interval: 1,
          weekDays: {},
          eventStartDate: DateTime(2024, 1, 1),
          never: true,
          eventEndType: EventEndTypes.never,
        );

        expect(result['never'], true);
      });
    });
  });
}
