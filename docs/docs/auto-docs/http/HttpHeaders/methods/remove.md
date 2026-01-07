# Method: `remove`

## Description

Removes a specific value for a header name.

 Some headers have system supplied values which cannot be removed.
 For all other headers and values, the [value] is converted to a string
 in the same way as for [add], then that string value is removed from the
 current values of [name].
 If there are no remaining values for [name], the header is no longer
 considered present.

## Return Type
`void`

## Parameters

- `name`: `String`
- `value`: `Object`
