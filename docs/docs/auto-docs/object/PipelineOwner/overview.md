# Overview for `PipelineOwner`

## Description

The pipeline owner manages the rendering pipeline.

 The pipeline owner provides an interface for driving the rendering pipeline
 and stores the state about which render objects have requested to be visited
 in each stage of the pipeline. To flush the pipeline, call the following
 functions in order:

 1. [flushLayout] updates any render objects that need to compute their
    layout. During this phase, the size and position of each render
    object is calculated. Render objects might dirty their painting or
    compositing state during this phase.
 2. [flushCompositingBits] updates any render objects that have dirty
    compositing bits. During this phase, each render object learns whether
    any of its children require compositing. This information is used during
    the painting phase when selecting how to implement visual effects such as
    clipping. If a render object has a composited child, it needs to use a
    [Layer] to create the clip in order for the clip to apply to the
    composited child (which will be painted into its own [Layer]).
 3. [flushPaint] visits any render objects that need to paint. During this
    phase, render objects get a chance to record painting commands into
    [PictureLayer]s and construct other composited [Layer]s.
 4. Finally, if semantics are enabled, [flushSemantics] will compile the
    semantics for the render objects. This semantic information is used by
    assistive technology to improve the accessibility of the render tree.

 The [RendererBinding] holds the pipeline owner for the render objects that
 are visible on screen. You can create other pipeline owners to manage
 off-screen objects, which can flush their pipelines independently of the
 on-screen render objects.

 [PipelineOwner]s can be organized in a tree to manage multiple render trees,
 where each [PipelineOwner] is responsible for one of the render trees. To
 build or modify the tree, call [adoptChild] or [dropChild]. During each of
 the different flush phases described above, a [PipelineOwner] will first
 perform the phase on the nodes it manages in its own render tree before
 calling the same flush method on its children. No assumption must be made
 about the order in which child [PipelineOwner]s are flushed.

 A [PipelineOwner] may also be [attach]ed to a [PipelineManifold], which
 gives it access to platform functionality usually exposed by the bindings
 without tying it to a specific binding implementation. All [PipelineOwner]s
 in a given tree must be attached to the same [PipelineManifold]. This
 happens automatically during [adoptChild].

## Dependencies

- DiagnosticableTreeMixin

## Members

- **onNeedVisualUpdate**: `VoidCallback?`
  Called when a render object associated with this pipeline owner wishes to
 update its visual appearance.

 Typical implementations of this function will schedule a task to flush the
 various stages of the pipeline. This function might be called multiple
 times in quick succession. Implementations should take care to discard
 duplicate calls quickly.

 When the [PipelineOwner] is attached to a [PipelineManifold] and
 [onNeedVisualUpdate] is provided, the [onNeedVisualUpdate] callback is
 invoked instead of calling [PipelineManifold.requestVisualUpdate].

- **onSemanticsOwnerCreated**: `VoidCallback?`
  Called whenever this pipeline owner creates a semantics object.

 Typical implementations will schedule the creation of the initial
 semantics tree.

- **onSemanticsUpdate**: `SemanticsUpdateCallback?`
  Called whenever this pipeline owner's semantics owner emits a [SemanticsUpdate].

 Typical implementations will delegate the [SemanticsUpdate] to a [FlutterView]
 that can handle the [SemanticsUpdate].

- **onSemanticsOwnerDisposed**: `VoidCallback?`
  Called whenever this pipeline owner disposes its semantics owner.

 Typical implementations will tear down the semantics tree.

- **_rootNode**: `RenderObject?`
- **_shouldMergeDirtyNodes**: `bool`
- **_nodesNeedingLayout**: `List&lt;RenderObject&gt;`
- **_debugDoingLayout**: `bool`
- **_debugDoingChildLayout**: `bool`
- **_debugAllowMutationsToDirtySubtrees**: `bool`
- **_nodesNeedingCompositingBitsUpdate**: `List&lt;RenderObject&gt;`
- **_nodesNeedingPaint**: `List&lt;RenderObject&gt;`
- **_debugDoingPaint**: `bool`
- **_semanticsOwner**: `SemanticsOwner?`
- **_outstandingSemanticsHandles**: `int`
- **_debugDoingSemantics**: `bool`
- **_nodesNeedingSemantics**: `Set&lt;RenderObject&gt;`
- **_children**: `Set&lt;PipelineOwner&gt;`
- **_manifold**: `PipelineManifold?`
- **_debugParent**: `PipelineOwner?`
## Constructors

### Unnamed Constructor
Creates a pipeline owner.

 Typically created by the binding (e.g., [RendererBinding]), but can be
 created separately from the binding to drive off-screen render objects
 through the rendering pipeline.

