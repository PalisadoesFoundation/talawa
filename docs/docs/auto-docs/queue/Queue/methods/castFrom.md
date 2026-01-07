# Method: `castFrom`

## Description

Adapts [source] to be a `Queue&lt;T&gt;`.

 Any time the queue would produce an element that is not a [T],
 the element access will throw.

 When a [T] value is stored into the adapted queue,
 the operation will throw unless the value is also an instance of [S].

 If all accessed elements of [source] are actually instances of [T],
 and if all elements stored into the returned queue are actually instances
 of [S],
 then the returned queue can be used as a `Queue&lt;T&gt;`.

 Methods which accept `Object?` as argument, like [contains] and [remove],
 will pass the argument directly to this queue's method
 without any checks.

## Return Type
`Queue&lt;T&gt;`

## Parameters

- `source`: `Queue&lt;S&gt;`
