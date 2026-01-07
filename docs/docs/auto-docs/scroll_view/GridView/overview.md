# Overview for `GridView`

## Description

A scrollable, 2D array of widgets.

 

 The main axis direction of a grid is the direction in which it scrolls (the
 [scrollDirection]).

 The most commonly used grid layouts are [GridView.count], which creates a
 layout with a fixed number of tiles in the cross axis, and
 [GridView.extent], which creates a layout with tiles that have a maximum
 cross-axis extent. A custom [SliverGridDelegate] can produce an arbitrary 2D
 arrangement of children, including arrangements that are unaligned or
 overlapping.

 To create a grid with a large (or infinite) number of children, use the
 [GridView.builder] constructor with either a
 [SliverGridDelegateWithFixedCrossAxisCount] or a
 [SliverGridDelegateWithMaxCrossAxisExtent] for the [gridDelegate].

 To use a custom [SliverChildDelegate], use [GridView.custom].

 To create a linear array of children, use a [ListView].

 To control the initial scroll offset of the scroll view, provide a
 [controller] with its [ScrollController.initialScrollOffset] property set.

 ## Transitioning to [CustomScrollView]

 A [GridView] is basically a [CustomScrollView] with a single [SliverGrid] in
 its [CustomScrollView.slivers] property.

 If [GridView] is no longer sufficient, for example because the scroll view
 is to have both a grid and a list, or because the grid is to be combined
 with a [SliverAppBar], etc, it is straight-forward to port code from using
 [GridView] to using [CustomScrollView] directly.

 The [key], [scrollDirection], [reverse], [controller], [primary], [physics],
 and [shrinkWrap] properties on [GridView] map directly to the identically
 named properties on [CustomScrollView].

 The [CustomScrollView.slivers] property should be a list containing just a
 [SliverGrid].

 The [childrenDelegate] property on [GridView] corresponds to the
 [SliverGrid.delegate] property, and the [gridDelegate] property on the
 [GridView] corresponds to the [SliverGrid.gridDelegate] property.

 The [GridView], [GridView.count], and [GridView.extent]
 constructors' `children` arguments correspond to the [childrenDelegate]
 being a [SliverChildListDelegate] with that same argument. The
 [GridView.builder] constructor's `itemBuilder` and `childCount` arguments
 correspond to the [childrenDelegate] being a [SliverChildBuilderDelegate]
 with the matching arguments.

 The [GridView.count] and [GridView.extent] constructors create
 custom grid delegates, and have equivalently named constructors on
 [SliverGrid] to ease the transition: [SliverGrid.count] and
 [SliverGrid.extent] respectively.

 The [padding] property corresponds to having a [SliverPadding] in the
 [CustomScrollView.slivers] property instead of the grid itself, and having
 the [SliverGrid] instead be a child of the [SliverPadding].

 Once code has been ported to use [CustomScrollView], other slivers, such as
 [SliverList] or [SliverAppBar], can be put in the [CustomScrollView.slivers]
 list.

 

 ## Examples

 
 This example demonstrates how to create a [GridView] with two columns. The
 children are spaced apart using the `crossAxisSpacing` and `mainAxisSpacing`
 properties.

 ![The GridView displays six children with different background colors arranged in two columns](https://flutter.github.io/assets-for-api-docs/assets/widgets/grid_view.png)

 ```dart
 GridView.count(
   primary: false,
   padding: const EdgeInsets.all(20),
   crossAxisSpacing: 10,
   mainAxisSpacing: 10,
   crossAxisCount: 2,
   children: <Widget>[
     Container(
       padding: const EdgeInsets.all(8),
       color: Colors.teal[100],
       child: const Text("He'd have you all unravel at the"),
     ),
     Container(
       padding: const EdgeInsets.all(8),
       color: Colors.teal[200],
       child: const Text('Heed not the rabble'),
     ),
     Container(
       padding: const EdgeInsets.all(8),
       color: Colors.teal[300],
       child: const Text('Sound of screams but the'),
     ),
     Container(
       padding: const EdgeInsets.all(8),
       color: Colors.teal[400],
       child: const Text('Who scream'),
     ),
     Container(
       padding: const EdgeInsets.all(8),
       color: Colors.teal[500],
       child: const Text('Revolution is coming...'),
     ),
     Container(
       padding: const EdgeInsets.all(8),
       color: Colors.teal[600],
       child: const Text('Revolution, they...'),
     ),
   ],
 )
 ```
 

 
 This example shows how to create the same grid as the previous example
 using a [CustomScrollView] and a [SliverGrid].

 ![The CustomScrollView contains a SliverGrid that displays six children with different background colors arranged in two columns](https://flutter.github.io/assets-for-api-docs/assets/widgets/grid_view_custom_scroll.png)

 ```dart
 CustomScrollView(
   primary: false,
   slivers: <Widget>[
     SliverPadding(
       padding: const EdgeInsets.all(20),
       sliver: SliverGrid.count(
         crossAxisSpacing: 10,
         mainAxisSpacing: 10,
         crossAxisCount: 2,
         children: <Widget>[
           Container(
             padding: const EdgeInsets.all(8),
             color: Colors.green[100],
             child: const Text("He'd have you all unravel at the"),
           ),
           Container(
             padding: const EdgeInsets.all(8),
             color: Colors.green[200],
             child: const Text('Heed not the rabble'),
           ),
           Container(
             padding: const EdgeInsets.all(8),
             color: Colors.green[300],
             child: const Text('Sound of screams but the'),
           ),
           Container(
             padding: const EdgeInsets.all(8),
             color: Colors.green[400],
             child: const Text('Who scream'),
           ),
           Container(
             padding: const EdgeInsets.all(8),
             color: Colors.green[500],
             child: const Text('Revolution is coming...'),
           ),
           Container(
             padding: const EdgeInsets.all(8),
             color: Colors.green[600],
             child: const Text('Revolution, they...'),
           ),
         ],
       ),
     ),
   ],
 )
 ```
 

 
 This example shows a custom implementation of selection in list and grid views.
 Use the button in the top right (possibly hidden under the DEBUG banner) to toggle between
 [ListView] and [GridView].
 Long press any [ListTile] or [GridTile] to enable selection mode.

 ** See code in examples/api/lib/widgets/scroll_view/list_view.0.dart **
 

 
 This example shows a custom [SliverGridDelegate].

 ** See code in examples/api/lib/widgets/scroll_view/grid_view.0.dart **
 

 ## Troubleshooting

 ### Padding

 By default, [GridView] will automatically pad the limits of the
 grid's scrollable to avoid partial obstructions indicated by
 [MediaQuery]'s padding. To avoid this behavior, override with a
 zero [padding] property.

 
 The following example demonstrates how to override the default top padding
 using [MediaQuery.removePadding].

 ```dart
 Widget myWidget(BuildContext context) 
 ```
 

 See also:

  * [SingleChildScrollView], which is a scrollable widget that has a single
    child.
  * [ListView], which is scrollable, linear list of widgets.
  * [PageView], which is a scrolling list of child widgets that are each the
    size of the viewport.
  * [CustomScrollView], which is a scrollable widget that creates custom
    scroll effects using slivers.
  * [SliverGridDelegateWithFixedCrossAxisCount], which creates a layout with
    a fixed number of tiles in the cross axis.
  * [SliverGridDelegateWithMaxCrossAxisExtent], which creates a layout with
    tiles that have a maximum cross-axis extent.
  * [ScrollNotification] and [NotificationListener], which can be used to watch
    the scroll position without using a [ScrollController].
  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).

## Dependencies

- BoxScrollView

## Members

- **gridDelegate**: `SliverGridDelegate`
  A delegate that controls the layout of the children within the [GridView].

 The [GridView], [GridView.builder], and [GridView.custom] constructors let you specify this
 delegate explicitly. The other constructors create a [gridDelegate]
 implicitly.

- **childrenDelegate**: `SliverChildDelegate`
  A delegate that provides the children for the [GridView].

 The [GridView.custom] constructor lets you specify this delegate
 explicitly. The other constructors create a [childrenDelegate] that wraps
 the given child list.

## Constructors

### Unnamed Constructor
Creates a scrollable, 2D array of widgets with a custom
 [SliverGridDelegate].

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildListDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildListDelegate.addRepaintBoundaries] property. Both must not be
 null.

