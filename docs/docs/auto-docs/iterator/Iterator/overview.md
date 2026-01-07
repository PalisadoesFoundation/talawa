# Overview for `Iterator`

## Description

An interface for getting items, one at a time, from an object.

 The for-in construct transparently uses `Iterator` to test for the end
 of the iteration, and to get each item (or _element_).

 If the object iterated over is changed during the iteration, the
 behavior is unspecified.

 The `Iterator` is initially positioned before the first element.
 Before accessing the first element the iterator must thus be advanced using
 [moveNext] to point to the first element.
 If no element is left, then [moveNext] returns false,
 and all further calls to [moveNext] will also return false.

 The [current] value must not be accessed before calling [moveNext]
 or after a call to [moveNext] has returned false.

 A typical usage of an `Iterator` looks as follows:
 ```dart
 var it = obj.iterator;
 while (it.) 
 ```
 **See also:**
 [Iteration](https://dart.dev/guides/libraries/library-tour#iteration)
 in the [library tour](https://dart.dev/guides/libraries/library-tour)

