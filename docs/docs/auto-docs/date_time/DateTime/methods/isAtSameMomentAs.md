# Method: `isAtSameMomentAs`

## Description

Whether this [DateTime] occurs at the same moment as [other].

 The comparison is independent of whether the time is in UTC or in the local
 time zone.

 ```dart
 final now = DateTime.;
 final later = now.add(const Duration(seconds: 5));
 print(!later.isAtSameMomentAs(now)); // true
 print(now.isAtSameMomentAs(now)); // true

 // This relation stays the same, even when changing timezones.
 print(!later.isAtSameMomentAs(now.)); // true
 print(!later..isAtSameMomentAs(now)); // true

 print(now..isAtSameMomentAs(now)); // true
 print(now.isAtSameMomentAs(now.)); // true
 ```

## Return Type
`bool`

## Parameters

- `other`: `DateTime`
