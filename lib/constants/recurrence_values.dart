import 'dart:core';
import 'package:intl/intl.dart';

/// Class containing constants for event intervals.
class EventIntervals {
  /// Constant representing an event that occurs every day.
  static const daily = 'day';

  /// Constant representing an event that occurs every week.
  static const weekly = 'week';

  /// Constant representing an event that occurs every month.
  static const monthly = 'month';

  /// Constant representing an event that occurs every year.
  static const yearly = 'year';
}

/// Class containing constants for event end types.
class EventEndTypes {
  /// Constant representing an event that never ends.
  static const never = 'never';

  /// Constant representing an event that ends on a specific date.
  static const on = 'on';

  /// Constant representing an event that ends after a specified number of occurrences.
  static const after = 'after';
}

/// Class containing constants for frequency options.
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

/// Class containing constants for week days.
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

/// Class containing constants for recurrence end types.
class RecurringEventMutationType {
  /// Constant representing mutation of current instance only.
  static const thisInstance = 'ThisInstance';

  /// constant representing mutation of current and following instances.
  static const thisAndFollowingInstances = 'ThisAndFollowingInstances';

  /// constant representing mutation of all instances.
  static const allInstances = 'AllInstances';
}

/// represents all the days in a week.
List<String> days = [
  WeekDays.sunday,
  WeekDays.monday,
  WeekDays.tuesday,
  WeekDays.wednesday,
  WeekDays.thursday,
  WeekDays.friday,
  WeekDays.saturday,
];

/// conatins all neccessary utils.
class RecurrenceUtils {
  /// represents all the months.
  static const List<String> monthNames = [
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

  /// represents all the week day occurences.
  static const List<String> weekDayOccurences = [
    'First',
    'Second',
    'Third',
    'Fourth',
    'Last',
  ];

  /// represents all the week days.
  static const List<String> weekDays = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  /// 'getRecurrenceRuleText' return text for various recurrence rules.
  ///
  /// **params**:
  /// * `frequency`: Frequency of the event.
  /// * `weekDays`: List of week days.
  /// * `interval`: Interval of the event.
  /// * `count`: Count of the event.
  /// * `weekDayOccurenceInMonth`: Week day occurence in month.
  /// * `startDate`: Start date of the event.
  /// * `endDate`: End date of the event.
  ///
  /// **returns**:
  /// * `String`: Recurrence rule text.
  static String getRecurrenceRuleText(
    String frequency,
    Set<String>? weekDays,
    int? interval,
    int? count,
    int? weekDayOccurenceInMonth,
    DateTime startDate,
    DateTime? endDate,
  ) {
    String recurrenceRuleText = '';

    switch (frequency) {
      case Frequency.daily:
        if (interval != null && interval > 1) {
          recurrenceRuleText = 'Every $interval days';
        } else {
          recurrenceRuleText = 'Daily';
        }
        break;
      case Frequency.weekly:
        if (weekDays == null) {
          break;
        }
        if (interval != null && interval > 1) {
          recurrenceRuleText = 'Every $interval weeks on ';
        } else {
          recurrenceRuleText = 'Weekly on ';
        }
        recurrenceRuleText += getWeekDaysString(weekDays.toList());
        break;
      case Frequency.monthly:
        if (interval != null && interval > 1) {
          recurrenceRuleText = 'Every $interval months on ';
        } else {
          recurrenceRuleText = 'Monthly on ';
        }

        if (weekDayOccurenceInMonth != null) {
          final getOccurence =
              weekDayOccurenceInMonth != -1 ? weekDayOccurenceInMonth - 1 : 4;
          print(
            startDate.weekday,
          );
          recurrenceRuleText +=
              '${weekDayOccurences[getOccurence]} ${RecurrenceUtils.weekDays[startDate.weekday]}';
        } else {
          recurrenceRuleText += 'Day ${startDate.day}';
        }
        break;
      case Frequency.yearly:
        if (interval != null && interval > 1) {
          recurrenceRuleText = 'Every $interval years on ';
        } else {
          recurrenceRuleText = 'Annually on ';
        }
        recurrenceRuleText +=
            '${monthNames[startDate.month - 1]} ${startDate.day}';
        break;
    }

    if (endDate != null) {
      final formatter = DateFormat('MMMM dd, yyyy');
      recurrenceRuleText += ', until ${formatter.format(endDate)}';
    }

    if (count != null) {
      recurrenceRuleText += ', $count ${count > 1 ? 'times' : 'time'}';
    }

    return recurrenceRuleText;
  }

  /// 'getWeekDaysString' returns string for weekDays.
  ///
  /// **params**:
  /// * `weekDays`: List of Weekdays
  ///
  /// **returns**:
  /// * `String`: returns string for weekDays.
  static String getWeekDaysString(List<String> weekDays) {
    final fullDayNames =
        weekDays.map((day) => weekDays[weekDays.indexOf(day)]).toList();

    String weekDaysString = fullDayNames.join(', ');

    final lastCommaIndex = weekDaysString.lastIndexOf(',');
    if (lastCommaIndex != -1) {
      weekDaysString =
          '${weekDaysString.substring(0, lastCommaIndex)} &${weekDaysString.substring(lastCommaIndex + 1)}';
    }

    return weekDaysString;
  }

  /// 'getWeekDayOccurenceInMonth' returns the week day occurence in month.
  ///
  /// **params**:
  /// * `date`: Date of the event.
  ///
  /// **returns**:
  /// * `int`: Week day occurence in month.
  static int getWeekDayOccurenceInMonth(DateTime date) {
    final dayOfMonth = date.day;

    // Calculate the current occurrence
    final occurrence = (dayOfMonth / 7).ceil();

    return occurrence;
  }

  /// Function to check whether cuurent event instance is Last occurence of Week Day.
  ///
  /// **params**:
  /// * `date`: Date of the event.
  ///
  /// **returns**:
  /// * `bool`: Returns true if the current event instance is the last occurence of the week day.
  static bool isLastOccurenceOfWeekDay(DateTime date) {
    final currentDay = date.weekday;

    DateTime lastOccurenceInMonth = DateTime(
      date.year,
      date.month + 1,
      0,
    );

    // set the lastOccurenceInMonth to that day's last occurence
    while (lastOccurenceInMonth.weekday != currentDay) {
      lastOccurenceInMonth = DateTime(
        lastOccurenceInMonth.year,
        lastOccurenceInMonth.month,
        lastOccurenceInMonth.day - 1,
      );
    }

    return date.day == lastOccurenceInMonth.day;
  }
}
