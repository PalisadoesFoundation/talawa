// Constants for recurrence values

/// Class containing constants for frequency options (matching backend schema).
class Frequency {
  /// Constant representing an event that occurs every day.
  static const daily = 'DAILY';

  /// Constant representing an event that occurs every week.
  static const weekly = 'WEEKLY';

  /// Constant representing an event that occurs every month.
  static const monthly = 'MONTHLY';

  /// Constant representing an event that occurs every year.
  static const yearly = 'YEARLY';
}

/// Class containing constants for week days (full names for UI).
class WeekDays {
  /// Constant representing Sunday.
  static const sunday = 'SUNDAY';

  /// Constant representing Monday.
  static const monday = 'MONDAY';

  /// Constant representing Tuesday.
  static const tuesday = 'TUESDAY';

  /// Constant representing Wednesday.
  static const wednesday = 'WEDNESDAY';

  /// Constant representing Thursday.
  static const thursday = 'THURSDAY';

  /// Constant representing Friday.
  static const friday = 'FRIDAY';

  /// Constant representing Saturday.
  static const saturday = 'SATURDAY';
}

/// List of all days in a week (for UI display).
List<String> days = [
  WeekDays.monday,
  WeekDays.tuesday,
  WeekDays.wednesday,
  WeekDays.thursday,
  WeekDays.friday,
  WeekDays.saturday,
  WeekDays.sunday,
];

/// Short day codes for backend (matching schema - byDay field).
class DayCodes {
  /// Monday short code.
  static const monday = 'MO';

  /// Tuesday short code.
  static const tuesday = 'TU';

  /// Wednesday short code.
  static const wednesday = 'WE';

  /// Thursday short code.
  static const thursday = 'TH';

  /// Friday short code.
  static const friday = 'FR';

  /// Saturday short code.
  static const saturday = 'SA';

  /// Sunday short code.
  static const sunday = 'SU';
}

/// Event end type constants for UI.
class EventEndTypes {
  /// Event never ends.
  static const never = 'Never';

  /// Event ends on a specific date.
  static const on = 'On';

  /// Event ends after a specific number of occurrences.
  static const after = 'After';
}

/// Weekday names for display (exported for UI).
const List<String> weekDayNames = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

/// Month names for display (exported for UI).
const List<String> monthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

/// Default number of days for recurrence end date.
const int kDefaultRecurrenceEndDays = 30;
