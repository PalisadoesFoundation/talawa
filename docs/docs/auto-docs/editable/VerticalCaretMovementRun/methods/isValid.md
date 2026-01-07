# Method: `isValid`

## Description

Whether this [VerticalCaretMovementRun] can still continue.

 A [VerticalCaretMovementRun] run is valid if the underlying text layout
 hasn't changed.

 The [current] value and the [movePrevious], [moveNext] and [moveByOffset]
 methods must not be accessed when [isValid] is false.

## Return Type
`bool`

