# Overview for `Matrix4Tween`

## Description

An interpolation between two [Matrix4]s.

 This class specializes the interpolation of [Tween&lt;Matrix4&gt;] to be
 appropriate for transformation matrices.

 Currently this class works only for translations.

 See [Tween] for a discussion on how to use interpolation objects.

## Dependencies

- Tween

## Constructors

### Unnamed Constructor
Creates a [Matrix4] tween.

 The [begin] and [end] properties must be non-null before the tween is
 first used, but the arguments can be null if the values are going to be
 filled in later.

