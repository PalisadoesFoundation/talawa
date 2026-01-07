# Method: `toLocal`

## Description

Returns this DateTime value in the local time zone.

 Returns this [DateTime] if it is already in the local time zone.
 Otherwise this method is equivalent to:

 ```dart template:expression
 DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch,
                                     isUtc: false)
 ```

## Return Type
`DateTime`

