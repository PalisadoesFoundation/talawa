# Method: `shouldAcceptUserOffset`

## Description

Whether the scrollable should let the user adjust the scroll offset, for
 example by dragging. If [allowUserScrolling] is false, the scrollable
 will never allow user input to change the scroll position.

 By default, the user can manipulate the scroll offset if, and only if,
 there is actually content outside the viewport to reveal.

 The given `position` is only valid during this method call. Do not keep a
 reference to it to use later, as the values may update, may not update, or
 may update to reflect an entirely unrelated scrollable.

## Return Type
`bool`

## Parameters

- `position`: `ScrollMetrics`
