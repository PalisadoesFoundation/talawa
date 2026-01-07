# Overview for `TextInputFormatter`

## Description

A [TextInputFormatter] can be optionally injected into an [EditableText]
 to provide as-you-type validation and formatting of the text being edited.

 Text modification should only be applied when text is being committed by the
 IME and not on text under composition (i.e., only when
 [TextEditingValue.composing] is collapsed).

 See also the [FilteringTextInputFormatter], a subclass that
 removes characters that the user tries to enter if they do, or do
 not, match a given pattern (as applicable).

 To create custom formatters, extend the [TextInputFormatter] class and
 implement the [formatEditUpdate] method.

 ## Handling emojis and other complex characters
 

 See also:

  * [EditableText] on which the formatting apply.
  * [FilteringTextInputFormatter], a provided formatter for filtering
    characters.

## Constructors

### Unnamed Constructor
This constructor enables subclasses to provide const constructors so that they can be used in const expressions.

### withFunction
A shorthand to creating a custom [TextInputFormatter] which formats
 incoming text input changes with the given function.

#### Parameters

- `formatFunction`: `TextInputFormatFunction`