### builder
Creates a scrollable, 2D array of widgets that are created on demand.

 This constructor is appropriate for grid views with a large (or infinite)
 number of children because the builder is called only for those children
 that are actually visible.

 Providing a non-null `itemCount` improves the ability of the [GridView] to
 estimate the maximum scroll extent.

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
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### custom
Creates a scrollable, 2D array of widgets with both a custom
 [SliverGridDelegate] and a custom [SliverChildDelegate].

 To use an [IndexedWidgetBuilder] callback to build children, either use
 a [SliverChildBuilderDelegate] or use the [GridView.builder] constructor.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### count
Creates a scrollable, 2D array of widgets with a fixed number of tiles in
 the cross axis.

 Uses a [SliverGridDelegateWithFixedCrossAxisCount] as the [gridDelegate].

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildListDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildListDelegate.addRepaintBoundaries] property. Both must not be
 null.

 See also:

  * [SliverGrid.count], the equivalent constructor for [SliverGrid].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### extent
Creates a scrollable, 2D array of widgets with tiles that each have a
 maximum cross-axis extent.

 Uses a [SliverGridDelegateWithMaxCrossAxisExtent] as the [gridDelegate].

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildListDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildListDelegate.addRepaintBoundaries] property. Both must not be
 null.

 See also:

  * [SliverGrid.extent], the equivalent constructor for [SliverGrid].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
