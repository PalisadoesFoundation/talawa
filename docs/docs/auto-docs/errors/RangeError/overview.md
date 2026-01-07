# Overview for `RangeError`

## Description

Error thrown due to an argument value being outside an accepted range.

## Dependencies

- ArgumentError

## Members

- **start**: `num?`
  The minimum value that [value] is allowed to assume.

- **end**: `num?`
  The maximum value that [value] is allowed to assume.

## Constructors

### Unnamed Constructor
Create a new [RangeError] with the given [message].

### value
Create a new [RangeError] with a message for the given [value].

 An optional [name] can specify the argument name that has the
 invalid value, and the [message] can override the default error
 description.

#### Parameters

- `value`: `num`
- ``: `dynamic`
- ``: `dynamic`
### range
Create a new [RangeError] for a value being outside the valid range.

 The allowed range is from [minValue] to [maxValue], inclusive.
 If `minValue` or `maxValue` are `null`, the range is infinite in
 that direction.

 For a range from 0 to the length of something, end exclusive, use
 [RangeError.index].

 An optional [name] can specify the argument name that has the
 invalid value, and the [message] can override the default error
 description.

#### Parameters

- `invalidValue`: `num`
- `minValue`: `int?`
- `maxValue`: `int?`
- ``: `dynamic`
- ``: `dynamic`
### index
Creates a new [RangeError] stating that [index] is not a valid index
 into [indexable].

 An optional [name] can specify the argument name that has the
 invalid value, and the [message] can override the default error
 description.

 The [length] is the length of [indexable] at the time of the error.
 If `length` is omitted, it defaults to `indexable.length`.

#### Parameters

- `index`: `int`
- `indexable`: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
