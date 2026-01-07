# Overview for `RenderClipRect`

## Description

Clips its child using a rectangle.

 By default, [RenderClipRect] prevents its child from painting outside its
 bounds, but the size and location of the clip rect can be customized using a
 custom [clipper].

## Dependencies

- _RenderCustomClip

## Constructors

### Unnamed Constructor
Creates a rectangular clip.

 If [clipper] is null, the clip will match the layout size and position of
 the child.

 If [clipBehavior] is [Clip.none], no clipping will be applied.

