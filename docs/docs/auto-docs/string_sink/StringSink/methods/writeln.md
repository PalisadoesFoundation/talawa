# Method: `writeln`

## Description

Writes the string representation of [object] followed by a newline.

 Equivalent to `buffer.write(object)` followed by `buffer.write("\n")`.

 Notice that calling `buffer.writeln(null)` will write the `"null"` string
 before the newline. Omitting the argument, or explicitly passing an empty
 string, is the recommended way to emit just the newline.

## Return Type
`void`

## Parameters

- ``: `dynamic`
