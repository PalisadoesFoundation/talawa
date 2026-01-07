# Overview for `ColorTween`

## Description

An interpolation between two colors.

 This class specializes the interpolation of [Tween&lt;Color&gt;] to use
 [Color.lerp].

 The values can be null, representing no color (which is distinct to
 transparent black, as represented by [Colors.transparent]).

 See [Tween] for a discussion on how to use interpolation objects.

## Dependencies

- Tween

## Constructors

### Unnamed Constructor
Creates a [Color] tween.

 The [begin] and [end] properties may be null; the null value
 is treated as transparent.

 We recommend that you do not pass [Colors.transparent] as [begin]
 or [end] if you want the effect of fading in or out of transparent.
 Instead prefer null. [Colors.transparent] refers to black transparent and
 thus will fade out of or into black which is likely unwanted.

