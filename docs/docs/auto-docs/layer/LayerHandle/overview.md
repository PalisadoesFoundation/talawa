# Overview for `LayerHandle`

## Description

A handle to prevent a [Layer]'s platform graphics resources from being
 disposed.

 [Layer] objects retain native resources such as [ui.EngineLayer]s and [ui.Picture]
 objects. These objects may in turn retain large chunks of texture memory,
 either directly or indirectly.

 The layer's native resources must be retained as long as there is some
 object that can add it to a scene. Typically, this is either its
 [Layer.parent] or an undisposed [RenderObject] that will append it to a
 [ContainerLayer]. Layers automatically hold a handle to their children, and
 RenderObjects automatically hold a handle to their [RenderObject.layer] as
 well as any [PictureLayer]s that they paint into using the
 [PaintingContext.canvas]. A layer automatically releases its resources once
 at least one handle has been acquired and all handles have been disposed.
 [RenderObject]s that create additional layer objects must manually manage
 the handles for that layer similarly to the implementation of
 [RenderObject.layer].

 A handle is automatically managed for [RenderObject.layer].

 If a [RenderObject] creates layers in addition to its [RenderObject.layer]
 and it intends to reuse those layers separately from [RenderObject.layer],
 it must create a handle to that layer and dispose of it when the layer is
 no longer needed. For example, if it re-creates or nulls out an existing
 layer in [RenderObject.paint], it should dispose of the handle to the
 old layer. It should also dispose of any layer handles it holds in
 [RenderObject.dispose].

 To dispose of a layer handle, set its [layer] property to null.

## Members

- **_layer**: `T?`
## Constructors

### Unnamed Constructor
Create a new layer handle, optionally referencing a [Layer].

