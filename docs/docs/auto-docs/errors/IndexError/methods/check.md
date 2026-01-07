# Method: `check`

## Description

Check that [index] is a valid index into an indexable object.

 Throws if [index] is not a valid index.

 An indexable object is one that has a `length` and an index-operator
 `[]` that accepts an index if `0 <= index < length`.

 The [length] is the length of the indexable object.

 The [indexable], if provided, is the indexable object.

 The [name] is the parameter name of the index value. Defaults to "index",
 and can be set to null to omit a name from the error string,
 if the invalid index was not a parameter.

 The [message], if provided, is included in the error string.

 Returns [index] if it is a valid index.

## Return Type
`int`

## Parameters

- `index`: `int`
- `length`: `int`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
