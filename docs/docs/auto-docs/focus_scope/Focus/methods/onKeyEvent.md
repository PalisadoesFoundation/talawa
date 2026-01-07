# Method: `onKeyEvent`

## Description

A handler for keys that are pressed when this object or one of its
 children has focus.

 Key events are first given to the [FocusNode] that has primary focus, and
 if its [onKeyEvent] method returns [KeyEventResult.ignored], then they are
 given to each ancestor node up the focus hierarchy in turn. If an event
 reaches the root of the hierarchy, it is discarded.

 This is not the way to get text input in the manner of a text field: it
 leaves out support for input method editors, and doesn't support soft
 keyboards in general. For text input, consider [TextField],
 [EditableText], or [CupertinoTextField] instead, which do support these
 things.

## Return Type
`FocusOnKeyEventCallback?`

