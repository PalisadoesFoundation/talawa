# Overview for `RenderPhysicalShape`

## Description

Creates a physical shape layer that clips its child to a [Path].

 A physical shape layer casts a shadow based on its [elevation].

 See also:

  * [RenderPhysicalModel], which is optimized for rounded rectangles and
    circles.

## Dependencies

- _RenderPhysicalModelBase

## Constructors

### Unnamed Constructor
Creates an arbitrary shape clip.

 The [color] and [clipper] parameters are required.

 The [elevation] parameter must be non-negative.

