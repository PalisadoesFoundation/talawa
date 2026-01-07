# Method: `add`

## Description

Adds [value] to the set.

 Returns `true` if [value] (or an equal value) was not yet in the set.
 Otherwise returns `false` and the set is not changed.

 Example:
 ```dart
 final dateTimes = <DateTime>;
 final time1 = DateTime.fromMillisecondsSinceEpoch(0);
 final time2 = DateTime.fromMillisecondsSinceEpoch(0);
 // time1 and time2 are equal, but not identical.
 assert(time1 == time2);
 assert(!identical(time1, time2));
 final time1Added = dateTimes.add(time1);
 print(time1Added); // true
 // A value equal to time2 exists already in the set, and the call to
 // add doesn't change the set.
 final time2Added = dateTimes.add(time2);
 print(time2Added); // false

 print(dateTimes); // 
 assert(dateTimes.length == 1);
 assert(identical(time1, dateTimes.first));
 print(dateTimes.length);
 ```

## Return Type
`bool`

## Parameters

- `value`: `E`
