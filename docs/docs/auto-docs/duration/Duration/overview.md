# Overview for `Duration`

## Description

A span of time, such as 27 days, 4 hours, 12 minutes, and 3 seconds.

 A `Duration` represents a difference from one point in time to another. The
 duration may be "negative" if the difference is from a later time to an
 earlier.

 Durations are context independent. For example, a duration of 2 days is
 always 48 hours, even when it is added to a `DateTime` just when the
 time zone is about to make a daylight-savings switch. (See [DateTime.add]).

 Despite the same name, a `Duration` object does not implement "Durations"
 as specified by ISO 8601. In particular, a duration object does not keep
 track of the individually provided members (such as "days" or "hours"), but
 only uses these arguments to compute the length of the corresponding time
 interval.

 To create a new `Duration` object, use this class's single constructor
 giving the appropriate arguments:
 ```dart
 const fastestMarathon = Duration(hours: 2, minutes: 3, seconds: 2);
 ```
 The [Duration] represents a single number of microseconds,
 which is the sum of all the individual arguments to the constructor.

 Properties can access that single number in different ways.
 For example the [inMinutes] gives the number of whole minutes
 in the total duration, which includes the minutes that were provided
 as "hours" to the constructor, and can be larger than 59.

 ```dart
 const fastestMarathon = Duration(hours: 2, minutes: 0, seconds: 35);
 print(fastestMarathon.inDays); // 0
 print(fastestMarathon.inHours); // 2
 print(fastestMarathon.inMinutes); // 120
 print(fastestMarathon.inSeconds); // 7235
 print(fastestMarathon.inMilliseconds); // 7235000
 ```
 The duration can be negative, in which case
 all the properties derived from the duration are also non-positive.
 ```dart
 const overDayAgo = Duration(days: -1, hours: -10);
 print(overDayAgo.inDays); // -1
 print(overDayAgo.inHours); // -34
 print(overDayAgo.inMinutes); // -2040
 ```
 Use one of the properties, such as [inDays],
 to retrieve the integer value of the `Duration` in the specified time unit.
 Note that the returned value is rounded down.
 For example,
 ```dart
 const aLongWeekend = Duration(hours: 88);
 print(aLongWeekend.inDays); // 3
 ```
 This class provides a collection of arithmetic
 and comparison operators,
 plus a set of constants useful for converting time units.
 ```dart
 const firstHalf = Duration(minutes: 45); // 00:45:00.000000
 const secondHalf = Duration(minutes: 45); // 00:45:00.000000
 const overTime = Duration(minutes: 30); // 00:30:00.000000
 final maxGameTime = firstHalf + secondHalf + overTime;
 print(maxGameTime.inMinutes); // 120

 // The duration of the firstHalf and secondHalf is the same, returns 0.
 var result = firstHalf.compareTo(secondHalf);
 print(result); // 0

 // Duration of overTime is shorter than firstHalf, returns < 0.
 result = overTime.compareTo(firstHalf);
 print(result); // < 0

 // Duration of secondHalf is longer than overTime, returns > 0.
 result = secondHalf.compareTo(overTime);
 print(result); // > 0
 ```

 **See also:**
 * [DateTime] to represent a point in time.
 * [Stopwatch] to measure time-spans.

## Dependencies

- Comparable

## Members

- **microsecondsPerMillisecond**: `int`
  The number of microseconds per millisecond.

- **millisecondsPerSecond**: `int`
  The number of milliseconds per second.

- **secondsPerMinute**: `int`
  The number of seconds per minute.

 Notice that some minutes of official clock time might
 differ in length because of leap seconds.
 The [Duration] and [DateTime] classes ignore leap seconds
 and consider all minutes to have 60 seconds.

- **minutesPerHour**: `int`
  The number of minutes per hour.

- **hoursPerDay**: `int`
  The number of hours per day.

 Notice that some days may differ in length because
 of time zone changes due to daylight saving.
 The [Duration] class is time zone agnostic and
 considers all days to have 24 hours.

- **microsecondsPerSecond**: `int`
  The number of microseconds per second.

- **microsecondsPerMinute**: `int`
  The number of microseconds per minute.

- **microsecondsPerHour**: `int`
  The number of microseconds per hour.

- **microsecondsPerDay**: `int`
  The number of microseconds per day.

- **millisecondsPerMinute**: `int`
  The number of milliseconds per minute.

- **millisecondsPerHour**: `int`
  The number of milliseconds per hour.

- **millisecondsPerDay**: `int`
  The number of milliseconds per day.

- **secondsPerHour**: `int`
  The number of seconds per hour.

- **secondsPerDay**: `int`
  The number of seconds per day.

- **minutesPerDay**: `int`
  The number of minutes per day.

- **zero**: `Duration`
  An empty duration, representing zero time.

- **_duration**: `int`
  The total microseconds of this [Duration] object.

## Constructors

### Unnamed Constructor
Creates a new [Duration] object whose value
 is the sum of all individual parts.

 Individual parts can be larger than the number of those
 parts in the next larger unit.
 For example, [hours] can be greater than 23.
 If this happens, the value overflows into the next larger
 unit, so 26 [hours] is the same as 2 [hours] and
 one more [days].
 Likewise, values can be negative, in which case they
 underflow and subtract from the next larger unit.

 If the total number of microseconds cannot be represented
 as an integer value, the number of microseconds might overflow
 and be truncated to a smaller number of bits,
 or it might lose precision.

 All arguments are 0 by default.
 ```dart
 const duration = Duration(days: 1, hours: 8, minutes: 56, seconds: 59,
   milliseconds: 30, microseconds: 10);
 print(duration); // 32:56:59.030010
 ```

### _microseconds


#### Parameters

- `duration`: `int`
