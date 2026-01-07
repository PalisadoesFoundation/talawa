# Overview for `RenderViewport`

## Description

A render object that is bigger on the inside.

 [RenderViewport] is the visual workhorse of the scrolling machinery. It
 displays a subset of its children according to its own dimensions and the
 given [offset]. As the offset varies, different children are visible through
 the viewport.

 [RenderViewport] hosts a bidirectional list of slivers in a single shared
 [Axis], anchored on a [center] sliver, which is placed at the zero scroll
 offset. The center widget is displayed in the viewport according to the
 [anchor] property.

 Slivers that are earlier in the child list than [center] are displayed in
 reverse order in the reverse [axisDirection] starting from the [center]. For
 example, if the [axisDirection] is [AxisDirection.down], the first sliver
 before [center] is placed above the [center]. The slivers that are later in
 the child list than [center] are placed in order in the [axisDirection]. For
 example, in the preceding scenario, the first sliver after [center] is
 placed below the [center].

 

 [RenderViewport] cannot contain [RenderBox] children directly. Instead, use
 a [RenderSliverList], [RenderSliverFixedExtentList], [RenderSliverGrid], or
 a [RenderSliverToBoxAdapter], for example.

 See also:

  * [RenderSliver], which explains more about the Sliver protocol.
  * [RenderBox], which explains more about the Box protocol.
  * [RenderSliverToBoxAdapter], which allows a [RenderBox] object to be
    placed inside a [RenderSliver] (the opposite of this class).
  * [RenderShrinkWrappingViewport], a variant of [RenderViewport] that
    shrink-wraps its contents along the main axis.

## Dependencies

- RenderViewportBase

## Members

- **useTwoPaneSemantics**: `SemanticsTag`
  If a [RenderAbstractViewport] overrides
 [RenderObject.describeSemanticsConfiguration] to add the [SemanticsTag]
 [useTwoPaneSemantics] to its [SemanticsConfiguration], two semantics nodes
 will be used to represent the viewport with its associated scrolling
 actions in the semantics tree.

 Two semantics nodes (an inner and an outer node) are necessary to exclude
 certain child nodes (via the [excludeFromScrolling] tag) from the
 scrollable area for semantic purposes: The [SemanticsNode]s of children
 that should be excluded from scrolling will be attached to the outer node.
 The semantic scrolling actions and the [SemanticsNode]s of scrollable
 children will be attached to the inner node, which itself is a child of
 the outer node.

 See also:

 * [RenderViewportBase.describeSemanticsConfiguration], which adds this
   tag to its [SemanticsConfiguration].

- **excludeFromScrolling**: `SemanticsTag`
  When a top-level [SemanticsNode] below a [RenderAbstractViewport] is
 tagged with [excludeFromScrolling] it will not be part of the scrolling
 area for semantic purposes.

 This behavior is only active if the [RenderAbstractViewport]
 tagged its [SemanticsConfiguration] with [useTwoPaneSemantics].
 Otherwise, the [excludeFromScrolling] tag is ignored.

 As an example, a [RenderSliver] that stays on the screen within a
 [Scrollable] even though the user has scrolled past it (e.g. a pinned app
 bar) can tag its [SemanticsNode] with [excludeFromScrolling] to indicate
 that it should no longer be considered for semantic actions related to
 scrolling.

- **_anchor**: `double`
- **_center**: `RenderSliver?`
- **_maxLayoutCyclesPerChild**: `int`
- **_minScrollExtent**: `double`
- **_maxScrollExtent**: `double`
- **_hasVisualOverflow**: `bool`
## Constructors

### Unnamed Constructor
Creates a viewport for [RenderSliver] objects.

 If the [center] is not specified, then the first child in the `children`
 list, if any, is used.

 The [offset] must be specified. For testing purposes, consider passing a
 [ViewportOffset.zero] or [ViewportOffset.fixed].

