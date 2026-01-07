# Method: `castFrom`

## Description

Adapts [source] to be a `List&lt;T&gt;`.

 Any time the list would produce an element that is not a [T],
 the element access will throw.

 Any time a [T] value is attempted stored into the adapted list,
 the store will throw unless the value is also an instance of [S].

 If all accessed elements of [source] are actually instances of [T],
 and if all elements stored into the returned list are actually instance
 of [S],
 then the returned list can be used as a `List&lt;T&gt;`.

 Methods which accept `Object?` as argument, like [contains] and [remove],
 will pass the argument directly to the this list's method
 without any checks.

## Return Type
`List&lt;T&gt;`

## Parameters

- `source`: `List&lt;S&gt;`
