# Overview for `KeyboardListener`

## Description

A widget that calls a callback whenever the user presses or releases a key
 on a keyboard.

 A [KeyboardListener] is useful for listening to key events and
 hardware buttons that are represented as keys. Typically used by games and
 other apps that use keyboards for purposes other than text entry.

 For text entry, consider using a [EditableText], which integrates with
 on-screen keyboards and input method editors (IMEs).

 See also:

  * [EditableText], which should be used instead of this widget for text
    entry.

## Dependencies

- StatelessWidget

## Members

- **focusNode**: `FocusNode`
  Controls whether this widget has keyboard focus.

- **autofocus**: `bool`
  

- **includeSemantics**: `bool`
  

- **onKeyEvent**: `ValueChanged&lt;KeyEvent&gt;?`
  Called whenever this widget receives a keyboard event.

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a widget that receives keyboard events.

 For text entry, consider using a [EditableText], which integrates with
 on-screen keyboards and input method editors (IMEs).

 The `key` is an identifier for widgets, and is unrelated to keyboards.
 See [Widget.key].

