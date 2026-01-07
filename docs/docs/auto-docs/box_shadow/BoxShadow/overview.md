# Overview for `BoxShadow`

## Description

A shadow cast by a box.

 [BoxShadow] can cast non-rectangular shadows if the box is non-rectangular
 (e.g., has a border radius or a circular shape).

 This class is similar to CSS box-shadow.

 See also:

  * [Canvas.drawShadow], which is a more efficient way to draw shadows.
  * [PhysicalModel], a widget for showing shadows.
  * [kElevationToShadow], for some predefined shadows used in Material
    Design.
  * [Shadow], which is the parent class that lacks [spreadRadius].

## Dependencies

- Shadow

## Members

- **spreadRadius**: `double`
  The amount the box should be inflated prior to applying the blur.

- **blurStyle**: `BlurStyle`
  The [BlurStyle] to use for this shadow.

 Defaults to [BlurStyle.normal].

 When [debugDisableShadows] is true, [toPaint] ignores the [blurStyle] and
 acts as if [BlurStyle.normal] was used.

## Constructors

### Unnamed Constructor
Creates a box shadow.

 By default, the shadow is solid black with zero [offset], zero [blurRadius],
 zero [spreadRadius], and [BlurStyle.normal].

