# Method: `listToString`

## Description

Converts a [List] to a [String].

 Converts [list] to a string by converting each element to a string (by
 calling [Object.toString]), joining them with ", ", and wrapping the
 result in `[` and `]`.

 Handles circular references where converting one of the elements
 to a string ends up converting [list] to a string again.

## Return Type
`String`

## Parameters

- `list`: `List<Object?>`
