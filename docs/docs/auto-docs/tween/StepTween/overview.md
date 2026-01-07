# Overview for `StepTween`

## Description

An interpolation between two integers that floors.

 This class specializes the interpolation of [Tween&lt;int&gt;] to be
 appropriate for integers by interpolating between the given begin
 and end values and then using [double.floor] to return the current
 integer component, dropping the fractional component.

 This results in a value that is never greater than the equivalent
 value from a linear double interpolation. Compare to [IntTween].

 The [begin] and [end] values must be set to non-null values before
 calling [lerp] or [transform].

 See [Tween] for a discussion on how to use interpolation objects.

## Dependencies

- Tween

## Constructors

### Unnamed Constructor
Creates an [int] tween that floors.

 The [begin] and [end] properties must be non-null before the tween is
 first used, but the arguments can be null if the values are going to be
 filled in later.

