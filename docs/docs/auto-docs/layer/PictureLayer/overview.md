# Overview for `PictureLayer`

## Description

A composited layer containing a [ui.Picture].

 Picture layers are always leaves in the layer tree. They are also
 responsible for disposing of the [ui.Picture] object they hold. This is
 typically done when their parent and all [RenderObject]s that participated
 in painting the picture have been disposed.

## Dependencies

- Layer

## Members

- **canvasBounds**: `Rect`
  The bounds that were used for the canvas that drew this layer's [picture].

 This is purely advisory. It is included in the information dumped with
 [debugDumpLayerTree] (which can be triggered by pressing "L" when using
 "flutter run" at the console), which can help debug why certain drawing
 commands are being culled.

- **_picture**: `ui.Picture?`
- **_isComplexHint**: `bool`
- **_willChangeHint**: `bool`
## Constructors

### Unnamed Constructor
Creates a leaf layer for the layer tree.

