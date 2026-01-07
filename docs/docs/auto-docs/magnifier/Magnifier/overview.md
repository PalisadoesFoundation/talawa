# Overview for `Magnifier`

## Description

A Material-styled magnifying glass.

 

 This widget focuses on mimicking the _style_ of the magnifier on material.
 For a widget that is focused on mimicking the _behavior_ of a material
 magnifier, see [TextMagnifier], which uses [Magnifier].

 The styles implemented in this widget were based on the Android 12 source
 code, where possible, and on eyeballing a Pixel 6 running Android 12
 otherwise.

## Dependencies

- StatelessWidget

## Members

- **kDefaultMagnifierSize**: `Size`
  The default size of this [Magnifier].

 The size of the magnifier may be modified through the constructor;
 [kDefaultMagnifierSize] is extracted from the default parameter of
 [Magnifier]'s constructor so that positioners may depend on it.

- **kStandardVerticalFocalPointShift**: `double`
  The vertical distance that the magnifier should be above the focal point.

 The [kStandardVerticalFocalPointShift] value is a constant so that
 positioning of this [Magnifier] can be done with a guaranteed size, as
 opposed to an estimate.

- **_borderRadius**: `double`
- **_magnification**: `double`
- **additionalFocalPointOffset**: `Offset`
  Any additional offset the focal point requires to "point"
 to the correct place.

 This value is added to [kStandardVerticalFocalPointShift] to obtain the
 actual offset.

 This is useful for instances where the magnifier is not pointing to
 something directly below it.

- **borderRadius**: `BorderRadius`
  The border radius for this magnifier.

 The magnifier's shape is a [RoundedRectangleBorder] with this radius.

- **filmColor**: `Color`
  The color to tint the image in this [Magnifier].

 On native Android, there is a almost transparent gray tint to the
 magnifier, in order to better distinguish the contents of the lens from
 the background.

- **shadows**: `List&lt;BoxShadow&gt;`
  A list of shadows cast by the [Magnifier].

 If the shadows use a [BlurStyle] that paints inside the shape, or if they
 are offset, then a [clipBehavior] that enables clipping (such as the
 default [Clip.hardEdge]) is recommended, otherwise the shadow will occlude
 the magnifier (the shadow is drawn above the magnifier so as to not be
 included in the magnified image).

 By default, the shadows are offset vertically by two logical pixels, so
 clipping is recommended.

 A shadow that uses [BlurStyle.outer] and is not offset does not need
 clipping; in that case, consider setting [clipBehavior] to [Clip.none].

- **clipBehavior**: `Clip`
  Whether and how to clip the [shadows] that render inside the loupe.

 Defaults to [Clip.hardEdge].

 A value of [Clip.none] can be used if the shadow will not paint where the
 magnified image appears, or if doing so is intentional (e.g. to blur the
 edges of the magnified image).

 See the discussion at [shadows].

- **size**: `Size`
  The [Size] of this [Magnifier].

 The [shadows] are drawn outside of the [size].

## Constructors

### Unnamed Constructor
Creates a [RawMagnifier] in the Material style.

