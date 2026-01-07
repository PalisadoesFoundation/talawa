# Method: `microsecondsSinceEpoch`

## Description

The number of microseconds since
 the "Unix epoch" 1970-01-01T00:00:00Z (UTC).

 This value is independent of the time zone.

 This value is at most
 8,640,000,000,000,000,000us (100,000,000 days) from the Unix epoch.
 In other words: `microsecondsSinceEpoch. <= 8640000000000000000`.

 Note that this value does not always fit into 53 bits (the size of a IEEE
 double).  On the web JavaScript platforms, there may be a rounding error
 for DateTime values sufficiently far from the epoch. The year range close
 to the epoch to avoid rounding is approximately 1685..2254.

## Return Type
`int`

