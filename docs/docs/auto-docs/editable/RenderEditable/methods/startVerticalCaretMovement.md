# Method: `startVerticalCaretMovement`

## Description

Starts a [VerticalCaretMovementRun] at the given location in the text, for
 handling consecutive vertical caret movements.

 This can be used to handle consecutive upward/downward arrow key movements
 in an input field.

 

 The [VerticalCaretMovementRun.isValid] property indicates whether the text
 layout has changed and the vertical caret run is invalidated.

 The caller should typically discard a [VerticalCaretMovementRun] when
 its [VerticalCaretMovementRun.isValid] becomes false, or on other
 occasions where the vertical caret run should be interrupted.

## Return Type
`VerticalCaretMovementRun`

## Parameters

- `startPosition`: `TextPosition`
