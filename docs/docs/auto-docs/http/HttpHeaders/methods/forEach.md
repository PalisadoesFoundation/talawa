# Method: `forEach`

## Description

Performs the [action] on each header.

 The [action] function is called with each header's name and a list
 of the header's values. The casing of the name string is determined by
 the last [add] or [set] operation for that particular header,
 which defaults to lower-casing the header name unless explicitly
 set to preserve the case.

## Return Type
`void`

## Parameters

- `action`: `void Function(String name, List&lt;String&gt; values)`
