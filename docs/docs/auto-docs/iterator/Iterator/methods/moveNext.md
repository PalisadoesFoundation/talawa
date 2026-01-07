# Method: `moveNext`

## Description

Advances the iterator to the next element of the iteration.

 Should be called before reading [current].
 If the call to `moveNext` returns `true`,
 then [current] will contain the next element of the iteration
 until `moveNext` is called again.
 If the call returns `false`, there are no further elements
 and [current] should not be used any more.

 It is safe to call [moveNext] after it has already returned `false`,
 but it must keep returning `false` and not have any other effect.

 A call to `moveNext` may throw for various reasons,
 including a concurrent change to an underlying collection.
 If that happens, the iterator may be in an inconsistent
 state, and any further behavior of the iterator is unspecified,
 including the effect of reading [current].
 ```dart
 final colors = ['blue', 'yellow', 'red'];
 final colorsIterator = colors.iterator;
 print(colorsIterator.); // true
 print(colorsIterator.); // true
 print(colorsIterator.); // true
 print(colorsIterator.); // false
 ```

## Return Type
`bool`

