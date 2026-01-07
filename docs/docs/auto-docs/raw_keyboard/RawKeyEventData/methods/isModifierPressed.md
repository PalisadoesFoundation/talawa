# Method: `isModifierPressed`

## Description

Returns true if the given [ModifierKey] was pressed at the time of this
 event.

 This method is deprecated and will be removed. For equivalent information,
 inspect [HardwareKeyboard.logicalKeysPressed] instead.

 If [side] is specified, then this restricts its check to the specified
 side of the keyboard. Defaults to checking for the key being down on
 either side of the keyboard. If there is only one instance of the key on
 the keyboard, then [side] is ignored.

## Return Type
`bool`

## Parameters

- `key`: `ModifierKey`
- ``: `dynamic`
