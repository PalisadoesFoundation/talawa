# Overview for `Form`

## Description

An optional container for grouping together multiple form field widgets
 (e.g. [TextField] widgets).

 Each individual form field should be wrapped in a [FormField] widget, with
 the [Form] widget as a common ancestor of all of those. Call methods on
 [FormState] to save, reset, or validate each [FormField] that is a
 descendant of this [Form]. To obtain the [FormState], you may use [Form.of]
 with a context whose ancestor is the [Form], or pass a [GlobalKey] to the
 [Form] constructor and call [GlobalKey.currentState].

 
 This example shows a [Form] with one [TextFormField] to enter an email
 address and an [ElevatedButton] to submit the form. A [GlobalKey] is used here
 to identify the [Form] and validate input.

 ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/form.png)

 ** See code in examples/api/lib/widgets/form/form.0.dart **
 

 See also:

  * [GlobalKey], a key that is unique across the entire app.
  * [FormField], a single form field widget that maintains the current state.
  * [TextFormField], a convenience widget that wraps a [TextField] widget in a [FormField].

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 This is the root of the widget hierarchy that contains this form.

 

- **onWillPop**: `WillPopCallback?`
  Enables the form to veto attempts by the user to dismiss the [ModalRoute]
 that contains the form.

 If the callback returns a Future that resolves to false, the form's route
 will not be popped.

 See also:

  * [WillPopScope], another widget that provides a way to intercept the
    back button.

- **canPop**: `bool?`
  

 
 This sample demonstrates how to use this parameter to show a confirmation
 dialog when a navigation pop would cause form data to be lost.

 ** See code in examples/api/lib/widgets/form/form.1.dart **
 

 See also:

  * [onPopInvokedWithResult], which also comes from [PopScope] and is often used in
    conjunction with this parameter.
  * [PopScope.canPop], which is what [Form] delegates to internally.

- **onPopInvoked**: `PopInvokedCallback?`
  

- **onPopInvokedWithResult**: `PopInvokedWithResultCallback<Object?>?`
  

 
 This sample demonstrates how to use this parameter to show a confirmation
 dialog when a navigation pop would cause form data to be lost.

 ** See code in examples/api/lib/widgets/form/form.1.dart **
 

 See also:

  * [canPop], which also comes from [PopScope] and is often used in
    conjunction with this parameter.
  * [PopScope.onPopInvokedWithResult], which is what [Form] delegates to internally.

- **onChanged**: `VoidCallback?`
  Called when one of the form fields changes.

 In addition to this callback being invoked, all the form fields themselves
 will rebuild.

- **autovalidateMode**: `AutovalidateMode`
  Used to enable/disable form fields auto validation and update their error
 text.

 

## Constructors

### Unnamed Constructor
Creates a container for form fields.

