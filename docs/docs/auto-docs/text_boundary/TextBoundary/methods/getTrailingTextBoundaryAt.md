# Method: `getTrailingTextBoundaryAt`

## Description

Returns the offset of the closest text boundary after the given
 `position`, or null if there is no boundary can be found after `position`.

 The return value, if not null, is usually greater than `position`.

 The range of the return value is given by the closed interval
 `[0, string.length]`.

## Return Type
`int?`

## Parameters

- `position`: `int`
