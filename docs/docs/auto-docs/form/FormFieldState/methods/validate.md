# Method: `validate`

## Description

Calls [FormField.validator] to set the [errorText] only if [FormField.forceErrorText] is null.
 When [FormField.forceErrorText] is not null, [FormField.validator] will not be called.

 Returns true if there were no errors.
 See also:

  * [isValid], which passively gets the validity without setting
    [errorText] or [hasError].

## Return Type
`bool`

