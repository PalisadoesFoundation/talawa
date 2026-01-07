# Overview for `IndexError`

## Description

A specialized [RangeError] used when an index is not in the range
 `0..indexable.length-1`.

 Also contains the indexable object, its length at the time of the error,
 and the invalid index itself.

## Dependencies

- ArgumentError, RangeError

## Members

- **indexable**: `Object?`
  The indexable object that [invalidValue] was not a valid index into.

 Can be, for example, a [List] or [String],
 which both have index based operations.

- **length**: `int`
  The length of [indexable] at the time of the error.

## Constructors

### Unnamed Constructor
Creates a new [IndexError] stating that [invalidValue] is not a valid index
 into [indexable].

 The [length] is the length of [indexable] at the time of the error.
 If `length` is omitted, it defaults to `indexable.length`.

 The message is used as part of the string representation of the error.

### withLength
Creates a new [IndexError] stating that [invalidValue] is not a valid index
 into [indexable].

 The [length] is the length of [indexable] at the time of the error.

 The message is used as part of the string representation of the error.

#### Parameters

- `invalidValue`: `int`
- `length`: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
