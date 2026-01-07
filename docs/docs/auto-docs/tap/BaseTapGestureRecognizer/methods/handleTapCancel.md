# Method: `handleTapCancel`

## Description

A pointer that previously triggered [handleTapDown] will not end up
 causing a tap.

 This triggers once the gesture loses the arena if [handleTapDown] has
 been previously triggered.

 The parameter `down` is the down event of the primary pointer that started
 the tap sequence; `cancel` is the cancel event, which might be null;
 `reason` is a short description of the cause if `cancel` is null, which
 can be "forced" if other gestures won the arena, or "spontaneous"
 otherwise.

 If this recognizer wins the arena, [handleTapUp] is called instead.

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
