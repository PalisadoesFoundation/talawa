# Overview for `TextStyleTween`

## Description

An interpolation between two [TextStyle]s.

 This class specializes the interpolation of [Tween&lt;TextStyle&gt;] to use
 [TextStyle.lerp].

 This will not work well if the styles don't set the same fields.

 See [Tween] for a discussion on how to use interpolation objects.

## Dependencies

- Tween

## Constructors

### Unnamed Constructor
Creates a text style tween.

 The [begin] and [end] properties must be non-null before the tween is
 first used, but the arguments can be null if the values are going to be
 filled in later.

