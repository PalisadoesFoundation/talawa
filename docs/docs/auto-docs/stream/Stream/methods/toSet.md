# Method: `toSet`

## Description

Collects the data of this stream in a [Set].

 Creates a `Set&lt;T&gt;` and adds all elements of this stream to the set.
 in the order they arrive.
 When this stream ends, the returned future is completed with that set.

 The returned set is the same type as created by `<T>`.
 If another type of set is needed, either use [forEach] to add each
 element to the set, or use
 `.then((list) => new SomeOtherSet.from(list))`
 to create the set.

 If this stream emits an error,
 the returned future is completed with that error,
 and processing stops.

## Return Type
`Future&lt;Set&lt;T&gt;&gt;`

