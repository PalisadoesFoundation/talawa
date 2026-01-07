# Overview for `RawMagnifier`

## Description

A common base class for magnifiers.

 
 This sample demonstrates what a magnifier is, and how it can be used.

 ** See code in examples/api/lib/widgets/magnifier/magnifier.0.dart **
 

 
 This magnifying glass is useful for scenarios on mobile devices where
 the user's finger may be covering part of the screen where a granular
 action is being performed, such as navigating a small cursor with a drag
 gesture, on an image or text.
 

 A magnifier can be conveniently managed by [MagnifierController], which handles
 showing and hiding the magnifier, with an optional entry / exit animation.

 See:
 * [MagnifierController], a controller to handle magnifiers in an overlay.

## Dependencies

- StatelessWidget

## Members

- **child**: `Widget?`
  An optional widget to position inside the len of the [RawMagnifier].

 This is positioned over the [RawMagnifier] - it may be useful for tinting the
 [RawMagnifier], or drawing a crosshair-like UI.

- **decoration**: `MagnifierDecoration`
  This magnifier's decoration.

 This sets the shape of the loupe, plus any borders and shadows that it
 casts. The default has no border and no shadow; combined with the default
 [magnificationScale] of 1.0, this results in the magnifier having no
 visible effect.

 If the [decoration] has a [MagnifierDecoration.shadows] that uses offset
 shadows or uses a [BlurStyle] that would obscure the magnified image,
 consider setting [clipBehavior] to [Clip.hardEdge] (or similar) to ensure
 the magnified image is visible.

- **clipBehavior**: `Clip`
  Whether and how to clip the parts of [decoration] that render inside the
 loupe.

 Defaults to [Clip.none].

 See the discussion at [decoration].

- **focalPointOffset**: `Offset`
  The offset of the magnifier from [RawMagnifier]'s center.

 
 For example, if [RawMagnifier] is globally positioned at Offset(100, 100),
 and [focalPointOffset] is Offset(-20, -20), then [RawMagnifier] will see
 the content at global offset (80, 80).

 If left as [Offset.zero], the [RawMagnifier] will show the content that
 is directly below it.
 

- **magnificationScale**: `double`
  How "zoomed in" the magnification subject is in the lens.

 The default is 1.0, which is no magnification.

- **size**: `Size`
  The size of the magnifier.

 This does not include the border from the [decoration]; it only includes
 the size of the magnifier.

## Constructors

### Unnamed Constructor
Constructs a [RawMagnifier].

 By default, this magnifier uses the default [MagnifierDecoration] (which
 draws nothing), the focal point is directly under the magnifier, and there
 is no magnification; this means that a default magnifier will be entirely
 invisible to the naked eye, painting exactly what is under it, exactly
 where it was painted originally.

