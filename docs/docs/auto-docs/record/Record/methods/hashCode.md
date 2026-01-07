# Method: `hashCode`

## Description

A hash-code compatible with `==`.

 Since [operator==] is defined in terms of the `==` operators of
 the record's field values, the hash code is also computed based on the
 [Object.hashCode] of the field values.

 There is no guaranteed order in which the `hashCode` of field values
 is accessed.
 It's unspecified how those values are combined,
 other than it being consistent throughout a single program execution.

## Return Type
`int`

