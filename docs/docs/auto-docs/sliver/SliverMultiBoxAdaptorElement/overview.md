# Overview for `SliverMultiBoxAdaptorElement`

## Description

An element that lazily builds children for a [SliverMultiBoxAdaptorWidget].

 Implements [RenderSliverBoxChildManager], which lets this element manage
 the children of subclasses of [RenderSliverMultiBoxAdaptor].

## Dependencies

- RenderObjectElement, RenderSliverBoxChildManager

## Members

- **_replaceMovedChildren**: `bool`
- **_childElements**: `SplayTreeMap&lt;int, Element?&gt;`
- **_currentBeforeChild**: `RenderBox?`
- **_currentlyUpdatingChildIndex**: `int?`
- **_didUnderflow**: `bool`
## Constructors

### Unnamed Constructor
Creates an element that lazily builds children for the given widget.

 If `replaceMovedChildren` is set to true, a new child is proactively
 inflate for the index that was previously occupied by a child that moved
 to a new index. The layout offset of the moved child is copied over to the
 new child. RenderObjects, that depend on the layout offset of existing
 children during [RenderObject.performLayout] should set this to true
 (example: [RenderSliverList]). For RenderObjects that figure out the
 layout offset of their children without looking at the layout offset of
 existing children this should be set to false (example:
 [RenderSliverFixedExtentList]) to avoid inflating unnecessary children.

