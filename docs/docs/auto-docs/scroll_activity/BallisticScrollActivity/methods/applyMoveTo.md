# Method: `applyMoveTo`

## Description

Move the position to the given location.

 If the new position was fully applied, returns true. If there was any
 overflow, returns false.

 The default implementation calls [ScrollActivityDelegate.setPixels]
 and returns true if the overflow was zero.

## Return Type
`bool`

## Parameters

- `value`: `double`
