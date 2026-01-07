# Overview for `SliverPrototypeExtentList`

## Description

A sliver that places its box children in a linear array and constrains them
 to have the same extent as a prototype item along the main axis.

 _To learn more about slivers, see [CustomScrollView.slivers]._

 [SliverPrototypeExtentList] arranges its children in a line along
 the main axis starting at offset zero and without gaps. Each child is
 constrained to the same extent as the [prototypeItem] along the main axis
 and the [SliverConstraints.crossAxisExtent] along the cross axis.

 [SliverPrototypeExtentList] is more efficient than [SliverList] because
 [SliverPrototypeExtentList] does not need to lay out its children to obtain
 their extent along the main axis. It's a little more flexible than
 [SliverFixedExtentList] because there's no need to determine the appropriate
 item extent in pixels.

 See also:

  * [SliverFixedExtentList], whose children are forced to a given pixel
    extent.
  * [SliverVariedExtentList], which supports children with varying (but known
    upfront) extents.
  * [SliverList], which does not require its children to have the same
    extent in the main axis.
  * [SliverFillViewport], which sizes its children based on the
    size of the viewport, regardless of what else is in the scroll view.

## Dependencies

- SliverMultiBoxAdaptorWidget

## Members

- **prototypeItem**: `Widget`
  Defines the main axis extent of all of this sliver's children.

 The [prototypeItem] is laid out before the rest of the sliver's children
 and its size along the main axis fixes the size of each child. The
 [prototypeItem] is essentially [Offstage]: it is not painted and it
 cannot respond to input.

## Constructors

### Unnamed Constructor
Creates a sliver that places its box children in a linear array and
 constrains them to have the same extent as a prototype item along
 the main axis.

### builder
A sliver that places its box children in a linear array and constrains them
 to have the same extent as a prototype item along the main axis.

 This constructor is appropriate for sliver lists with a large (or
 infinite) number of children whose extent is already determined.

 Providing a non-null `itemCount` improves the ability of the [SliverGrid]
 to estimate the maximum scroll extent.

 `itemBuilder` will be called only with indices greater than or equal to
 zero and less than `itemCount`.

 

 The `prototypeItem` argument is used to determine the extent of each item.

 

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildBuilderDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildBuilderDelegate.addRepaintBoundaries] property. The
 `addSemanticIndexes` argument corresponds to the
 [SliverChildBuilderDelegate.addSemanticIndexes] property.

 
 This example, which would be inserted into a [CustomScrollView.slivers]
 list, shows an infinite number of items in varying shades of blue:

 ```dart
 SliverPrototypeExtentList.builder(
   prototypeItem: Container(
     alignment: Alignment.center,
     child: const Text('list item prototype'),
   ),
   itemBuilder: (BuildContext context, int index) ,
 )
 ```
 

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

 This constructor uses a list of [Widget]s to build the sliver.

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildBuilderDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildBuilderDelegate.addRepaintBoundaries] property. The
 `addSemanticIndexes` argument corresponds to the
 [SliverChildBuilderDelegate.addSemanticIndexes] property.

 
 This example, which would be inserted into a [CustomScrollView.slivers]
 list, shows an infinite number of items in varying shades of blue:

 ```dart
 SliverPrototypeExtentList.list(
   prototypeItem: const Text('Hello'),
   children: const <Widget>[
     Text('Hello'),
     Text('World!'),
   ],
 );
 ```
 

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
