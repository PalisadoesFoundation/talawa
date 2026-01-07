# Overview for `EdgeInsetsTween`

## Description

An interpolation between two [EdgeInsets]s.

 This class specializes the interpolation of [Tween&lt;EdgeInsets&gt;] to use
 [EdgeInsets.lerp].

 See [Tween] for a discussion on how to use interpolation objects.

 See also:

  * [EdgeInsetsGeometryTween], which interpolates between two
    [EdgeInsetsGeometry] objects.

## Dependencies

- Tween

## Constructors

### Unnamed Constructor
Creates an [EdgeInsets] tween.

 The [begin] and [end] properties may be null; the null value
 is treated as an [EdgeInsets] with no inset.

