# Method: `toIso8601String`

## Description

Returns an ISO-8601 full-precision extended format representation.

 The format is `yyyy-MM-ddTHH:mm:ss.mmmuuuZ` for UTC time, and
 `yyyy-MM-ddTHH:mm:ss.mmmuuu` (no trailing "Z") for local/non-UTC time,
 where:

 * `yyyy` is a, possibly negative, four digit representation of the year,
   if the year is in the range -9999 to 9999,
   otherwise it is a signed six digit representation of the year.
 * `MM` is the month in the range 01 to 12,
 * `dd` is the day of the month in the range 01 to 31,
 * `HH` are hours in the range 00 to 23,
 * `mm` are minutes in the range 00 to 59,
 * `ss` are seconds in the range 00 to 59 (no leap seconds),
 * `mmm` are milliseconds in the range 000 to 999, and
 * `uuu` are microseconds in the range 001 to 999. If [microsecond] equals
   0, then this part is omitted.

 The resulting string can be parsed back using [parse].
 ```dart
 final moonLanding = DateTime.utc(1969, 7, 20, 20, 18, 04);
 final isoDate = moonLanding.;
 print(isoDate); // 1969-07-20T20:18:04.000Z
 ```

## Return Type
`String`

