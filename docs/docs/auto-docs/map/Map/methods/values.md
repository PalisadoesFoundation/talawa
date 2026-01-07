# Method: `values`

## Description

The values of this [Map].

 The values are iterated in the order of their corresponding keys.
 This means that iterating [keys] and [values] in parallel will
 provide matching pairs of keys and values.

 The returned iterable has an efficient `length` method based on the
 [length] of the map. Its [Iterable.contains] method is based on
 `==` comparison.

 Modifying the map while iterating the values may break the iteration.

## Return Type
`Iterable&lt;V&gt;`

