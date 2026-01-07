# Method: `getLeadingTextBoundaryAt`

## Description

Returns the offset of the closest text boundary before or at the given
 `position`, or null if no boundaries can be found.

 The return value, if not null, is usually less than or equal to `position`.

 The range of the return value is given by the closed interval
 `[0, string.length]`.

## Return Type
`int?`

## Parameters

- `position`: `int`
