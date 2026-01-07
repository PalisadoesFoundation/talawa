# Method: `handleTapUp`

## Description

A pointer has stopped contacting the screen, which is recognized as a tap.

 This triggers on the up event if the recognizer wins the arena with it
 or has previously won.

 The parameter `down` is the down event of the primary pointer that started
 the tap sequence, and `up` is the up event that ended the tap sequence.

 If this recognizer doesn't win the arena, [handleTapCancel] is called
 instead.

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
