# Method: `handleTapDown`

## Description

A pointer has contacted the screen, which might be the start of a tap.

 This triggers after the down event, once a short timeout ([deadline]) has
 elapsed, or once the gesture has won the arena, whichever comes first.

 The parameter `down` is the down event of the primary pointer that started
 the tap sequence.

 If this recognizer doesn't win the arena, [handleTapCancel] is called next.
 Otherwise, [handleTapUp] is called next.

## Return Type
`void`

## Parameters

- ``: `dynamic`
