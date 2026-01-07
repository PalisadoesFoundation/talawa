# Method: `enterText`

## Description

Enters `text` into the currently focused text input, such as the
 [EditableText] widget.

 This method does not use the operating system keyboard to enter text.
 Instead it emulates text entry by sending events identical to those sent
 by the operating system keyboard (the "TextInputClient.updateEditingState"
 method channel call).

 Generally the behavior is dependent on the implementation of the widget
 receiving the input. Usually, editable widgets, such as [EditableText] and
 those built on top of it would replace the currently entered text with the
 provided `text`.

 It is assumed that the widget receiving text input is focused prior to
 calling this method. Typically, a test would activate a widget, e.g. using
 [tap], then call this method.

 For this method to work, text emulation must be enabled (see
 [setTextEntryEmulation]). Text emulation is enabled by default.

 Example:

 ```dart
 test('enters text in a text field',  async );
 ```

## Return Type
`Future&lt;void&gt;`

## Parameters

- `text`: `String`
- ``: `dynamic`
