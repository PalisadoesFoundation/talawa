# Overview for `FormField`

## Description

A single form field.

 This widget maintains the current state of the form field, so that updates
 and validation errors are visually reflected in the UI.

 When used inside a [Form], you can use methods on [FormState] to query or
 manipulate the form data as a whole. For example, calling [FormState.save]
 will invoke each [FormField]'s [onSaved] callback in turn.

 Use a [GlobalKey] with [FormField] if you want to retrieve its current
 state, for example if you want one form field to depend on another.

 A [Form] ancestor is not required. The [Form] allows one to
 save, reset, or validate multiple fields at once. To use without a [Form],
 pass a [GlobalKey] to the constructor and use [GlobalKey.currentState] to
 save or reset the form field.

 See also:

  * [Form], which is the widget that aggregates the form fields.
  * [TextField], which is a commonly used form field for entering text.

## Dependencies

- StatefulWidget

## Members

- **builder**: `FormFieldBuilder&lt;T&gt;`
  Function that returns the widget representing this form field.

 It is passed the form field state as input, containing the current value
 and validation state of this field.

- **onSaved**: `FormFieldSetter&lt;T&gt;?`
  An optional method to call with the final value when the form is saved via
 [FormState.save].

- **forceErrorText**: `String?`
  An optional property that forces the [FormFieldState] into an error state
 by directly setting the [FormFieldState.errorText] property without
 running the validator function.

 When the [forceErrorText] property is provided, the [FormFieldState.errorText]
 will be set to the provided value, causing the form field to be considered
 invalid and to display the error message specified.

 When [validator] is provided, [forceErrorText] will override any error that it
 returns. [validator] will not be called unless [forceErrorText] is null.

 See also:

 * [InputDecoration.errorText], which is used to display error messages in the text
 field's decoration without effecting the field's state. When [forceErrorText] is
 not null, it will override [InputDecoration.errorText] value.

- **validator**: `FormFieldValidator&lt;T&gt;?`
  An optional method that validates an input. Returns an error string to
 display if the input is invalid, or null otherwise.

 The returned value is exposed by the [FormFieldState.errorText] property.
 The [TextFormField] uses this to override the [InputDecoration.errorText]
 value.

 Alternating between error and normal state can cause the height of the
 [TextFormField] to change if no other subtext decoration is set on the
 field. To create a field whose height is fixed regardless of whether or
 not an error is displayed, either wrap the  [TextFormField] in a fixed
 height parent like [SizedBox], or set the [InputDecoration.helperText]
 parameter to a space.

- **errorBuilder**: `FormFieldErrorBuilder?`
  Function that returns the widget representing the error to display.

 It is passed the form field validator error string as input.
 The resulting widget is passed to [InputDecoration.error].

 If null, the validator error string is passed to
 [InputDecoration.errorText].

- **initialValue**: `T?`
  An optional value to initialize the form field to, or null otherwise.

 This is called `value` in the [DropdownButtonFormField] constructor to be
 consistent with [DropdownButton].

 The `initialValue` affects the form field's state in two cases:
 1. When the form field is first built, `initialValue` determines the field's initial state.
 2. When [FormFieldState.reset] is called (either directly or by calling
    [FormFieldState.reset]), the form field is reset to this `initialValue`.

- **enabled**: `bool`
  Whether the form is able to receive user input.

 Defaults to true. If [autovalidateMode] is not [AutovalidateMode.disabled],
 the field will be auto validated. Likewise, if this field is false, the widget
 will not be validated regardless of [autovalidateMode].

- **autovalidateMode**: `AutovalidateMode`
  Used to enable/disable this form field auto validation and update its
 error text.

 
 If [AutovalidateMode.onUserInteraction], this FormField will only
 auto-validate after its content changes. If [AutovalidateMode.always], it
 will auto-validate even without user interaction. If
 [AutovalidateMode.disabled], auto-validation will be disabled.

 Defaults to [AutovalidateMode.disabled].
 

- **restorationId**: `String?`
  Restoration ID to save and restore the state of the form field.

 Setting the restoration ID to a non-null value results in whether or not
 the form field validation persists.

 The state of this widget is persisted in a [RestorationBucket] claimed
 from the surrounding [RestorationScope] using the provided restoration ID.

 See also:

  * [RestorationManager], which explains how state restoration works in
    Flutter.

## Constructors

### Unnamed Constructor
Creates a single form field.

