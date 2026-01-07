# Overview for `CupertinoTextFormFieldRow`

## Description

Creates a [CupertinoFormRow] containing a [FormField] that wraps
 a [CupertinoTextField].

 A [Form] ancestor is not required. The [Form] allows one to
 save, reset, or validate multiple fields at once. To use without a [Form],
 pass a [GlobalKey] to the constructor and use [GlobalKey.currentState] to
 save or reset the form field.

 When a [controller] is specified, its [TextEditingController.text]
 defines the [initialValue]. If this [FormField] is part of a scrolling
 container that lazily constructs its children, like a [ListView] or a
 [CustomScrollView], then a [controller] should be specified.
 The controller's lifetime should be managed by a stateful widget ancestor
 of the scrolling container.

 The [prefix] parameter is displayed at the start of the row. Standard iOS
 guidelines encourage passing a [Text] widget to [prefix] to detail the
 nature of the input.

 The [padding] parameter is used to pad the contents of the row. It is
 directly passed to [CupertinoFormRow]. If the [padding]
 parameter is null, [CupertinoFormRow] constructs its own default
 padding (which is the standard form row padding in iOS.) If no edge
 insets are intended, explicitly pass [EdgeInsets.zero] to [padding].

 If a [controller] is not specified, [initialValue] can be used to give
 the automatically generated controller an initial value.

 Consider calling [TextEditingController.dispose] of the [controller], if one
 is specified, when it is no longer needed. This will ensure we discard any
 resources used by the object.

 For documentation about the various parameters, see the
 [CupertinoTextField] class and [CupertinoTextField.borderless],
 the constructor.

 

 Creates a [CupertinoTextFormFieldRow] with a leading text and validator
 function.

 If the user enters valid text, the CupertinoTextField appears normally
 without any warnings to the user.

 If the user enters invalid text, the error message returned from the
 validator function is displayed in dark red underneath the input.

 ```dart
 CupertinoTextFormFieldRow(
   prefix: const Text('Username'),
   onSaved: (String? value) ,
   validator: (String? value) ,
 )
 ```
 

 
 This example shows how to move the focus to the next field when the user
 presses the SPACE key.

 ** See code in examples/api/lib/cupertino/text_form_field_row/cupertino_text_form_field_row.1.dart **
 

## Dependencies

- FormField

## Members

- **prefix**: `Widget?`
  A widget that is displayed at the start of the row.

 The [prefix] widget is displayed at the start of the row. Standard iOS
 guidelines encourage passing a [Text] widget to [prefix] to detail the
 nature of the input.

- **padding**: `EdgeInsetsGeometry?`
  Content padding for the row.

 The [padding] widget is passed to [CupertinoFormRow]. If the [padding]
 parameter is null, [CupertinoFormRow] constructs its own default
 padding, which is the standard form row padding in iOS.

 If no edge insets are intended, explicitly pass [EdgeInsets.zero] to
 [padding].

- **controller**: `TextEditingController?`
  Controls the text being edited.

 If null, this widget will create its own [TextEditingController] and
 initialize its [TextEditingController.text] with [initialValue].

- **onChanged**: `ValueChanged&lt;String&gt;?`
  

## Constructors

### Unnamed Constructor
Creates a [CupertinoFormRow] containing a [FormField] that wraps
 a [CupertinoTextField].

 When a [controller] is specified, [initialValue] must be null (the
 default). If [controller] is null, then a [TextEditingController]
 will be constructed automatically and its `text` will be initialized
 to [initialValue] or the empty string.

 The [prefix] parameter is displayed at the start of the row. Standard iOS
 guidelines encourage passing a [Text] widget to [prefix] to detail the
 nature of the input.

 The [padding] parameter is used to pad the contents of the row. It is
 directly passed to [CupertinoFormRow]. If the [padding]
 parameter is null, [CupertinoFormRow] constructs its own default
 padding (which is the standard form row padding in iOS.) If no edge
 insets are intended, explicitly pass [EdgeInsets.zero] to [padding].

 For documentation about the various parameters, see the
 [CupertinoTextField] class and [CupertinoTextField.borderless],
 the constructor.

