# Overview for `SliverList`

## Description

A sliver that places multiple box children in a linear array along the main
 axis.

 _To learn more about slivers, see [CustomScrollView.slivers]._

 Each child is forced to have the [SliverConstraints.crossAxisExtent] in the
 cross axis but determines its own main axis extent.

 [SliverList] determines its scroll offset by "dead reckoning" because
 children outside the visible part of the sliver are not materialized, which
 means [SliverList] cannot learn their main axis extent. Instead, newly
 materialized children are placed adjacent to existing children.

 

 If the children have a fixed extent in the main axis, consider using
 [SliverFixedExtentList] rather than [SliverList] because
 [SliverFixedExtentList] does not need to perform layout on its children to
 obtain their extent in the main axis and is therefore more efficient.

 

 See also:

  * <https://docs.flutter.dev/ui/layout/scrolling/slivers>, a description
    of what slivers are and how to use them.
  * [SliverFixedExtentList], which is more efficient for children with
    the same extent in the main axis.
  * [SliverPrototypeExtentList], which is similar to [SliverFixedExtentList]
    except that it uses a prototype list item instead of a pixel value to define
    the main axis extent of each item.
  * [SliverAnimatedList], which animates items added to or removed from a
    list.
  * [SliverGrid], which places multiple children in a two dimensional grid.
  * [SliverAnimatedGrid], a sliver which animates items when they are
    inserted into or removed from a grid.

## Dependencies

- SliverMultiBoxAdaptorWidget

## Constructors

### Unnamed Constructor
Creates a sliver that places box children in a linear array.

### builder
A sliver that places multiple box children in a linear array along the main
 axis.

 This constructor is appropriate for sliver lists with a large (or
 infinite) number of children because the builder is called only for those
 children that are actually visible.

 Providing a non-null `itemCount` improves the ability of the [SliverList]
 to estimate the maximum scroll extent.

 `itemBuilder` will be called only with indices greater than or equal to
 zero and less than `itemCount`.

 

 

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildBuilderDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildBuilderDelegate.addRepaintBoundaries] property. The
 `addSemanticIndexes` argument corresponds to the
 [SliverChildBuilderDelegate.addSemanticIndexes] property.

 
 This example, which would be provided in [CustomScrollView.slivers],
 shows an infinite number of items in varying shades of blue:

 ```dart
 SliverList.builder(
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
### separated
A sliver that places multiple box children, separated by box widgets, in a
 linear array along the main axis.

 This constructor is appropriate for sliver lists with a large (or
 infinite) number of children because the builder is called only for those
 children that are actually visible.

 Providing a non-null `itemCount` improves the ability of the [SliverList]
 to estimate the maximum scroll extent.

 `itemBuilder` will be called only with indices greater than or equal to
 zero and less than `itemCount`.

 

 


 The `separatorBuilder` is similar to `itemBuilder`, except it is the widget
 that gets placed between itemBuilder(context, index) and itemBuilder(context, index + 1).

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildBuilderDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildBuilderDelegate.addRepaintBoundaries] property. The
 `addSemanticIndexes` argument corresponds to the
 [SliverChildBuilderDelegate.addSemanticIndexes] property.

 
 This example shows how to create a [SliverList] whose [Container] items
 are separated by [Divider]s. The [SliverList] would be provided in
 [CustomScrollView.slivers].

 ```dart
 SliverList.separated(
   itemBuilder: (BuildContext context, int index) ,
   separatorBuilder: (BuildContext context, int index) => const ,
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

 
 This example, which would be provided in [CustomScrollView.slivers],
 shows a list containing two [Text] widgets:

 ```dart
 SliverList.list(
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
