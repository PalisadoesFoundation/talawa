# Method: `pointerScroll`

## Description

Changes the scrolling position based on a pointer signal from current
 value to delta without animation and without checking if new value is in
 range, taking min/max scroll extent into account.

 Any active animation is canceled. If the user is currently scrolling, that
 action is canceled.

 This method dispatches the start/update/end sequence of scrolling
 notifications.

 This method is very similar to [jumpTo], but [pointerScroll] will
 update the [ScrollDirection].

## Return Type
`void`

## Parameters

- `delta`: `double`
