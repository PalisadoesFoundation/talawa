# Method: `checkValidRange`

## Description

Check that a range represents a slice of an indexable object.

 Throws if the range is not valid for an indexable object with
 the given [length].
 A range is valid for an indexable object with a given [length]

 if `0 <= [start] <= [end] <= [length]`.
 An `end` of `null` is considered equivalent to `length`.

 The [startName] and [endName] defaults to `"start"` and `"end"`,
 respectively.

 Returns the actual `end` value, which is `length` if `end` is `null`,
 and `end` otherwise.

## Return Type
`int`

## Parameters

- `start`: `int`
- `end`: `int?`
- `length`: `int`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
