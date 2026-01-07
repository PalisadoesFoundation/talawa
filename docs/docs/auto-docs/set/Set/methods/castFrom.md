# Method: `castFrom`

## Description

Adapts [source] to be a `Set&lt;T&gt;`.

 If [newSet] is provided, it is used to create the new sets returned
 by [toSet], [union], and is also used for [intersection] and [difference].
 If [newSet] is omitted, it defaults to creating a new set using the
 default [Set] constructor, and [intersection] and [difference]
 returns an adapted version of calling the same method on the source.

 Any time the set would produce an element that is not a [T],
 the element access will throw.

 Any time a [T] value is attempted added into the adapted set,
 the store will throw unless the value is also an instance of [S].

 If all accessed elements of [source] are actually instances of [T],
 and if all elements added to the returned set are actually instances
 of [S],
 then the returned set can be used as a `Set&lt;T&gt;`.

 Methods which accept one or more `Object?` as argument,
 like [contains], [remove] and [removeAll],
 will pass the argument directly to the this set's method
 without any checks.

## Return Type
`Set&lt;T&gt;`

## Parameters

- `source`: `Set&lt;S&gt;`
- ``: `dynamic`
