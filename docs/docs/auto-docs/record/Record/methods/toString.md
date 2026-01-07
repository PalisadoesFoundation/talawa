# Method: `toString`

## Description

Creates a string-representation of the record.

 The string representation is only intended for debugging,
 and may differ between development and production.
 There is no guaranteed format in production mode.

 In development mode, the string will strive to be a parenthesized
 comma separated list of field representations, where the field
 representation is the `toString` of the value for positional fields,
 and `someName:` followed by that for a named field named `someName`.

## Return Type
`String`

