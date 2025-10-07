import 'package:intl/intl.dart';
import 'package:talawa/constants/recurrence_values.dart';

/// Utility class for recurrence rule operations.
class RecurrenceUtils {
  /// Gets the suffix for a day number (1st, 2nd, 3rd, etc.).
  ///
  /// **params**:
  /// * `day`: Day of the month
  ///
  /// **returns**:
  /// * `String`: The appropriate suffix
  static String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }

    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  /// Gets the occurrence number (position) of a weekday within its month.
  ///
  /// For example, "3rd Monday of the month" would return 3.
  ///
  /// **params**:
  /// * `date`: The date to check
  ///
  /// **returns**:
  /// * `int`: The occurrence number (1-5)
  static int getWeekDayOccurrenceInMonth(DateTime date) {
    final dayOfMonth = date.day;
    return ((dayOfMonth - 1) ~/ 7) + 1;
  }

  /// Checks if a date is the last occurrence of its weekday in the month.
  ///
  /// **params**:
  /// * `date`: The date to check
  ///
  /// **returns**:
  /// * `bool`: True if it's the last occurrence
  static bool isLastOccurrenceOfWeekDay(DateTime date) {
    final currentDay = date.weekday;
    DateTime lastOccurrenceInMonth = DateTime(date.year, date.month + 1, 0);

    while (lastOccurrenceInMonth.weekday != currentDay) {
      lastOccurrenceInMonth = DateTime(
        lastOccurrenceInMonth.year,
        lastOccurrenceInMonth.month,
        lastOccurrenceInMonth.day - 1,
      );
    }

    return date.day == lastOccurrenceInMonth.day;
  }

  /// Convert day names to short codes (MO, TU, etc.) for API.
  ///
  /// **params**:
  /// * `days`: Set of day names from WeekDays class
  ///
  /// **returns**:
  /// * `List<String>`: List of day short codes
  static List<String> convertDayNamesToShortCodes(Set<String> days) {
    final List<String> dayCodes = [];
    if (days.contains(WeekDays.monday)) dayCodes.add(DayCodes.monday);
    if (days.contains(WeekDays.tuesday)) dayCodes.add(DayCodes.tuesday);
    if (days.contains(WeekDays.wednesday)) dayCodes.add(DayCodes.wednesday);
    if (days.contains(WeekDays.thursday)) dayCodes.add(DayCodes.thursday);
    if (days.contains(WeekDays.friday)) dayCodes.add(DayCodes.friday);
    if (days.contains(WeekDays.saturday)) dayCodes.add(DayCodes.saturday);
    if (days.contains(WeekDays.sunday)) dayCodes.add(DayCodes.sunday);
    return dayCodes;
  }

  /// Convert DateTime weekday to short code (MO, TU, etc.) for API.
  ///
  /// **params**:
  /// * `weekday`: Weekday integer (1-7, where 1 is Monday)
  ///
  /// **returns**:
  /// * `String`: Day short code
  static String weekdayToShortCode(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return DayCodes.monday;
      case DateTime.tuesday:
        return DayCodes.tuesday;
      case DateTime.wednesday:
        return DayCodes.wednesday;
      case DateTime.thursday:
        return DayCodes.thursday;
      case DateTime.friday:
        return DayCodes.friday;
      case DateTime.saturday:
        return DayCodes.saturday;
      case DateTime.sunday:
        return DayCodes.sunday;
      default:
        return DayCodes.monday; // Default fallback
    }
  }

  /// Generates human-readable description of a recurrence rule.
  ///
  /// **params**:
  /// * `frequency`: Recurrence frequency (DAILY, WEEKLY, etc.)
  /// * `interval`: Recurrence interval (e.g., every 2 days)
  /// * `weekDays`: Selected weekdays for weekly recurrence
  /// * `byMonthDay` : Selected days of the month for monthly/yearly recurrence
  /// * `byMonth`: Selected months for yearly recurrence
  /// * `count`: Number of occurrences
  /// * `endDate`: End date for recurrence
  /// * `never`: Whether recurrence never ends
  /// * `byPosition`: Position in month/year for nth weekday recurrence (1st Monday, 3rd Friday, etc.)
  /// * `useDayOfWeekMonthly`: Whether to use day-of-week pattern for monthly
  /// * `useDayOfWeekYearly`: Whether to use day-of-week pattern for yearly
  ///
  /// **returns**:
  /// * `String`: Human-readable description of recurrence
  static String getRecurrenceRuleText({
    required String frequency,
    required int interval,
    required Set<String> weekDays,
    List<int>? byMonthDay,
    List<int>? byMonth,
    int? count,
    DateTime? endDate,
    required bool never,
    int? byPosition,
    bool useDayOfWeekMonthly = false,
    bool useDayOfWeekYearly = false,
  }) {
    String text = '';

    // Format the interval part
    switch (frequency) {
      case Frequency.daily:
        text = interval > 1 ? 'Every $interval days' : 'Daily';
        break;

      case Frequency.weekly:
        text = interval > 1 ? 'Every $interval weeks' : 'Weekly';

        // Add weekday information for weekly recurrence
        if (weekDays.isNotEmpty) {
          text += ' on ${_formatWeekDays(weekDays)}';
        }
        break;

      case Frequency.monthly:
        text = interval > 1 ? 'Every $interval months' : 'Monthly';

        // By weekday pattern (e.g., "on the first Monday")
        if (useDayOfWeekMonthly && byPosition != null && weekDays.isNotEmpty) {
          final String dayName = weekDays.first.substring(0, 1) +
              weekDays.first.substring(1).toLowerCase();
          final String positionText = '$byPosition ${getDaySuffix(byPosition)}';
          text += ' on the $positionText $dayName';
        }
        // By day of month pattern (e.g., "on day 15")
        else if (byMonthDay != null && byMonthDay.isNotEmpty) {
          text += ' on day ${byMonthDay.first}';
        }
        break;

      case Frequency.yearly:
        text = interval > 1 ? 'Every $interval years' : 'Yearly';

        // Add month information if available
        String monthText = '';
        if (byMonth != null && byMonth.isNotEmpty) {
          final int monthIndex = byMonth.first - 1;
          if (monthIndex >= 0 && monthIndex < monthNames.length) {
            monthText = monthNames[monthIndex];
          } else {
            monthText = 'month ${byMonth.first}';
          }
          text += ' in $monthText';
        }

        // By weekday pattern (e.g., "on the first Monday")
        if (useDayOfWeekYearly && byPosition != null && weekDays.isNotEmpty) {
          final String dayName = weekDays.first.substring(0, 1) +
              weekDays.first.substring(1).toLowerCase();
          final String positionText = '$byPosition ${getDaySuffix(byPosition)}';
          text += ' on the $positionText $dayName';
        }
        // By day of month pattern (e.g., "on day 15")
        else if (byMonthDay != null && byMonthDay.isNotEmpty) {
          text += ' on day ${byMonthDay.first}';
        }
        break;
    }

    // Add end condition
    if (!never) {
      if (count != null && count > 0) {
        text += ', $count times';
      } else if (endDate != null) {
        final formatter = DateFormat('MMM d, yyyy');
        text += ', until ${formatter.format(endDate)}';
      }
    }

    return text;
  }

  /// Formats weekdays into a readable string.
  ///
  /// **params**:
  /// * `weekDays`: Set of weekday names
  ///
  /// **returns**:
  /// * `String`: Formatted list of days
  static String _formatWeekDays(Set<String> weekDays) {
    final List<String> formattedDays = weekDays.map((day) {
      return day.substring(0, 1) + day.substring(1).toLowerCase();
    }).toList();

    if (formattedDays.length == 7) {
      return 'every day';
    } else if (formattedDays.length == 5 &&
        formattedDays.contains('Monday') &&
        formattedDays.contains('Tuesday') &&
        formattedDays.contains('Wednesday') &&
        formattedDays.contains('Thursday') &&
        formattedDays.contains('Friday')) {
      return 'weekdays';
    } else if (formattedDays.length == 2 &&
        formattedDays.contains('Saturday') &&
        formattedDays.contains('Sunday')) {
      return 'weekends';
    } else {
      return formattedDays.join(', ');
    }
  }

  /// Builds a complete recurrence data map for the API.
  ///
  /// This utility method centralizes the logic for creating recurrence data maps
  /// that match the backend API expectations. It handles all recurrence types
  /// and generates proper parameters based on the frequency.
  ///
  /// **params**:
  /// * `frequency`: Recurrence frequency (DAILY, WEEKLY, etc.)
  /// * `interval`: Recurrence interval (e.g., every 2 days)
  /// * `weekDays`: Selected weekdays for weekly recurrence
  /// * `byMonthDay`: Selected days of the month for monthly/yearly recurrence
  /// * `byMonth`: Selected months for yearly recurrence
  /// * `count`: Number of occurrences
  /// * `recurrenceEndDate`: End date for recurrence
  /// * `never`: Whether recurrence never ends
  /// * `byPosition`: Position in month/year for nth weekday recurrence (1st Monday, 3rd Friday, etc.)
  /// * `useDayOfWeekMonthly`: Whether to use day-of-week pattern for monthly
  /// * `useDayOfWeekYearly`: Whether to use day-of-week pattern for yearly
  /// * `eventStartDate`: The event's start date (used for defaults)
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: Complete recurrence data map ready for the API
  static Map<String, dynamic> buildRecurrenceData({
    required String frequency,
    required int interval,
    required Set<String> weekDays,
    required DateTime eventStartDate,
    List<int>? byMonthDay,
    List<int>? byMonth,
    int? count,
    DateTime? recurrenceEndDate,
    required bool never,
    required String eventEndType,
    int? byPosition,
    bool useDayOfWeekMonthly = false,
    bool useDayOfWeekYearly = false,
  }) {
    final recurrenceData = <String, dynamic>{
      'frequency': frequency,
      'interval': interval,
    };

    switch (frequency) {
      case Frequency.weekly:
        if (weekDays.isNotEmpty) {
          recurrenceData['byDay'] = convertDayNamesToShortCodes(weekDays);
        } else {
          // If no specific days are selected, use the day of the week from start date
          final int dayOfWeek = eventStartDate.weekday; // 1=Monday, 7=Sunday
          final String dayCode = weekdayToShortCode(dayOfWeek);
          recurrenceData['byDay'] = [dayCode];
        }
        break;

      case Frequency.monthly:
        if (useDayOfWeekMonthly) {
          // For "nth day of the month" pattern
          if (byPosition != null && weekDays.isNotEmpty) {
            final dayCodes = convertDayNamesToShortCodes(weekDays);
            // Convert position value to proper format (e.g., "1MO", "2TU", etc.)
            final List<String> byDayWithPos = dayCodes.map((code) {
              return '$byPosition$code';
            }).toList();
            recurrenceData['byDay'] = byDayWithPos;
          } else {
            // Default to current day's position in month
            final int dayOfWeek = eventStartDate.weekday;
            final int dayPos =
                ((eventStartDate.day - 1) ~/ 7) + 1; // Calculate position (1-5)
            final String dayCode = weekdayToShortCode(dayOfWeek);
            recurrenceData['byDay'] = ['$dayPos$dayCode'];
          }
        } else {
          // For "specific day of month" pattern
          if (byMonthDay != null && byMonthDay.isNotEmpty) {
            recurrenceData['byMonthDay'] = byMonthDay;
          } else {
            // Default to current day of month
            recurrenceData['byMonthDay'] = [eventStartDate.day];
          }
        }
        break;

      case Frequency.yearly:
        // Add month selection
        if (byMonth != null && byMonth.isNotEmpty) {
          recurrenceData['byMonth'] = byMonth;
        } else {
          // Default to current month
          recurrenceData['byMonth'] = [eventStartDate.month];
        }

        if (useDayOfWeekYearly) {
          // For "nth day of the month in specific months" pattern
          if (byPosition != null && weekDays.isNotEmpty) {
            final dayCodes = convertDayNamesToShortCodes(weekDays);
            final List<String> byDayWithPos = dayCodes.map((code) {
              return '$byPosition$code';
            }).toList();
            recurrenceData['byDay'] = byDayWithPos;
          } else {
            // Default to current day's position in month
            final int dayOfWeek = eventStartDate.weekday;
            final int dayPos =
                ((eventStartDate.day - 1) ~/ 7) + 1; // Calculate position (1-5)
            final String dayCode = weekdayToShortCode(dayOfWeek);
            recurrenceData['byDay'] = ['$dayPos$dayCode'];
          }
        } else {
          // For "specific day of month in specific months" pattern
          if (byMonthDay != null && byMonthDay.isNotEmpty) {
            recurrenceData['byMonthDay'] = byMonthDay;
          } else {
            // Default to current day of month
            recurrenceData['byMonthDay'] = [eventStartDate.day];
          }
        }
        break;
    }

    // Handle different end types based on user selection
    if (eventEndType == EventEndTypes.after && count != null && count > 0) {
      recurrenceData['count'] = count;
      recurrenceData['never'] = false;
    } else if (eventEndType == EventEndTypes.on && recurrenceEndDate != null) {
      recurrenceData['endDate'] = DateTime(
        recurrenceEndDate.year,
        recurrenceEndDate.month,
        recurrenceEndDate.day,
      ).toUtc().toIso8601String();
      recurrenceData['never'] = false;
    } else {
      recurrenceData['never'] = true;
    }

    return recurrenceData;
  }
}
