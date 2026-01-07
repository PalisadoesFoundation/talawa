# Method: `current`

## Description

The current value of the stream.

 When a [moveNext] call completes with `true`, the [current] field holds
 the most recent event of the stream, and it stays like that until the next
 call to [moveNext]. This value must only be read after a call to [moveNext]
 has completed with `true`, and only until the [moveNext] is called again.

 If the StreamIterator has not yet been moved to the first element
 ([moveNext] has not been called and completed yet), or if the
 StreamIterator has been moved past the last element ([moveNext] has
 returned `false`), then [current] is unspecified. A [StreamIterator] may
 either throw or return an iterator-specific default value in that case.

## Return Type
`T`

