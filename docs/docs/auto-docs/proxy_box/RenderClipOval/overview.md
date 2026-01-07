# Overview for `RenderClipOval`

## Description

Clips its child using an oval.

 By default, inscribes an axis-aligned oval into its layout dimensions and
 prevents its child from painting outside that oval, but the size and
 location of the clip oval can be customized using a custom [clipper].

## Dependencies

- _RenderCustomClip

## Members

- **_cachedRect**: `Rect?`
- **_cachedPath**: `Path`
## Constructors

### Unnamed Constructor
Creates an oval-shaped clip.

 If [clipper] is null, the oval will be inscribed into the layout size and
 position of the child.

 If [clipBehavior] is [Clip.none], no clipping will be applied.

