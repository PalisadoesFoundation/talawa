# Overview for `IntTween`

## Description

An interpolation between two integers that rounds.

 This class specializes the interpolation of [Tween&lt;int&gt;] to be
 appropriate for integers by interpolating between the given begin
 and end values and then rounding the result to the nearest
 integer.

 This is the closest approximation to a linear tween that is possible with an
 integer. Compare to [StepTween] and [Tween&lt;double&gt;].

 The [begin] and [end] values must be set to non-null values before
 calling [lerp] or [transform].

 See [Tween] for a discussion on how to use interpolation objects.

## Dependencies

- Tween

## Constructors

### Unnamed Constructor
Creates an int tween.

 The [begin] and [end] properties must be non-null before the tween is
 first used, but the arguments can be null if the values are going to be
 filled in later.

