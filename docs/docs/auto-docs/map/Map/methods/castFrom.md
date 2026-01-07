# Method: `castFrom`

## Description

Adapts [source] to be a `Map&lt;K2, V2&gt;`.

 Any time the set would produce a key or value that is not a [K2] or [V2],
 the access will throw.

 Any time [K2] key or [V2] value is attempted added into the adapted map,
 the store will throw unless the key is also an instance of [K] and
 the value is also an instance of [V].

 If all accessed entries of [source] have [K2] keys and [V2] values,
 and if all entries added to the returned map have [K] keys and [V] values,
 then the returned map can be used as a `Map&lt;K2, V2&gt;`.

 Methods which accept `Object?` as argument,
 like [containsKey], [remove] and [operator []],
 will pass the argument directly to the this map's method
 without any checks.

## Return Type
`Map&lt;K2, V2&gt;`

## Parameters

- `source`: `Map&lt;K, V&gt;`
