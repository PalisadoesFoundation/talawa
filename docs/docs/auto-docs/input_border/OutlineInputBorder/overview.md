# Overview for `OutlineInputBorder`

## Description

Draws a rounded rectangle around an [InputDecorator]'s container.

 When the input decorator's label is floating, for example because its
 input child has the focus, the label appears in a gap in the border outline.

 The input decorator's "container" is the optionally filled area above the
 decorator's helper, error, and counter.

 See also:

  * [UnderlineInputBorder], the default [InputDecorator] border which
    draws a horizontal line at the bottom of the input decorator's container.
  * [InputDecoration], which is used to configure an [InputDecorator].

## Dependencies

- InputBorder

## Members

- **gapPadding**: `double`
  Horizontal padding on either side of the border's
 [InputDecoration.labelText] width gap.

 This value is used by the [paint] method to compute the actual gap width.

- **borderRadius**: `BorderRadius`
  The radii of the border's rounded rectangle corners.

 The corner radii must be circular, i.e. their [Radius.x] and [Radius.y]
 values must be the same.

## Constructors

### Unnamed Constructor
Creates a rounded rectangle outline border for an [InputDecorator].

 If the [borderSide] parameter is [BorderSide.none], it will not draw a
 border. However, it will still define a shape (which you can see if
 [InputDecoration.filled] is true).

 If an application does not specify a [borderSide] parameter of
 value [BorderSide.none], the input decorator substitutes its own, using
 [copyWith], based on the current theme and [InputDecorator.isFocused].

 The [borderRadius] parameter defaults to a value where all four corners
 have a circular radius of 4.0. The corner radii must be circular, i.e.
 their [Radius.x] and [Radius.y] values must be the same.

 See also:

  * [InputDecoration.floatingLabelBehavior], which should be set to
    [FloatingLabelBehavior.never] when the [borderSide] is
    [BorderSide.none]. If let as [FloatingLabelBehavior.auto], the label
    will extend beyond the container as if the border were still being
    drawn.

