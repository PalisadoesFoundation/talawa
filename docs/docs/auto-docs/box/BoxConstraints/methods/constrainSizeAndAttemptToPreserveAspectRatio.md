# Method: `constrainSizeAndAttemptToPreserveAspectRatio`

## Description

Returns a size that attempts to meet the following conditions, in order:

  * The size must satisfy these constraints.
  * The aspect ratio of the returned size matches the aspect ratio of the
    given size.
  * The returned size is as big as possible while still being equal to or
    smaller than the given size.

## Return Type
`Size`

## Parameters

- `size`: `Size`
