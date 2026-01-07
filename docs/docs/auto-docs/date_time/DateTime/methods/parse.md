# Method: `parse`

## Description

Constructs a new [DateTime] instance based on [formattedString].

 Throws a [FormatException] if the input string cannot be parsed.

 The function parses a subset of ISO 8601,
 which includes the subset accepted by RFC 3339.

 The accepted inputs are currently:

 * A date: A signed four-to-six digit year, two digit month and
   two digit day, optionally separated by `-` characters.
   Examples: "19700101", "-0004-12-24", "81030-04-01".
 * An optional time part, separated from the date by either `T` or a space.
   The time part is a two digit hour,
   then optionally a two digit minutes value,
   then optionally a two digit seconds value, and
   then optionally a '.' or ',' followed by at least a one digit
   second fraction.
   The minutes and seconds may be separated from the previous parts by a
   ':'.
   Examples: "12", "12:30:24.124", "12:30:24,124", "123010.50".
 * An optional time-zone offset part,
   possibly separated from the previous by a space.
   The time zone is either 'z' or 'Z', or it is a signed two digit hour
   part and an optional two digit minute part. The sign must be either
   "+" or "-", and cannot be omitted.
   The minutes may be separated from the hours by a ':'.
   Examples: "Z", "-10", "+01:30", "+1130".

 This includes the output of both [toString] and [toIso8601String], which
 will be parsed back into a `DateTime` object with the same time as the
 original.

 The result is always in either local time or UTC.
 If a time zone offset other than UTC is specified,
 the time is converted to the equivalent UTC time.

 Examples of accepted strings:

 * `"2012-02-27"`
 * `"2012-02-27 13:27:00"`
 * `"2012-02-27 13:27:00.123456789z"`
 * `"2012-02-27 13:27:00,123456789z"`
 * `"20120227 13:27:00"`
 * `"20120227T132700"`
 * `"20120227"`
 * `"+20120227"`
 * `"2012-02-27T14Z"`
 * `"2012-02-27T14+00:00"`
 * `"-123450101 00:00:00 Z"`: in the year -12345.
 * `"2002-02-27T14:00:00-0500"`: Same as `"2002-02-27T19:00:00Z"`

 This method accepts out-of-range component values and interprets
 them as overflows into the next larger component.
 For example, "2020-01-42" will be parsed as 2020-02-11, because
 the last valid date in that month is 2020-01-31, so 42 days is
 interpreted as 31 days of that month plus 11 days into the next month.

 To detect and reject invalid component values, use
 [DateFormat.parseStrict](https://pub.dev/documentation/intl/latest/intl/DateFormat/parseStrict.html)
 from the [intl](https://pub.dev/packages/intl) package.

## Return Type
`DateTime`

## Parameters

- `formattedString`: `String`
