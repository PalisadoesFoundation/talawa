# Method: `compareTo`

## Description

Compares this DateTime object to [other],
 returning zero if the values are equal.

 A [compareTo] function returns:
  * a negative value if this DateTime [isBefore] [other].
  * `0` if this DateTime [isAtSameMomentAs] [other], and
  * a positive value otherwise (when this DateTime [isAfter] [other]).

 ```dart
 final now = DateTime.;
 final future = now.add(const Duration(days: 2));
 final past = now.subtract(const Duration(days: 2));
 final newDate = now.;

 print(now.compareTo(future)); // -1
 print(now.compareTo(past)); // 1
 print(now.compareTo(newDate)); // 0
 ```

## Return Type
`int`

## Parameters

- `other`: `DateTime`
