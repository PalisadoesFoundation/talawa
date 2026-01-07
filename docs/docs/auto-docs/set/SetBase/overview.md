# Overview for `SetBase`

## Description

Base implementation of [Set].

 This class provides a base implementation of a `Set` that depends only
 on the abstract members: [add], [contains], [lookup], [remove],
 [iterator], [length] and [toSet].

 Some of the methods assume that `toSet` creates a modifiable set.
 If using this base class for an unmodifiable set,
 where `toSet` should return an unmodifiable set,
 it's necessary to reimplement
 [retainAll], [union], [intersection] and [difference].

 Implementations of `Set` using this base should consider also implementing
 `clear` in constant time. The default implementation works by removing every
 element.

## Dependencies

- Set

## Constructors

### Unnamed Constructor


