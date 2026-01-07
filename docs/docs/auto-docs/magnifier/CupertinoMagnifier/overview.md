# Overview for `CupertinoMagnifier`

## Description

A [RawMagnifier] used for magnifying text in cases where a user's
 finger may be blocking the point of interest, like a selection handle.

 
 This sample demonstrates how to use [CupertinoMagnifier].

 ** See code in examples/api/lib/widgets/magnifier/cupertino_magnifier.0.dart **
 

 [CupertinoMagnifier] is a wrapper around [RawMagnifier] that handles styling
 and transitions.

 

 See also:

 * [RawMagnifier], the backing implementation.
 * [CupertinoTextMagnifier], a widget that positions [CupertinoMagnifier] based on
 [MagnifierInfo].
 * [MagnifierController], the controller for this magnifier.

## Dependencies

- StatelessWidget

## Members

- **shadows**: `List&lt;BoxShadow&gt;`
  A list of shadows cast by the [Magnifier].

 If the shadows use a [BlurStyle] that paints inside the shape, or if they
 are offset, then a [clipBehavior] that enables clipping (such as
 [Clip.hardEdge]) is recommended, otherwise the shadow will occlude the
 magnifier (the shadow is drawn above the magnifier so as to not be
 included in the magnified image).

 A shadow that uses [BlurStyle.outer] and is not offset does not need
 clipping.

 By default, the [shadows] are not offset and use [BlurStyle.outer], and
 correspondingly the default [clipBehavior] is [Clip.none].

- **clipBehavior**: `Clip`
  Whether and how to clip the [shadows] that render inside the loupe.

 Defaults to [Clip.none], which is useful if the shadow will not paint
 where the magnified image appears, or if doing so is intentional (e.g. to
 blur the edges of the magnified image).

 The default configuration of [CupertinoMagnifier] does not render inside
 the loupe (the shadows are not offset and use [BlurStyle.outer]).

 Other values (e.g. [Clip.hardEdge]) are recommended when the [shadows]
 have an offset.

 See the discussion at [shadows].

- **borderSide**: `BorderSide`
  The border, or "rim", of this magnifier.

 This border is drawn on a [RoundedRectangleBorder] with radius
 [borderRadius], and increases the [size] of the magnifier by the
 [BorderSide.width].

- **kMagnifierAboveFocalPoint**: `double`
  The vertical offset that the magnifier is along the Y axis above
 the focal point.

- **kDefaultSize**: `Size`
  The default size of the magnifier.

 This is public so that positioners can choose to depend on it, although
 it is overridable.

- **_kInOutAnimationDuration**: `Duration`
  The duration that this magnifier animates in / out for.

 The animation is a translation and a fade. The translation
 begins at the focal point, and ends at [kMagnifierAboveFocalPoint].
 The opacity begins at 0 and ends at 1.

- **size**: `Size`
  The size of this magnifier.

 The size does not include the [borderSide] or [shadows].

- **borderRadius**: `BorderRadius`
  The border radius of this magnifier.

 The magnifier's shape is a [RoundedRectangleBorder] with this radius.

- **inOutAnimation**: `Animation&lt;double&gt;?`
  This [RawMagnifier]'s controller.

 Since [CupertinoMagnifier] has no knowledge of shown / hidden state,
 this animation should be driven by an external actor.

- **additionalFocalPointOffset**: `Offset`
  Any additional focal point offset, applied over the regular focal
 point offset defined in [kMagnifierAboveFocalPoint].

- **magnificationScale**: `double`
  The magnification scale for the magnifier.

 Defaults to 1.0, which indicates that the magnifier does not apply any magnification.

## Constructors

### Unnamed Constructor
Creates a [RawMagnifier] in the Cupertino style.

 The default constructor parameters and constants were eyeballed on
 an iPhone 16 iOS v18.1.

