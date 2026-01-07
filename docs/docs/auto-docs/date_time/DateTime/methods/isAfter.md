# Method: `isAfter`

## Description

Whether this [DateTime] occurs after [other].

 The comparison is independent
 of whether the time is in UTC or in the local time zone.

 ```dart
 final now = DateTime.;
 final later = now.add(const Duration(seconds: 5));
 print(later.isAfter(now)); // true
 print(!now.isBefore(now)); // true

 // This relation stays the same, even when changing timezones.
 print(later.isAfter(now.)); // true
 print(later..isAfter(now)); // true

 print(!now..isAfter(now)); // true
 print(!now.isAfter(now.)); // true
 ```

## Return Type
`bool`

## Parameters

- `other`: `DateTime`
