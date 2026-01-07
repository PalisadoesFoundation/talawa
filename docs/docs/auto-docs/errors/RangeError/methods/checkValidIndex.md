# Method: `checkValidIndex`

## Description

Check that [index] is a valid index into an indexable object.

 Throws if [index] is not a valid index into [indexable].

 An indexable object is one that has a `length` and an index-operator
 `[]` that accepts an index if `0 <= index < length`.

 If [name] or [message] are provided, they are used as the parameter
 name and message text of the thrown error. If [name] is omitted, it
 defaults to `"index"`.

 If [length] is provided, it is used as the length of the indexable object,
 otherwise the length is found as `indexable.length`.

 Returns [index] if it is a valid index.

## Return Type
`int`

## Parameters

- `index`: `int`
- `indexable`: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
