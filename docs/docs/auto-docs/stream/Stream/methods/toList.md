# Method: `toList`

## Description

Collects all elements of this stream in a [List].

 Creates a `List&lt;T&gt;` and adds all elements of this stream to the list
 in the order they arrive.
 When this stream ends, the returned future is completed with that list.

 If this stream emits an error,
 the returned future is completed with that error,
 and processing stops.

## Return Type
`Future&lt;List&lt;T&gt;&gt;`

