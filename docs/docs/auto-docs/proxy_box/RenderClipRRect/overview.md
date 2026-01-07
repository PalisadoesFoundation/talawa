# Overview for `RenderClipRRect`

## Description

Clips its child using a rounded rectangle.

 By default, [RenderClipRRect] uses its own bounds as the base rectangle for
 the clip, but the size and location of the clip can be customized using a
 custom [clipper].

## Dependencies

- _RenderCustomClip

## Members

- **_borderRadius**: `BorderRadiusGeometry`
- **_textDirection**: `TextDirection?`
## Constructors

### Unnamed Constructor
Creates a rounded-rectangular clip.

 The [borderRadius] defaults to [BorderRadius.zero], i.e. a rectangle with
 right-angled corners.

 If [clipper] is non-null, then [borderRadius] is ignored.

 If [clipBehavior] is [Clip.none], no clipping will be applied.

