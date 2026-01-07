# Method: `errorText`

## Description

The current validation error returned by the [FormField.validator]
 callback, or the manually provided error message using the
 [FormField.forceErrorText] property.

 This property is automatically updated when [validate] is called and the
 [FormField.validator] callback is invoked, or If [FormField.forceErrorText] is set
 directly to a non-null value.

## Return Type
`String?`

