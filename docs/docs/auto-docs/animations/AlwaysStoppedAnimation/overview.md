# Overview for `AlwaysStoppedAnimation`

## Description

An animation that is always stopped at a given value.

 The [status] is always [AnimationStatus.forward].

## Dependencies

- Animation

## Members

- **value**: `T`
## Constructors

### Unnamed Constructor
Creates an [AlwaysStoppedAnimation] with the given value.

 Since the [value] and [status] of an [AlwaysStoppedAnimation] can never
 change, the listeners can never be called. It is therefore safe to reuse
 an [AlwaysStoppedAnimation] instance in multiple places. If the [value] to
 be used is known at compile time, the constructor should be called as a
 `const` constructor.

