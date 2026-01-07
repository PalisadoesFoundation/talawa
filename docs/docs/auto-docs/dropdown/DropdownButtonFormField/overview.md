# Overview for `DropdownButtonFormField`

## Description

A [FormField] that contains a [DropdownButton].

 This is a convenience widget that wraps a [DropdownButton] widget in a
 [FormField].

 A [Form] ancestor is not required. The [Form] allows one to
 save, reset, or validate multiple fields at once. To use without a [Form],
 pass a [GlobalKey] to the constructor and use [GlobalKey.currentState] to
 save or reset the form field.

 The `value` parameter maps to [FormField.initialValue].

 See also:

  * [DropdownButton], which is the underlying text field without the [Form]
    integration.

## Dependencies

- FormField

## Members

- **onChanged**: `ValueChanged<T?>?`
  

- **decoration**: `InputDecoration`
  The decoration to show around the dropdown button form field.

 By default, draws a horizontal line under the dropdown button field but
 can be configured to show an icon, label, hint text, and error text.

 If not specified, an [InputDecorator] with the `focusColor` set to the
 supplied `focusColor` (if any) will be used.

## Constructors

### Unnamed Constructor
Creates a [DropdownButton] widget that is a [FormField], wrapped in an
 [InputDecorator].

 For a description of the `onSaved`, `validator`, or `autovalidateMode`
 parameters, see [FormField]. For the rest (other than [decoration]), see
 [DropdownButton].

