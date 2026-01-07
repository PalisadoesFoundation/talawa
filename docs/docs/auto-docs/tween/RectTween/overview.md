# Overview for `RectTween`

## Description

An interpolation between two rectangles.

 This class specializes the interpolation of [Tween&lt;Rect&gt;] to use
 [Rect.lerp].

 The values can be null, representing a zero-sized rectangle at the
 origin ([Rect.zero]).

 See [Tween] for a discussion on how to use interpolation objects.

## Dependencies

- Tween

## Constructors

### Unnamed Constructor
Creates a [Rect] tween.

 The [begin] and [end] properties may be null; the null value
 is treated as an empty rect at the top left corner.

