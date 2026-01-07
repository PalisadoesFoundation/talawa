# Method: `accepts`

## Description

Whether the triggering `event` and the keyboard `state` at the time of the
 event meet required conditions, providing that the event is a triggering
 event.

 For example, for `Ctrl-A`, it has to check if the event is a
 [KeyDownEvent], if either side of the Ctrl key is pressed, and none of the
 Shift keys, Alt keys, or Meta keys are pressed; it doesn't have to check
 if KeyA is pressed, since it's already guaranteed.

 As a possible performance improvement, implementers of this function are
 encouraged (but not required) to check the [triggers] member, if it is
 non-null, to see if it contains the event's logical key before doing more
 complicated work.

 This method must not cause any side effects for the `state`. Typically
 this is only used to query whether [HardwareKeyboard.logicalKeysPressed]
 contains a key.

 See also:

 * [LogicalKeyboardKey.collapseSynonyms], which helps deciding whether a
   modifier key is pressed when the side variation is not important.

## Return Type
`bool`

## Parameters

- `event`: `KeyEvent`
- `state`: `HardwareKeyboard`
