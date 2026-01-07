# Overview for `DecorationTween`

## Description

An interpolation between two [Decoration]s.

 This class specializes the interpolation of [Tween&lt;BoxConstraints&gt;] to use
 [Decoration.lerp].

 For [ShapeDecoration]s which know how to [ShapeDecoration.lerpTo] or
 [ShapeDecoration.lerpFrom] each other, this will produce a smooth
 interpolation between decorations.

 See also:

  * [Tween] for a discussion on how to use interpolation objects.
  * [ShapeDecoration], [RoundedRectangleBorder], [CircleBorder], and
    [StadiumBorder] for examples of shape borders that can be smoothly
    interpolated.
  * [BoxBorder] for a border that can only be smoothly interpolated between other
    [BoxBorder]s.

## Dependencies

- Tween

## Constructors

### Unnamed Constructor
Creates a decoration tween.

 The [begin] and [end] properties may be null. If both are null, then the
 result is always null. If [end] is not null, then its lerping logic is
 used (via [Decoration.lerpTo]). Otherwise, [begin]'s lerping logic is used
 (via [Decoration.lerpFrom]).

