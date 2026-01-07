# Overview for `HasNextIterator`

## Description

Wrapper for [Iterator] providing the pre-Dart 1.0 iterator interface.

 This class should not be used in new code.

 The [HasNextIterator] class wraps an [Iterator] and provides methods to
 iterate over an object using [hasNext] and [next].

 The [HasNextIterator] does not implement the [Iterator] interface.

 This class was intended for migration to the current [Iterator]
 interface, from an earlier interface using [hasNext] and [next].
 The API change happened in the Dart 1.0 release.
 Any other use of this class should be migrated to using the
 current API directly, e.g., using a separate variable to
 cache the [Iterator.moveNext] result, so that [hasNext] can be
 checked multiple times.

## Members

- **_iterator**: `Iterator&lt;E&gt;`
- **_hasNext**: `bool?`
  Cache for `_iterator.`, used by `hasNext`.

 Is reset to `null` when [next] consumes a current element.
 Will not change again after becoming `false`.

## Constructors

### Unnamed Constructor


