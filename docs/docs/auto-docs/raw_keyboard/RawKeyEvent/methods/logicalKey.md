# Method: `logicalKey`

## Description

Returns an object representing the logical key that was pressed.

 
 This method takes into account the key map and modifier keys (like SHIFT)
 to determine which logical key to return.

 If you are looking for the character produced by a key event, use
 [RawKeyEvent.character] instead.

 If you are collecting text strings, use the [TextField] or
 [CupertinoTextField] widgets, since those automatically handle many of the
 complexities of managing keyboard input, like showing a soft keyboard or
 interacting with an input method editor (IME).
 

## Return Type
`LogicalKeyboardKey`

