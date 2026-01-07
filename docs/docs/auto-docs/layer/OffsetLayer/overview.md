# Overview for `OffsetLayer`

## Description

A layer that is displayed at an offset from its parent layer.

 Offset layers are key to efficient repainting because they are created by
 repaint boundaries in the [RenderObject] tree (see
 [RenderObject.isRepaintBoundary]). When a render object that is a repaint
 boundary is asked to paint at given offset in a [PaintingContext], the
 render object first checks whether it needs to repaint itself. If not, it
 reuses its existing [OffsetLayer] (and its entire subtree) by mutating its
 [offset] property, cutting off the paint walk.

## Dependencies

- ContainerLayer

## Members

- **_offset**: `Offset`
## Constructors

### Unnamed Constructor
Creates an offset layer.

 By default, [offset] is zero. It must be non-null before the compositing
 phase of the pipeline.

