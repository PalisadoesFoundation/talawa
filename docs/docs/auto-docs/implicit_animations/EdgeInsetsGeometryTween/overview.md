# Overview for `EdgeInsetsGeometryTween`

## Description

An interpolation between two [EdgeInsetsGeometry]s.

 This class specializes the interpolation of [Tween&lt;EdgeInsetsGeometry&gt;] to
 use [EdgeInsetsGeometry.lerp].

 See [Tween] for a discussion on how to use interpolation objects.

 See also:

  * [EdgeInsetsTween], which interpolates between two [EdgeInsets] objects.

## Dependencies

- Tween

## Constructors

### Unnamed Constructor
Creates an [EdgeInsetsGeometry] tween.

 The [begin] and [end] properties may be null; the null value
 is treated as an [EdgeInsetsGeometry] with no inset.

