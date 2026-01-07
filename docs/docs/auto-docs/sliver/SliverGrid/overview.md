# Overview for `SliverGrid`

## Description

A sliver that places multiple box children in a two dimensional arrangement.

 _To learn more about slivers, see [CustomScrollView.slivers]._

 [SliverGrid] places its children in arbitrary positions determined by
 [gridDelegate]. Each child is forced to have the size specified by the
 [gridDelegate].

 The main axis direction of a grid is the direction in which it scrolls; the
 cross axis direction is the orthogonal direction.

 

 

 This example, which would be inserted into a [CustomScrollView.slivers]
 list, shows twenty boxes in a pretty teal grid:

 ```dart
 SliverGrid(
   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
     maxCrossAxisExtent: 200.0,
     mainAxisSpacing: 10.0,
     crossAxisSpacing: 10.0,
     childAspectRatio: 4.0,
   ),
   delegate: SliverChildBuilderDelegate(
     (BuildContext context, int index) ,
     childCount: 20,
   ),
 )
 ```
 

 

 See also:

  * [SliverList], which places its children in a linear array.
  * [SliverFixedExtentList], which places its children in a linear
    array with a fixed extent in the main axis.
  * [SliverPrototypeExtentList], which is similar to [SliverFixedExtentList]
    except that it uses a prototype list item instead of a pixel value to define
    the main axis extent of each item.

## Dependencies

- SliverMultiBoxAdaptorWidget

## Members

- **gridDelegate**: `SliverGridDelegate`
  The delegate that controls the size and position of the children.

## Constructors

### Unnamed Constructor
Creates a sliver that places multiple box children in a two dimensional
 arrangement.

### builder
A sliver that creates a 2D array of widgets that are created on demand.

 This constructor is appropriate for sliver grids with a large (or
 infinite) number of children because the builder is called only for those
 children that are actually visible.

 Providing a non-null `itemCount` improves the ability of the [SliverGrid]
 to estimate the maximum scroll extent.

 `itemBuilder` will be called only with indices greater than or equal to
 zero and less than `itemCount`.

 

 

 The [gridDelegate] argument is required.

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildBuilderDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildBuilderDelegate.addRepaintBoundaries] property. The
 `addSemanticIndexes` argument corresponds to the
 [SliverChildBuilderDelegate.addSemanticIndexes] property.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### count
Creates a sliver that places multiple box children in a two dimensional
 arrangement with a fixed number of tiles in the cross axis.

 Uses a [SliverGridDelegateWithFixedCrossAxisCount] as the [gridDelegate],
 and a [SliverChildListDelegate] as the [delegate].

 See also:

  * [GridView.count], the equivalent constructor for [GridView] widgets.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### extent
Creates a sliver that places multiple box children in a two dimensional
 arrangement with tiles that each have a maximum cross-axis extent.

 Uses a [SliverGridDelegateWithMaxCrossAxisExtent] as the [gridDelegate],
 and a [SliverChildListDelegate] as the [delegate].

 See also:

  * [GridView.extent], the equivalent constructor for [GridView] widgets.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
