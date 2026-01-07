# Overview for `Layer`

## Description

A composited layer.

 During painting, the render tree generates a tree of composited layers that
 are uploaded into the engine and displayed by the compositor. This class is
 the base class for all composited layers.

 Most layers can have their properties mutated, and layers can be moved to
 different parents. The scene must be explicitly recomposited after such
 changes are made; the layer tree does not maintain its own dirty state.

 To composite the tree, create a [ui.SceneBuilder] object using
 [RendererBinding.createSceneBuilder], pass it to the root [Layer] object's
 [addToScene] method, and then call [ui.SceneBuilder.build] to obtain a [ui.Scene].
 A [ui.Scene] can then be painted using [ui.FlutterView.render].

 ## Memory

 Layers retain resources between frames to speed up rendering. A layer will
 retain these resources until all [LayerHandle]s referring to the layer have
 nulled out their references.

 Layers must not be used after disposal. If a RenderObject needs to maintain
 a layer for later usage, it must create a handle to that layer. This is
 handled automatically for the [RenderObject.layer] property, but additional
 layers must use their own [LayerHandle].

 

 This [RenderObject] is a repaint boundary that pushes an additional
 [ClipRectLayer].

 ```dart
 class ClippingRenderObject extends RenderBox 
 ```
 
 See also:

  * [RenderView.compositeFrame], which implements this recomposition protocol
    for painting [RenderObject] trees on the display.

## Dependencies

- DiagnosticableTreeMixin

## Members

- **_callbacks**: `Map&lt;int, VoidCallback&gt;`
- **_nextCallbackId**: `int`
- **_compositionCallbackCount**: `int`
- **_debugMutationsLocked**: `bool`
- **_debugDisposed**: `bool`
- **_parentHandle**: `LayerHandle&lt;Layer&gt;`
  Set when this layer is appended to a [ContainerLayer], and
 unset when it is removed.

 This cannot be set from [attach] or [detach] which is called when an
 entire subtree is attached to or detached from an owner. Layers may be
 appended to or removed from a [ContainerLayer] regardless of whether they
 are attached or detached, and detaching a layer from an owner does not
 imply that it has been removed from its parent.

- **_refCount**: `int`
  Incremented by [LayerHandle].

- **_parent**: `ContainerLayer?`
- **_needsAddToScene**: `bool`
- **_engineLayer**: `ui.EngineLayer?`
- **_owner**: `Object?`
- **_depth**: `int`
- **_nextSibling**: `Layer?`
- **_previousSibling**: `Layer?`
- **debugCreator**: `Object?`
  The object responsible for creating this layer.

 Defaults to the value of [RenderObject.debugCreator] for the render object
 that created this layer. Used in debug messages.

## Constructors

### Unnamed Constructor
Creates an instance of Layer.

