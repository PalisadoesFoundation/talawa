# Method: `subtract`

## Description

Returns a new [DateTime] instance with [duration] subtracted from this
 [DateTime].

 ```dart
 final today = DateTime.;
 final fiftyDaysAgo = today.subtract(const Duration(days: 50));
 ```

 Notice that the duration being subtracted is actually 50 * 24 * 60 * 60
 seconds. If the resulting `DateTime` has a different daylight saving offset
 than `this`, then the result won't have the same time-of-day as `this`, and
 may not even hit the calendar date 50 days earlier.

 Be careful when working with dates in local time.

## Return Type
`DateTime`

## Parameters

- `duration`: `Duration`
