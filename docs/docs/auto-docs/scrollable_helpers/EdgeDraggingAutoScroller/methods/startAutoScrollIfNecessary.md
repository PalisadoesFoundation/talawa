# Method: `startAutoScrollIfNecessary`

## Description

Starts the auto scroll if the [dragTarget] is close to the edge.

 The scroll starts to scroll the [scrollable] if the target rect is close
 to the edge of the [scrollable]; otherwise, it remains stationary.

 If the scrollable is already scrolling, calling this method updates the
 previous dragTarget to the new value and continues scrolling if necessary.

## Return Type
`void`

## Parameters

- `dragTarget`: `Rect`
