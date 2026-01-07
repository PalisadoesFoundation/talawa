# Overview for `MultiChildLayoutDelegate`

## Description

A delegate that controls the layout of multiple children.

 Used with [CustomMultiChildLayout] (in the widgets library) and
 [RenderCustomMultiChildLayoutBox] (in the rendering library).

 Delegates must be idempotent. Specifically, if two delegates are equal, then
 they must produce the same layout. To change the layout, replace the
 delegate with a different instance whose [shouldRelayout] returns true when
 given the previous instance.

 Override [getSize] to control the overall size of the layout. The size of
 the layout cannot depend on layout properties of the children. This was
 a design decision to simplify the delegate implementations: This way,
 the delegate implementations do not have to also handle various intrinsic
 sizing functions if the parent's size depended on the children.
 If you want to build a custom layout where you define the size of that widget
 based on its children, then you will have to create a custom render object.
 See [MultiChildRenderObjectWidget] with [ContainerRenderObjectMixin] and
 [RenderBoxContainerDefaultsMixin] to get started or [RenderStack] for an
 example implementation.

 Override [performLayout] to size and position the children. An
 implementation of [performLayout] must call [layoutChild] exactly once for
 each child, but it may call [layoutChild] on children in an arbitrary order.
 Typically a delegate will use the size returned from [layoutChild] on one
 child to determine the constraints for [performLayout] on another child or
 to determine the offset for [positionChild] for that child or another child.

 Override [shouldRelayout] to determine when the layout of the children needs
 to be recomputed when the delegate changes.

 The most efficient way to trigger a relayout is to supply a `relayout`
 argument to the constructor of the [MultiChildLayoutDelegate]. The custom
 layout will listen to this value and relayout whenever the Listenable
 notifies its listeners, such as when an [Animation] ticks. This allows
 the custom layout to avoid the build phase of the pipeline.

 Each child must be wrapped in a [LayoutId] widget to assign the id that
 identifies it to the delegate. The [LayoutId.id] needs to be unique among
 the children that the [CustomMultiChildLayout] manages.

 

 Below is an example implementation of [performLayout] that causes one widget
 (the follower) to be the same size as another (the leader):

 ```dart
 // Define your own slot numbers, depending upon the id assigned by LayoutId.
 // Typical usage is to define an enum like the one below, and use those
 // values as the ids.
 enum _Slot 

 class FollowTheLeader extends MultiChildLayoutDelegate 
 ```
 

 The delegate gives the leader widget loose constraints, which means the
 child determines what size to be (subject to fitting within the given size).
 The delegate then remembers the size of that child and places it in the
 upper left corner.

 The delegate then gives the follower widget tight constraints, forcing it to
 match the size of the leader widget. The delegate then places the follower
 widget in the bottom right corner.

 The leader and follower widget will paint in the order they appear in the
 child list, regardless of the order in which [layoutChild] is called on
 them.

 See also:

  * [CustomMultiChildLayout], the widget that uses this delegate.
  * [RenderCustomMultiChildLayoutBox], render object that uses this
    delegate.

## Members

- **_relayout**: `Listenable?`
- **_idToChild**: `Map&lt;Object, RenderBox&gt;?`
- **_debugChildrenNeedingLayout**: `Set&lt;RenderBox&gt;?`
## Constructors

### Unnamed Constructor
Creates a layout delegate.

 The layout will update whenever [relayout] notifies its listeners.

