# Method: `toUtc`

## Description

Returns this DateTime value in the UTC time zone.

 Returns this [DateTime] if it is already in UTC.
 Otherwise this method is equivalent to:

 ```dart template:expression
 DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch,
                                     isUtc: true)
 ```

## Return Type
`DateTime`

