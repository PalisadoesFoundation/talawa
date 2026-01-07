# Overview for `SliverVariedExtentList`

## Description

A sliver that places its box children in a linear array and constrains them
 to have the corresponding extent returned by [itemExtentBuilder].

 _To learn more about slivers, see [CustomScrollView.slivers]._

 [SliverVariedExtentList] arranges its children in a line along
 the main axis starting at offset zero and without gaps. Each child is
 constrained to the corresponding extent along the main axis
 and the [SliverConstraints.crossAxisExtent] along the cross axis.

 [SliverVariedExtentList] is more efficient than [SliverList] because
 [SliverVariedExtentList] does not need to lay out its children to obtain
 their extent along the main axis. It's a little more flexible than
 [SliverFixedExtentList] because this allow the children to have different extents.

 See also:

  * [SliverFixedExtentList], whose children are forced to a given pixel
    extent.
  * [SliverPrototypeExtentList], which is similar to [SliverFixedExtentList]
    except that it uses a prototype list item instead of a pixel value to define
    the main axis extent of each item.
  * [SliverList], which does not require its children to have the same
    extent in the main axis.
  * [SliverFillViewport], which sizes its children based on the
    size of the viewport, regardless of what else is in the scroll view.

## Dependencies

- SliverMultiBoxAdaptorWidget

## Members

- **itemExtentBuilder**: `ItemExtentBuilder`
  The children extent builder.

 Should return null if asked to build an item extent with a greater index than
 exists.

## Constructors

### Unnamed Constructor
Creates a sliver that places box children with the same main axis extent
 in a linear array.

### builder
A sliver that places multiple box children in a linear array along the main
 axis.

 [SliverVariedExtentList] places its children in a linear array along the main
 axis starting at offset zero and without gaps. Each child is forced to have
 the returned extent of [itemExtentBuilder] in the main axis and the
 [SliverConstraints.crossAxisExtent] in the cross axis.

 This constructor is appropriate for sliver lists with a large (or
 infinite) number of children whose extent is already determined.

 Providing a non-null `itemCount` improves the ability of the [SliverVariedExtentList]
 to estimate the maximum scroll extent.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### list
A sliver that places multiple box children in a linear array along the main
 axis.

 [SliverVariedExtentList] places its children in a linear array along the main
 axis starting at offset zero and without gaps. Each child is forced to have
 the returned extent of [itemExtentBuilder] in the main axis and the
 [SliverConstraints.crossAxisExtent] in the cross axis.

 This constructor uses a list of [Widget]s to build the sliver.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
