# Method: `add`

## Description

Returns a new [DateTime] instance with [duration] added to this [DateTime].

 ```dart
 final today = DateTime.;
 final fiftyDaysFromNow = today.add(const Duration(days: 50));
 ```

 Notice that the duration being added is actually 50 * 24 * 60 * 60
 seconds. If the resulting `DateTime` has a different daylight saving offset
 than `this`, then the result won't have the same time-of-day as `this`, and
 may not even hit the calendar date 50 days later.

 Be careful when working with dates in local time.

## Return Type
`DateTime`

## Parameters

- `duration`: `Duration`
