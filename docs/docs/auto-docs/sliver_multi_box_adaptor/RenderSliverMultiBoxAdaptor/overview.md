# Overview for `RenderSliverMultiBoxAdaptor`

## Description

A sliver with multiple box children.

 [RenderSliverMultiBoxAdaptor] is a base class for slivers that have multiple
 box children. The children are managed by a [RenderSliverBoxChildManager],
 which lets subclasses create children lazily during layout. Typically
 subclasses will create only those children that are actually needed to fill
 the [SliverConstraints.remainingPaintExtent].

 The contract for adding and removing children from this render object is
 more strict than for normal render objects:

 * Children can be removed except during a layout pass if they have already
   been laid out during that layout pass.
 * Children cannot be added except during a call to [childManager], and
   then only if there is no child corresponding to that index (or the child
   corresponding to that index was first removed).

 See also:

  * [RenderSliverToBoxAdapter], which has a single box child.
  * [RenderSliverList], which places its children in a linear
    array.
  * [RenderSliverFixedExtentList], which places its children in a linear
    array with a fixed extent in the main axis.
  * [RenderSliverGrid], which places its children in arbitrary positions.

## Dependencies

- RenderSliver, ContainerRenderObjectMixin, RenderSliverHelpers, RenderSliverWithKeepAliveMixin

## Members

- **_childManager**: `RenderSliverBoxChildManager`
- **_keepAliveBucket**: `Map&lt;int, RenderBox&gt;`
  The nodes being kept alive despite not being visible.

- **_debugDanglingKeepAlives**: `List&lt;RenderBox&gt;`
- **_debugChildIntegrityEnabled**: `bool`
## Constructors

### Unnamed Constructor
Creates a sliver with multiple box children.

