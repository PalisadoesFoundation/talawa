# Method: `keyLabel`

## Description

Returns the Unicode string representing the label on this key.

 This value is an empty string if there's no key label data for a key.

 
 Do not use the [keyLabel] to compose a text string: it will be missing
 special processing for Unicode strings for combining characters and other
 special characters, and the effects of modifiers.

 If you are looking for the character produced by a key event, use
 [RawKeyEvent.character] instead.

 If you are composing text strings, use the [TextField] or
 [CupertinoTextField] widgets, since those automatically handle many of the
 complexities of managing keyboard input, like showing a soft keyboard or
 interacting with an input method editor (IME).
 

## Return Type
`String`

