# Method: `isAltPressed`

## Description

Returns true if a ALT modifier key is pressed, regardless of which side
 of the keyboard it is on.

 This method is deprecated and will be removed. Use
 [HardwareKeyboard.isAltPressed] instead.

 The `AltGr` key that appears on some keyboards is considered to be
 the same as [LogicalKeyboardKey.altRight] on some platforms (notably
 Android). On platforms that can distinguish between `altRight` and
 `altGr`, a press of `AltGr` will not return true here, and will need to be
 tested for separately.

 Use [isKeyPressed] if you need to know which alt key was pressed.

## Return Type
`bool`

