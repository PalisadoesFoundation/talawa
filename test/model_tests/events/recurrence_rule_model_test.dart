import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/recurrence_rule_model.dart';

void main() {
  group('RecurrenceRule', () {
    test('should correctly deserialize from JSON', () {
      final json = {
        'frequency': 'WEEKLY',
        'interval': 2,
        'endDate': '2025-10-16T00:00:00.000Z',
        'recurrenceEndDate': '2025-12-31T00:00:00.000Z',
        'count': 10,
        'never': false,
        'byDay': ['MO', 'FR'],
        'byMonth': [1, 7],
        'byMonthDay': [15, 30],
      };

      final rule = RecurrenceRule.fromJson(json);

      expect(rule.frequency, 'WEEKLY');
      expect(rule.interval, 2);
      expect(rule.endDate, DateTime.parse('2025-10-16T00:00:00.000Z'));
      expect(
        rule.recurrenceEndDate,
        DateTime.parse('2025-12-31T00:00:00.000Z'),
      );
      expect(rule.count, 10);
      expect(rule.never, false);
      expect(rule.byDay, ['MO', 'FR']);
      expect(rule.byMonth, [1, 7]);
      expect(rule.byMonthDay, [15, 30]);
    });
    test('should handle null values in JSON', () {
      final json = {
        'frequency': 'DAILY',
      };

      final rule = RecurrenceRule.fromJson(json);

      expect(rule.frequency, 'DAILY');
      expect(rule.interval, isNull);
      expect(rule.endDate, isNull);
      expect(rule.recurrenceEndDate, isNull);
      expect(rule.count, isNull);
      expect(rule.never, isNull);
      expect(rule.byDay, isNull);
      expect(rule.byMonth, isNull);
      expect(rule.byMonthDay, isNull);
    });
  });
}
