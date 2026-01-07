# Method: `cast`

## Description

Provides a view of this map as having [RK] keys and [RV] instances,
 if necessary.

 If this map is already a `Map&lt;RK, RV&gt;`, it is returned unchanged.

 If this set contains only keys of type [RK] and values of type [RV],
 all read operations will work correctly.
 If any operation exposes a non-[RK] key or non-[RV] value,
 the operation will throw instead.

 Entries added to the map must be valid for both a `Map&lt;K, V&gt;` and a
 `Map&lt;RK, RV&gt;`.

 Methods which accept `Object?` as argument,
 like [containsKey], [remove] and [operator []],
 will pass the argument directly to the this map's method
 without any checks.
 That means that you can do `mapWithStringKeys.cast&lt;int,int&gt;.remove("a")`
 successfully, even if it looks like it shouldn't have any effect.

## Return Type
`Map&lt;RK, RV&gt;`

