import 'package:hive/hive.dart';

part 'recurrence_rule_model.g.dart';

/// Recurrence rule model for events.
@HiveType(typeId: 15)
class RecurrenceRule {
  RecurrenceRule({
    required this.frequency,
    this.interval,
    this.endDate,
    this.recurrenceEndDate,
    this.count,
    this.never,
    this.byDay,
    this.byMonth,
    this.byMonthDay,
  });
  factory RecurrenceRule.fromJson(Map<String, dynamic> json) {
    return RecurrenceRule(
      frequency: json['frequency'] as String,
      interval: json['interval'] as int?,
      endDate: json['endDate'] != null
          ? DateTime.tryParse(json['endDate'] as String)
          : null,
      recurrenceEndDate: json['recurrenceEndDate'] != null
          ? DateTime.tryParse(json['recurrenceEndDate'] as String)
          : null,
      count: json['count'] as int?,
      never: json['never'] as bool?,
      byDay: json['byDay'] != null
          ? List<String>.from(json['byDay'] as List)
          : null,
      byMonth: json['byMonth'] != null
          ? List<int>.from(json['byMonth'] as List)
          : null,
      byMonthDay: json['byMonthDay'] != null
          ? List<int>.from(json['byMonthDay'] as List)
          : null,
    );
  }

  /// Converts the RecurrenceRule instance to a JSON map.
  @HiveField(0)
  final String frequency;

  /// The interval for the recurrence rule.
  @HiveField(1)
  final int? interval;

  /// The end date.
  @HiveField(2)
  final DateTime? endDate;

  /// The recurrence end date for the recurrence rule.
  @HiveField(3)
  final DateTime? recurrenceEndDate;

  /// The count for the recurrence rule.
  @HiveField(4)
  final int? count;

  /// Indicates if the recurrence rule never ends.
  @HiveField(5)
  final bool? never;

  /// The days of the week for the recurrence rule.
  @HiveField(6)
  final List<String>? byDay;

  /// The months for the recurrence rule.
  @HiveField(7)
  final List<int>? byMonth;

  /// The month days for the recurrence rule.
  @HiveField(8)
  final List<int>? byMonthDay;
}
