# Overview for `SliverFixedExtentList`

## Description

A sliver that places multiple box children with the same main axis extent in
 a linear array.

 _To learn more about slivers, see [CustomScrollView.slivers]._

 [SliverFixedExtentList] places its children in a linear array along the main
 axis starting at offset zero and without gaps. Each child is forced to have
 the [itemExtent] in the main axis and the
 [SliverConstraints.crossAxisExtent] in the cross axis.

 [SliverFixedExtentList] is more efficient than [SliverList] because
 [SliverFixedExtentList] does not need to perform layout on its children to
 obtain their extent in the main axis.

 

 This example, which would be inserted into a [CustomScrollView.slivers]
 list, shows an infinite number of items in varying shades of blue:

 ```dart
 SliverFixedExtentList(
   itemExtent: 50.0,
   delegate: SliverChildBuilderDelegate(
     (BuildContext context, int index) ,
   ),
 )
 ```
 

 

 See also:

  * [SliverPrototypeExtentList], which is similar to [SliverFixedExtentList]
    except that it uses a prototype list item instead of a pixel value to define
    the main axis extent of each item.
  * [SliverVariedExtentList], which supports children with varying (but known
    upfront) extents.
  * [SliverFillViewport], which determines the [itemExtent] based on
    [SliverConstraints.viewportMainAxisExtent].
  * [SliverList], which does not require its children to have the same
    extent in the main axis.

## Dependencies

- SliverMultiBoxAdaptorWidget

## Members

- **itemExtent**: `double`
  The extent the children are forced to have in the main axis.

## Constructors

### Unnamed Constructor
Creates a sliver that places box children with the same main axis extent
 in a linear array.

### builder
A sliver that places multiple box children in a linear array along the main
 axis.

 [SliverFixedExtentList] places its children in a linear array along the main
 axis starting at offset zero and without gaps. Each child is forced to have
 the [itemExtent] in the main axis and the
 [SliverConstraints.crossAxisExtent] in the cross axis.

 This constructor is appropriate for sliver lists with a large (or
 infinite) number of children whose extent is already determined.

 Providing a non-null `itemCount` improves the ability of the [SliverFixedExtentList]
 to estimate the maximum scroll extent.

 `itemBuilder` will be called only with indices greater than or equal to
 zero and less than `itemCount`.

 

 The `itemExtent` argument is the extent of each item.

 

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildBuilderDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildBuilderDelegate.addRepaintBoundaries] property. The
 `addSemanticIndexes` argument corresponds to the
 [SliverChildBuilderDelegate.addSemanticIndexes] property.
 

 This example, which would be inserted into a [CustomScrollView.slivers]
 list, shows an infinite number of items in varying shades of blue:

 ```dart
 SliverFixedExtentList.builder(
   itemExtent: 50.0,
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

 [SliverFixedExtentList] places its children in a linear array along the main
 axis starting at offset zero and without gaps. Each child is forced to have
 the [itemExtent] in the main axis and the
 [SliverConstraints.crossAxisExtent] in the cross axis.

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
 SliverFixedExtentList.list(
   itemExtent: 50.0,
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
