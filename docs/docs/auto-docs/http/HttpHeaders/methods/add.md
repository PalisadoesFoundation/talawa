# Method: `add`

## Description

Adds a header value.

 The header named [name] will have a string value derived from [value]
 added to its list of values.

 Some headers are single valued, and for these, adding a value will
 replace a previous value. If the [value] is a [DateTime], an
 HTTP date format will be applied. If the value is an [Iterable],
 each element will be added separately. For all other
 types the default [Object.toString] method will be used.

 Header names are converted to lower-case unless
 [preserveHeaderCase] is set to true. If two header names are
 the same when converted to lower-case, they are considered to be
 the same header, with one set of values.

 The current case of the a header name is that of the name used by
 the last [set] or [add] call for that header.

## Return Type
`void`

## Parameters

- `name`: `String`
- `value`: `Object`
- ``: `dynamic`
