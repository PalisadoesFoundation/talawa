# Overview for `RawKeyboardListener`

## Description

A widget that calls a callback whenever the user presses or releases a key
 on a keyboard.

 The [RawKeyboardListener] is deprecated and will be removed. Use
 [KeyboardListener] instead.

 A [RawKeyboardListener] is useful for listening to raw key events and
 hardware buttons that are represented as keys. Typically used by games and
 other apps that use keyboards for purposes other than text entry.

 For text entry, consider using a [EditableText], which integrates with
 on-screen keyboards and input method editors (IMEs).

 See also:

  * [EditableText], which should be used instead of this widget for text
    entry.
  * [KeyboardListener], a similar widget based on the newer [HardwareKeyboard]
    API.

## Dependencies

- StatefulWidget

## Members

- **focusNode**: `FocusNode`
  Controls whether this widget has keyboard focus.

- **autofocus**: `bool`
  

- **includeSemantics**: `bool`
  

- **onKey**: `ValueChanged&lt;RawKeyEvent&gt;?`
  Called whenever this widget receives a raw keyboard event.

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a widget that receives raw keyboard events.

 For text entry, consider using a [EditableText], which integrates with
 on-screen keyboards and input method editors (IMEs).

