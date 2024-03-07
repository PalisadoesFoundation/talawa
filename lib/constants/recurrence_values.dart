/// Class containing constants for recurrence options.
class Recurrance {
  /// Constant representing an event that does not repeat.
  static const once = 'Does not repeat';

  /// Constant representing daily recurrence.
  static const daily = 'day';

  /// Constant representing weekly recurrence.
  static const weekly = 'week';

  /// Constant representing monthly recurrence.
  static const monthly = 'month';

  /// Constant representing yearly recurrence.
  static const yearly = 'year';

  /// Constant representing a custom recurrence.
  static const custom = 'custom...';

  /// Constant representing Monday in weekdays.
  static const weekdayMonday = 'MO';

  /// Constant representing Tuesday in weekdays.
  static const weekdayTuesday = 'TU';

  /// Constant representing Wednesday in weekdays.
  static const weekdayWednesday = 'WE';

  /// Constant representing Thursday in weekdays.
  static const weekdayThursday = 'TH';

  /// Constant representing Friday in weekdays.
  static const weekdayFriday = 'FR';

  /// Constant representing Saturday in weekdays.
  static const weekdaySaturday = 'SA';

  /// Constant representing Sunday in weekdays.
  static const weekdaySunday = 'SU';
}

/// Class containing constants for event end types.
class EventEndTypes {
  /// Constant representing an event that never ends.
  static const never = 'Never';

  /// Constant representing an event that ends on a specific date.
  static const on = 'On';

  /// Constant representing an event that ends after a specified number of occurrences.
  static const after = 'After';
}
