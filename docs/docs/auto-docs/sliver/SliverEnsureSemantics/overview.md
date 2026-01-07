# Overview for `SliverEnsureSemantics`

## Description

A sliver that ensures its sliver child is included in the semantics tree.

 This sliver ensures that its child sliver is still visited by the [RenderViewport]
 when constructing the semantics tree, and is not clipped out of the semantics tree by
 the [RenderViewport] when it is outside the current viewport and outside the cache extent.

 The child sliver may still be excluded from the semantics tree if its [RenderSliver] does
 not provide a valid [RenderSliver.semanticBounds]. This sliver does not guarantee its
 child sliver is laid out.

 Be mindful when positioning [SliverEnsureSemantics] in a [CustomScrollView] after slivers that build
 their children lazily, like [SliverList]. Lazy slivers might underestimate the total scrollable size (scroll
 extent) before the [SliverEnsureSemantics] widget. This inaccuracy can cause problems for assistive
 technologies (e.g., screen readers), which rely on a correct scroll extent to navigate properly; they
 might fail to scroll accurately to the content wrapped by [SliverEnsureSemantics].

 To avoid this potential issue and ensure the scroll extent is calculated accurately up to this sliver,
 it's recommended to use slivers that can determine their extent precisely beforehand. Instead of
 [SliverList], consider using [SliverFixedExtentList], [SliverVariedExtentList], or
 [SliverPrototypeExtentList]. If using [SliverGrid], ensure it employs a delegate such as
 [SliverGridDelegateWithFixedCrossAxisCount] or [SliverGridDelegateWithMaxCrossAxisExtent].
 Using these alternatives guarantees that the scrollable area's size is known accurately, allowing
 assistive technologies to function correctly with [SliverEnsureSemantics].

 
 This example shows how to use [SliverEnsureSemantics] to keep certain headers and lists
 available to assistive technologies while they are outside the current viewport and cache extent.

 ** See code in examples/api/lib/widgets/sliver/sliver_ensure_semantics.0.dart **
 

## Dependencies

- SingleChildRenderObjectWidget

## Constructors

### Unnamed Constructor
Creates a sliver that ensures its sliver child is included in the semantics tree.

