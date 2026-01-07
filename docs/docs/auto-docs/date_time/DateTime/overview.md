# Overview for `DateTime`

## Description

An instant in time, such as July 20, 1969, 8:18pm GMT.

 DateTimes can represent time values that are at a distance of at most
 100,000,000 days from epoch (1970-01-01 UTC): -271821-04-20 to 275760-09-13.

 Create a `DateTime` object by using one of the constructors
 or by parsing a correctly formatted string,
 which complies with a subset of ISO 8601.
 **Note:** hours are specified between 0 and 23,
 as in a 24-hour clock.

 For example:
 ```dart
 final now = DateTime.;
 final berlinWallFell = DateTime.utc(1989, 11, 9);
 final moonLanding = DateTime.parse('1969-07-20 20:18:04Z'); // 8:18pm
 ```

 A `DateTime` object is anchored either in the UTC time zone
 or in the local time zone of the current computer
 when the object is created.

 Once created, neither the value nor the time zone
 of a `DateTime` object may be changed.

 You can use properties to get
 the individual units of a `DateTime` object.
 ```
 print(berlinWallFell.year); // 1989
 print(berlinWallFell.month); // 11
 print(berlinWallFell.day); // 9
 print(moonLanding.hour); // 20
 print(moonLanding.minute); // 18
 ```
 For convenience and readability,
 the `DateTime` class provides a constant for each `day` and `month`
 name - for example, [august] and [friday].
 You can use these constants to improve code readability:
 ```dart
 final berlinWallFell = DateTime.utc(1989, DateTime.november, 9);
 print(DateTime.november); // 11
 assert(berlinWallFell.month == DateTime.november);
 assert(berlinWallFell.weekday == DateTime.thursday);
 ```

 `Day` and `month` values begin at 1, and the week starts on `Monday`.
 That is, the constants [january] and [monday] are both 1.

 ## Working with UTC and local time

 A `DateTime` object is in the local time zone
 unless explicitly created in the UTC time zone.
 Use [isUtc] to determine whether a `DateTime` object is based in UTC.

 ```dart
 final dDay = DateTime.utc(1944, 6, 6);
 print(dDay.isUtc); // true

 final dDayLocal = DateTime(1944, 6, 6);
 print(dDayLocal.isUtc); // false
 ```
 Use the methods [toLocal] and [toUtc]
 to get the equivalent date/time value specified in the other time zone.
 ```
 final localDay = dDay.; // e.g. 1944-06-06 02:00:00.000
 print(localDay.isUtc); // false

 final utcFromLocal = localDay.; // 1944-06-06 00:00:00.000Z
 print(utcFromLocal.isUtc); // true
 ```
 Use [timeZoneName] to get an abbreviated name of the time zone
 for the `DateTime` object.
 ```
 print(dDay.timeZoneName); // UTC
 print(localDay.timeZoneName); // e.g. EET
 ```
 To find the difference
 between UTC and the time zone of a `DateTime` object
 call [timeZoneOffset].
 ```
 print(dDay.timeZoneOffset); // 0:00:00.000000
 print(localDay.timeZoneOffset); // e.g. 2:00:00.000000
 ```

 ## Comparing DateTime objects

 The `DateTime` class contains methods for comparing `DateTime`s
 chronologically, such as [isAfter], [isBefore], and [isAtSameMomentAs].
 ```
 print(berlinWallFell.isAfter(moonLanding)); // true
 print(berlinWallFell.isBefore(moonLanding)); // false
 print(dDay.isAtSameMomentAs(localDay)); // true
 ```

 ## Using DateTime with Duration

 Use the [add] and [subtract] methods with a [Duration] object
 to create a `DateTime` object based on another.
 For example, to find the point in time that is 36 hours after now,
 you can write:
 ```dart
 final now = DateTime.;
 final later = now.add(const Duration(hours: 36));
 ```

 To find out how much time is between two `DateTime` objects use
 [difference], which returns a [Duration] object:
 ```
 final difference = berlinWallFell.difference(moonLanding);
 print(difference.inDays); // 7416
 ```

 The difference between two dates in different time zones
 is just the number of nanoseconds between the two points in time.
 It doesn't take calendar days into account.
 That means that the difference between two midnights in local time may be
 less than 24 hours times the number of days between them,
 if there is a daylight saving change in between.
 If the difference above is calculated using Australian local time, the
 difference is 7415 days and 23 hours, which is only 7415 whole days as
 reported by `inDays`.

 ## Other resources

  * See [Duration] to represent a span of time.
  * See [Stopwatch] to measure timespans.
  * The `DateTime` class does not provide internationalization.
  To internationalize your code, use
  the [intl](https://pub.dev/packages/intl) package.

## Dependencies

- Comparable

## Members

- **monday**: `int`
- **tuesday**: `int`
- **wednesday**: `int`
- **thursday**: `int`
- **friday**: `int`
- **saturday**: `int`
- **sunday**: `int`
- **daysPerWeek**: `int`
- **january**: `int`
- **february**: `int`
- **march**: `int`
- **april**: `int`
- **may**: `int`
- **june**: `int`
- **july**: `int`
- **august**: `int`
- **september**: `int`
- **october**: `int`
- **november**: `int`
- **december**: `int`
- **monthsPerYear**: `int`
- **isUtc**: `bool`
  True if this [DateTime] is set to UTC time.

 ```dart
 final dDay = DateTime.utc(1944, 6, 6);
 print(dDay.isUtc); // true

 final local = DateTime(1944, 6, 6);
 print(local.isUtc); // false
 ```

- **_maxMillisecondsSinceEpoch**: `int`
- **_maxMicrosecondsSinceEpoch**: `int`
- **_parseFormat**: `RegExp`
## Constructors

### Unnamed Constructor
Constructs a [DateTime] instance specified in the local time zone.

 For example,
 to create a `DateTime` object representing the 7th of September 2017,
 5:30pm

 ```dart
 final dentistAppointment = DateTime(2017, 9, 7, 17, 30);
 ```

### utc
Constructs a [DateTime] instance specified in the UTC time zone.

 ```dart
 final moonLanding = DateTime.utc(1969, 7, 20, 20, 18, 04);
 ```

 When dealing with dates or historic events, preferably use UTC DateTimes,
 since they are unaffected by daylight-saving changes and are unaffected
 by the local timezone.

#### Parameters

- `year`: `int`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### now
Constructs a [DateTime] instance with current date and time in the
 local time zone.

 ```dart
 final now = DateTime.;
 ```

### timestamp
Constructs a [DateTime] with the current UTC date and time.


 ```dart
 final mark = DateTime.;
 ```

### _nowUtc


### fromMillisecondsSinceEpoch
Constructs a new [DateTime] instance
 with the given [millisecondsSinceEpoch].

 If [isUtc] is false then the date is in the local time zone.

 The constructed [DateTime] represents
 1970-01-01T00:00:00Z + [millisecondsSinceEpoch] ms in the given
 time zone (local or UTC).
 ```dart
 final newYearsDay =
     DateTime.fromMillisecondsSinceEpoch(1641031200000, isUtc:true);
 print(newYearsDay); // 2022-01-01 10:00:00.000Z
 ```

#### Parameters

- `millisecondsSinceEpoch`: `int`
- ``: `dynamic`
### fromMicrosecondsSinceEpoch
Constructs a new [DateTime] instance
 with the given [microsecondsSinceEpoch].

 If [isUtc] is false, then the date is in the local time zone.

 The constructed [DateTime] represents
 1970-01-01T00:00:00Z + [microsecondsSinceEpoch] us in the given
 time zone (local or UTC).
 ```dart
 final newYearsEve =
     DateTime.fromMicrosecondsSinceEpoch(1640979000000000, isUtc:true);
 print(newYearsEve); // 2021-12-31 19:30:00.000Z
 ```

#### Parameters

- `microsecondsSinceEpoch`: `int`
- ``: `dynamic`
### _internal


#### Parameters

- `year`: `int`
- `month`: `int`
- `day`: `int`
- `hour`: `int`
- `minute`: `int`
- `second`: `int`
- `millisecond`: `int`
- `microsecond`: `int`
- `isUtc`: `bool`
### _now


