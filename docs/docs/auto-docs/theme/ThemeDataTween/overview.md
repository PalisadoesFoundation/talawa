# Overview for `ThemeDataTween`

## Description

An interpolation between two [ThemeData]s.

 This class specializes the interpolation of [Tween&lt;ThemeData&gt;] to call the
 [ThemeData.lerp] method.

 See [Tween] for a discussion on how to use interpolation objects.

## Dependencies

- Tween

## Constructors

### Unnamed Constructor
Creates a [ThemeData] tween.

 The [begin] and [end] properties must be non-null before the tween is
 first used, but the arguments can be null if the values are going to be
 filled in later.

