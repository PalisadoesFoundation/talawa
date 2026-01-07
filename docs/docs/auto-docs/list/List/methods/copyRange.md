# Method: `copyRange`

## Description

Copy a range of one list into another list.

 This is a utility function that can be used to implement methods like
 [setRange].

 The range from [start] to [end] must be a valid range of [source],
 and there must be room for `end - start` elements from position [at].
 If [start] is omitted, it defaults to zero.
 If [end] is omitted, it defaults to [source].length.

 If [source] and [target] are the same list, overlapping source and target
 ranges are respected so that the target range ends up containing the
 initial content of the source range.
 Otherwise the order of element copying is not guaranteed.

## Return Type
`void`

## Parameters

- `target`: `List&lt;T&gt;`
- `at`: `int`
- `source`: `List&lt;T&gt;`
- ``: `dynamic`
- ``: `dynamic`
