# Overview for `RenderClipRSuperellipse`

## Description

Clips its child using a rounded superellipse.

 By default, [RenderClipRSuperellipse] uses its own bounds as the base
 rectangle for the clip, but the size and location of the clip can be
 customized using a custom [clipper].

 Hit tests are performed based on the bounding box of the RSuperellipse.

## Dependencies

- _RenderCustomClip

## Members

- **_borderRadius**: `BorderRadiusGeometry`
- **_textDirection**: `TextDirection?`
## Constructors

### Unnamed Constructor
Creates a rounded-superellipse clip.

 The [borderRadius] defaults to [BorderRadius.zero], i.e. a rectangle with
 right-angled corners.

 If [clipBehavior] is [Clip.none], no clipping will be applied.

