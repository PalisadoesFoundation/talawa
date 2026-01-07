# Method: `writeIterable`

## Description

Write the elements of an iterable into a list.

 This is a utility function that can be used to implement methods like
 [setAll].

 The elements of [source] are written into [target] from position [at].
 The [source] must not contain more elements after writing the last
 position of [target].

 If the source is a list, the [copyRange] function is likely to be more
 efficient.

## Return Type
`void`

## Parameters

- `target`: `List&lt;T&gt;`
- `at`: `int`
- `source`: `Iterable&lt;T&gt;`
