# Overview for `UnderlineInputBorder`

## Description

Draws a horizontal line at the bottom of an [InputDecorator]'s container and
 defines the container's shape.

 The input decorator's "container" is the optionally filled area above the
 decorator's helper, error, and counter.

 See also:

  * [OutlineInputBorder], an [InputDecorator] border which draws a
    rounded rectangle around the input decorator's container.
  * [InputDecoration], which is used to configure an [InputDecorator].

## Dependencies

- InputBorder

## Members

- **borderRadius**: `BorderRadius`
  The radii of the border's rounded rectangle corners.

 When this border is used with a filled input decorator, see
 [InputDecoration.filled], the border radius defines the shape
 of the background fill as well as the bottom left and right
 edges of the underline itself.

 By default the top right and top left corners have a circular radius
 of 4.0.

## Constructors

### Unnamed Constructor
Creates an underline border for an [InputDecorator].

 The [borderSide] parameter defaults to [BorderSide.none] (it must not be
 null). Applications typically do not specify a [borderSide] parameter
 because the input decorator substitutes its own, using [copyWith], based
 on the current theme and [InputDecorator.isFocused].

 The [borderRadius] parameter defaults to a value where the top left
 and right corners have a circular radius of 4.0.

