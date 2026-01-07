# Method: `getModifierSide`

## Description

Returns a [KeyboardSide] enum value that describes which side or sides of
 the given keyboard modifier key were pressed at the time of this event.

 This method is deprecated and will be removed.

 If the modifier key wasn't pressed at the time of this event, returns
 null. If the given key only appears in one place on the keyboard, returns
 [KeyboardSide.all] if pressed. If the given platform does not specify
 the side, return [KeyboardSide.any].

## Return Type
`KeyboardSide?`

## Parameters

- `key`: `ModifierKey`
