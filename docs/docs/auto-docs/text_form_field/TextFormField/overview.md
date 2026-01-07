# Overview for `TextFormField`

## Description

A [FormField] that contains a [TextField].

 This is a convenience widget that wraps a [TextField] widget in a
 [FormField].

 A [Form] ancestor is not required. The [Form] allows one to
 save, reset, or validate multiple fields at once. To use without a [Form],
 pass a `GlobalKey&lt;FormFieldState&gt;` (see [GlobalKey]) to the constructor and use
 [GlobalKey.currentState] to save or reset the form field.

 When a [controller] is specified, its [TextEditingController.text]
 defines the [initialValue]. If this [FormField] is part of a scrolling
 container that lazily constructs its children, like a [ListView] or a
 [CustomScrollView], then a [controller] should be specified.
 The controller's lifetime should be managed by a stateful widget ancestor
 of the scrolling container.

 If a [controller] is not specified, [initialValue] can be used to give
 the automatically generated controller an initial value.

 

 Remember to call [TextEditingController.dispose] of the [TextEditingController]
 when it is no longer needed. This will ensure any resources used by the object
 are discarded.

 By default, `decoration` will apply the [ThemeData.inputDecorationTheme] for
 the current context to the [InputDecoration], see
 [InputDecoration.applyDefaults].

 For a documentation about the various parameters, see [TextField].

 

 Creates a [TextFormField] with an [InputDecoration] and validator function.

 ![If the user enters valid text, the TextField appears normally without any warnings to the user](https://flutter.github.io/assets-for-api-docs/assets/material/text_form_field.png)

 ![If the user enters invalid text, the error message returned from the validator function is displayed in dark red underneath the input](https://flutter.github.io/assets-for-api-docs/assets/material/text_form_field_error.png)

 ```dart
 TextFormField(
   decoration: const InputDecoration(
     icon: Icon(Icons.person),
     hintText: 'What do people call you?',
     labelText: 'Name *',
   ),
   onSaved: (String? value) ,
   validator: (String? value) ,
 )
 ```
 

 
 This example shows how to move the focus to the next field when the user
 presses the SPACE key.

 ** See code in examples/api/lib/material/text_form_field/text_form_field.1.dart **
 

 
 This example shows how to force an error text to the field after making
 an asynchronous call.

 ** See code in examples/api/lib/material/text_form_field/text_form_field.2.dart **
 

 See also:

  * <https://material.io/design/components/text-fields.html>
  * [TextField], which is the underlying text field without the [Form]
    integration.
  * [InputDecorator], which shows the labels and other visual elements that
    surround the actual text editing widget.
  * Learn how to use a [TextEditingController] in one of our [cookbook recipes](https://docs.flutter.dev/cookbook/forms/text-field-changes#2-use-a-texteditingcontroller).

## Dependencies

- FormField

## Members

- **controller**: `TextEditingController?`
  Controls the text being edited.

 If null, this widget will create its own [TextEditingController] and
 initialize its [TextEditingController.text] with [initialValue].

- **groupId**: `Object`
  

- **onChanged**: `ValueChanged&lt;String&gt;?`
  
 Called when the user initiates a change to the TextField's
 value: when they have inserted or deleted text or reset the form.
 

## Constructors

### Unnamed Constructor
Creates a [FormField] that contains a [TextField].

 When a [controller] is specified, [initialValue] must be null (the
 default). If [controller] is null, then a [TextEditingController]
 will be constructed automatically and its `text` will be initialized
 to [initialValue] or the empty string.

 For documentation about the various parameters, see the [TextField] class
 and [TextField.new], the constructor.

