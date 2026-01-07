# Overview for `TextEditingController`

## Description

A controller for an editable text field.

 Whenever the user modifies a text field with an associated
 [TextEditingController], the text field updates [value] and the controller
 notifies its listeners. Listeners can then read the [text] and [selection]
 properties to learn what the user has typed or how the selection has been
 updated.

 Similarly, if you modify the [text] or [selection] properties, the text
 field will be notified and will update itself appropriately.

 A [TextEditingController] can also be used to provide an initial value for a
 text field. If you build a text field with a controller that already has
 [text], the text field will use that text as its initial value.

 The [value] (as well as [text] and [selection]) of this controller can be
 updated from within a listener added to this controller. Be aware of
 infinite loops since the listener will also be notified of the changes made
 from within itself. Modifying the composing region from within a listener
 can also have a bad interaction with some input methods. Gboard, for
 example, will try to restore the composing region of the text if it was
 modified programmatically, creating an infinite loop of communications
 between the framework and the input method. Consider using
 [TextInputFormatter]s instead for as-you-type text modification.

 If both the [text] and [selection] properties need to be changed, set the
 controller's [value] instead. Setting [text] will clear the selection
 and composing range.

 Remember to [dispose] of the [TextEditingController] when it is no longer
 needed. This will ensure we discard any resources used by the object.

 
 This example creates a [TextField] with a [TextEditingController] whose
 change listener forces the entered text to be lower case and keeps the
 cursor at the end of the input.

 ** See code in examples/api/lib/widgets/editable_text/text_editing_controller.0.dart **
 

 See also:

  * [TextField], which is a Material Design text field that can be controlled
    with a [TextEditingController].
  * [EditableText], which is a raw region of editable text that can be
    controlled with a [TextEditingController].
  * Learn how to use a [TextEditingController] in one of our [cookbook recipes](https://docs.flutter.dev/cookbook/forms/text-field-changes#2-use-a-texteditingcontroller).

## Dependencies

- ValueNotifier

## Constructors

### Unnamed Constructor
Creates a controller for an editable text field, with no initial selection.

 This constructor treats a null [text] argument as if it were the empty
 string.

 The initial selection is `TextSelection.collapsed(offset: -1)`.
 This indicates that there is no selection at all ([TextSelection.isValid]
 is false in this case). When a text field is built with a controller whose
 selection is not valid, the text field will update the selection when it
 is focused (the selection will be an empty selection positioned at the
 end of the text).

 Consider using [TextEditingController.fromValue] to initialize both the
 text and the selection.

 
 This example creates a [TextField] with a [TextEditingController] whose
 initial selection is empty (collapsed) and positioned at the beginning
 of the text (offset is 0).

 ** See code in examples/api/lib/widgets/editable_text/text_editing_controller.1.dart **
 

### fromValue
Creates a controller for an editable text field from an initial [TextEditingValue].

 This constructor treats a null [value] argument as if it were
 [TextEditingValue.empty].

#### Parameters

- `value`: `TextEditingValue?`
