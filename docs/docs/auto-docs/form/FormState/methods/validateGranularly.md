# Method: `validateGranularly`

## Description

Validates every [FormField] that is a descendant of this [Form], and
 returns a [Set] of [FormFieldState] of the invalid field(s) only, if any.

 This method can be useful to highlight field(s) with errors.

 The form will rebuild to report the results.

 See also:
  * [validate], which also validates descendant [FormField]s,
 and return true if there are no errors.

## Return Type
`Set<FormFieldState<Object?>>`

