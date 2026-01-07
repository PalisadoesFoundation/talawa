# Method: `handleTapDown`

## Description

If [ignorePointer] is false (the default) then this method is called by
 the internal gesture recognizer's [TapGestureRecognizer.onTapDown]
 callback.

 When [ignorePointer] is true, an ancestor widget must respond to tap
 down events by calling this method.

## Return Type
`void`

## Parameters

- `details`: `TapDownDetails`
