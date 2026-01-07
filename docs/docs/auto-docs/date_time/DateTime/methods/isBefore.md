# Method: `isBefore`

## Description

Whether this [DateTime] occurs before [other].

 The comparison is independent
 of whether the time is in UTC or in the local time zone.

 ```dart
 final now = DateTime.;
 final earlier = now.subtract(const Duration(seconds: 5));
 print(earlier.isBefore(now)); // true
 print(!now.isBefore(now)); // true

 // This relation stays the same, even when changing timezones.
 print(earlier.isBefore(now.)); // true
 print(earlier..isBefore(now)); // true

 print(!now..isBefore(now)); // true
 print(!now.isBefore(now.)); // true
 ```

## Return Type
`bool`

## Parameters

- `other`: `DateTime`
