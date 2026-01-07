# Overview for `RenderClipPath`

## Description

Clips its child using a path.

 Takes a delegate whose primary method returns a path that should
 be used to prevent the child from painting outside the path.

 Clipping to a path is expensive. Certain shapes have more
 optimized render objects:

  * To clip to a rectangle, consider [RenderClipRect].
  * To clip to an oval or circle, consider [RenderClipOval].
  * To clip to a rounded rectangle, consider [RenderClipRRect].

## Dependencies

- _RenderCustomClip

## Constructors

### Unnamed Constructor
Creates a path clip.

 If [clipper] is null, the clip will be a rectangle that matches the layout
 size and location of the child. However, rather than use this default,
 consider using a [RenderClipRect], which can achieve the same effect more
 efficiently.

 If [clipBehavior] is [Clip.none], no clipping will be applied.

