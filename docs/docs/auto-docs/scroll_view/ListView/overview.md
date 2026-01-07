# Overview for `ListView`

## Description

A scrollable list of widgets arranged linearly.

 

 [ListView] is the most commonly used scrolling widget. It displays its
 children one after another in the scroll direction. In the cross axis, the
 children are required to fill the [ListView].

 If non-null, the [itemExtent] forces the children to have the given extent
 in the scroll direction.

 If non-null, the [prototypeItem] forces the children to have the same extent
 as the given widget in the scroll direction.

 Specifying an [itemExtent] or an [prototypeItem] is more efficient than
 letting the children determine their own extent because the scrolling
 machinery can make use of the foreknowledge of the children's extent to save
 work, for example when the scroll position changes drastically.

 You can't specify both [itemExtent] and [prototypeItem], only one or none of
 them.

 There are four options for constructing a [ListView]:

  1. The default constructor takes an explicit [List&lt;Widget&gt;] of children. This
     constructor is appropriate for list views with a small number of
     children because constructing the [List] requires doing work for every
     child that could possibly be displayed in the list view instead of just
     those children that are actually visible.

  2. The [ListView.builder] constructor takes an [IndexedWidgetBuilder], which
     builds the children on demand. This constructor is appropriate for list views
     with a large (or infinite) number of children because the builder is called
     only for those children that are actually visible.

  3. The [ListView.separated] constructor takes two [IndexedWidgetBuilder]s:
     `itemBuilder` builds child items on demand, and `separatorBuilder`
     similarly builds separator children which appear in between the child items.
     This constructor is appropriate for list views with a fixed number of children.

  4. The [ListView.custom] constructor takes a [SliverChildDelegate], which provides
     the ability to customize additional aspects of the child model. For example,
     a [SliverChildDelegate] can control the algorithm used to estimate the
     size of children that are not actually visible.

 To control the initial scroll offset of the scroll view, provide a
 [controller] with its [ScrollController.initialScrollOffset] property set.

 By default, [ListView] will automatically pad the list's scrollable
 extremities to avoid partial obstructions indicated by [MediaQuery]'s
 padding. To avoid this behavior, override with a zero [padding] property.

 
 This example uses the default constructor for [ListView] which takes an
 explicit [List&lt;Widget&gt;] of children. This [ListView]'s children are made up
 of [Container]s with [Text].

 ![A ListView of 3 amber colored containers with sample text.](https://flutter.github.io/assets-for-api-docs/assets/widgets/list_view.png)

 ```dart
 ListView(
   padding: const EdgeInsets.all(8),
   children: <Widget>[
     Container(
       height: 50,
       color: Colors.amber[600],
       child: const Center(child: Text('Entry A')),
     ),
     Container(
       height: 50,
       color: Colors.amber[500],
       child: const Center(child: Text('Entry B')),
     ),
     Container(
       height: 50,
       color: Colors.amber[100],
       child: const Center(child: Text('Entry C')),
     ),
   ],
 )
 ```
 

 
 This example mirrors the previous one, creating the same list using the
 [ListView.builder] constructor. Using the [IndexedWidgetBuilder], children
 are built lazily and can be infinite in number.

 ![A ListView of 3 amber colored containers with sample text.](https://flutter.github.io/assets-for-api-docs/assets/widgets/list_view_builder.png)

 ```dart
 final List&lt;String&gt; entries = <String>['A', 'B', 'C'];
 final List&lt;int&gt; colorCodes = <int>[600, 500, 100];

 Widget build(BuildContext context) 
 ```
 

 
 This example continues to build from our the previous ones, creating a
 similar list using [ListView.separated]. Here, a [Divider] is used as a
 separator.

 ![A ListView of 3 amber colored containers with sample text and a Divider
 between each of them.](https://flutter.github.io/assets-for-api-docs/assets/widgets/list_view_separated.png)

 ```dart
 final List&lt;String&gt; entries = <String>['A', 'B', 'C'];
 final List&lt;int&gt; colorCodes = <int>[600, 500, 100];

 Widget build(BuildContext context) 
 ```
 

 ## Child elements' lifecycle

 ### Creation

 While laying out the list, visible children's elements, states and render
 objects will be created lazily based on existing widgets (such as when using
 the default constructor) or lazily provided ones (such as when using the
 [ListView.builder] constructor).

 ### Destruction

 When a child is scrolled out of view, the associated element subtree,
 states and render objects are destroyed. A new child at the same position
 in the list will be lazily recreated along with new elements, states and
 render objects when it is scrolled back.

 ### Destruction mitigation

 In order to preserve state as child elements are scrolled in and out of
 view, the following options are possible:

  * Moving the ownership of non-trivial UI-state-driving business logic
    out of the list child subtree. For instance, if a list contains posts
    with their number of upvotes coming from a cached network response, store
    the list of posts and upvote number in a data model outside the list. Let
    the list child UI subtree be easily recreate-able from the
    source-of-truth model object. Use [StatefulWidget]s in the child
    widget subtree to store instantaneous UI state only.

  * Letting [KeepAlive] be the root widget of the list child widget subtree
    that needs to be preserved. The [KeepAlive] widget marks the child
    subtree's top render object child for keepalive. When the associated top
    render object is scrolled out of view, the list keeps the child's render
    object (and by extension, its associated elements and states) in a cache
    list instead of destroying them. When scrolled back into view, the render
    object is repainted as-is (if it wasn't marked dirty in the interim).

    This only works if `addAutomaticKeepAlives` and `addRepaintBoundaries`
    are false since those parameters cause the [ListView] to wrap each child
    widget subtree with other widgets.

  * Using [AutomaticKeepAlive] widgets (inserted by default when
    `addAutomaticKeepAlives` is true). [AutomaticKeepAlive] allows descendant
    widgets to control whether the subtree is actually kept alive or not.
    This behavior is in contrast with [KeepAlive], which will unconditionally keep
    the subtree alive.

    As an example, the [EditableText] widget signals its list child element
    subtree to stay alive while its text field has input focus. If it doesn't
    have focus and no other descendants signaled for keepalive via a
    [KeepAliveNotification], the list child element subtree will be destroyed
    when scrolled away.

    [AutomaticKeepAlive] descendants typically signal it to be kept alive
    by using the [AutomaticKeepAliveClientMixin], then implementing the
    [AutomaticKeepAliveClientMixin.wantKeepAlive] getter and calling
    [AutomaticKeepAliveClientMixin.updateKeepAlive].

 ## Transitioning to [CustomScrollView]

 A [ListView] is basically a [CustomScrollView] with a single [SliverList] in
 its [CustomScrollView.slivers] property.

 If [ListView] is no longer sufficient, for example because the scroll view
 is to have both a list and a grid, or because the list is to be combined
 with a [SliverAppBar], etc, it is straight-forward to port code from using
 [ListView] to using [CustomScrollView] directly.

 The [key], [scrollDirection], [reverse], [controller], [primary], [physics],
 and [shrinkWrap] properties on [ListView] map directly to the identically
 named properties on [CustomScrollView].

 The [CustomScrollView.slivers] property should be a list containing either:
  * a [SliverList] if both [itemExtent] and [prototypeItem] were null;
  * a [SliverFixedExtentList] if [itemExtent] was not null; or
  * a [SliverPrototypeExtentList] if [prototypeItem] was not null.

 The [childrenDelegate] property on [ListView] corresponds to the
 [SliverList.delegate] (or [SliverFixedExtentList.delegate]) property. The
 [ListView] constructor's `children` argument corresponds to the
 [childrenDelegate] being a [SliverChildListDelegate] with that same
 argument. The [ListView.builder] constructor's `itemBuilder` and
 `itemCount` arguments correspond to the [childrenDelegate] being a
 [SliverChildBuilderDelegate] with the equivalent arguments.

 The [padding] property corresponds to having a [SliverPadding] in the
 [CustomScrollView.slivers] property instead of the list itself, and having
 the [SliverList] instead be a child of the [SliverPadding].

 [CustomScrollView]s don't automatically avoid obstructions from [MediaQuery]
 like [ListView]s do. To reproduce the behavior, wrap the slivers in
 [SliverSafeArea]s.

 Once code has been ported to use [CustomScrollView], other slivers, such as
 [SliverGrid] or [SliverAppBar], can be put in the [CustomScrollView.slivers]
 list.

 

 Here are two brief snippets showing a [ListView] and its equivalent using
 [CustomScrollView]:

 ```dart
 ListView(
   padding: const EdgeInsets.all(20.0),
   children: const <Widget>[
     Text("I'm dedicating every day to you"),
     Text('Domestic life was never quite my style'),
     Text('When you smile, you knock me out, I fall apart'),
     Text('And I thought I was so smart'),
   ],
 )
 ```
 
 

 ```dart
 CustomScrollView(
   slivers: <Widget>[
     SliverPadding(
       padding: const EdgeInsets.all(20.0),
       sliver: SliverList(
         delegate: SliverChildListDelegate(
           <Widget>[
             const Text("I'm dedicating every day to you"),
             const Text('Domestic life was never quite my style'),
             const Text('When you smile, you knock me out, I fall apart'),
             const Text('And I thought I was so smart'),
           ],
         ),
       ),
     ),
   ],
 )
 ```
 

 ## Special handling for an empty list

 A common design pattern is to have a custom UI for an empty list. The best
 way to achieve this in Flutter is just conditionally replacing the
 [ListView] at build time with whatever widgets you need to show for the
 empty list state:

 

 Example of simple empty list interface:

 ```dart
 Widget build(BuildContext context) 
 ```
 

 ## Selection of list items

 [ListView] has no built-in notion of a selected item or items. For a small
 example of how a caller might wire up basic item selection, see
 [ListTile.selected].

 
 This example shows a custom implementation of [ListTile] selection in a [ListView] or [GridView].
 Long press any [ListTile] to enable selection mode.

 ** See code in examples/api/lib/widgets/scroll_view/list_view.0.dart **
 

 

 

 See also:

  * [SingleChildScrollView], which is a scrollable widget that has a single
    child.
  * [PageView], which is a scrolling list of child widgets that are each the
    size of the viewport.
  * [GridView], which is a scrollable, 2D array of widgets.
  * [CustomScrollView], which is a scrollable widget that creates custom
    scroll effects using slivers.
  * [ListBody], which arranges its children in a similar manner, but without
    scrolling.
  * [ScrollNotification] and [NotificationListener], which can be used to watch
    the scroll position without using a [ScrollController].
  * The [catalog of layout widgets](https://docs.flutter.dev/ui/widgets/layout).
  * Cookbook: [Use lists](https://docs.flutter.dev/cookbook/lists/basic-list)
  * Cookbook: [Work with long lists](https://docs.flutter.dev/cookbook/lists/long-lists)
  * Cookbook: [Create a horizontal list](https://docs.flutter.dev/cookbook/lists/horizontal-list)
  * Cookbook: [Create lists with different types of items](https://docs.flutter.dev/cookbook/lists/mixed-list)
  * Cookbook: [Implement swipe to dismiss](https://docs.flutter.dev/cookbook/gestures/dismissible)

## Dependencies

- BoxScrollView

## Members

- **itemExtent**: `double?`
  
 If non-null, forces the children to have the given extent in the scroll
 direction.

 Specifying an [itemExtent] is more efficient than letting the children
 determine their own extent because the scrolling machinery can make use of
 the foreknowledge of the children's extent to save work, for example when
 the scroll position changes drastically.

 See also:

  * [SliverFixedExtentList], the sliver used internally when this property
    is provided. It constrains its box children to have a specific given
    extent along the main axis.
  * The [prototypeItem] property, which allows forcing the children's
    extent to be the same as the given widget.
  * The [itemExtentBuilder] property, which allows forcing the children's
    extent to be the value returned by the callback.
 

- **itemExtentBuilder**: `ItemExtentBuilder?`
  
 If non-null, forces the children to have the corresponding extent returned
 by the builder.

 Specifying an [itemExtentBuilder] is more efficient than letting the children
 determine their own extent because the scrolling machinery can make use of
 the foreknowledge of the children's extent to save work, for example when
 the scroll position changes drastically.

 This will be called multiple times during the layout phase of a frame to find
 the items that should be loaded by the lazy loading process.

 Should return null if asked to build an item extent with a greater index than
 exists.

 Unlike [itemExtent] or [prototypeItem], this allows children to have
 different extents.

 See also:

  * [SliverVariedExtentList], the sliver used internally when this property
    is provided. It constrains its box children to have a specific given
    extent along the main axis.
  * The [itemExtent] property, which allows forcing the children's extent
    to a given value.
  * The [prototypeItem] property, which allows forcing the children's
    extent to be the same as the given widget.
 

- **prototypeItem**: `Widget?`
  
 If non-null, forces the children to have the same extent as the given
 widget in the scroll direction.

 Specifying an [prototypeItem] is more efficient than letting the children
 determine their own extent because the scrolling machinery can make use of
 the foreknowledge of the children's extent to save work, for example when
 the scroll position changes drastically.

 See also:

  * [SliverPrototypeExtentList], the sliver used internally when this
    property is provided. It constrains its box children to have the same
    extent as a prototype item along the main axis.
  * The [itemExtent] property, which allows forcing the children's extent
    to a given value.
  * The [itemExtentBuilder] property, which allows forcing the children's
    extent to be the value returned by the callback.
 

- **childrenDelegate**: `SliverChildDelegate`
  A delegate that provides the children for the [ListView].

 The [ListView.custom] constructor lets you specify this delegate
 explicitly. The [ListView] and [ListView.builder] constructors create a
 [childrenDelegate] that wraps the given [List] and [IndexedWidgetBuilder],
 respectively.

## Constructors

### Unnamed Constructor
Creates a scrollable, linear array of widgets from an explicit [List].

 This constructor is appropriate for list views with a small number of
 children because constructing the [List] requires doing work for every
 child that could possibly be displayed in the list view instead of just
 those children that are actually visible.

 Like other widgets in the framework, this widget expects that
 the [children] list will not be mutated after it has been passed in here.
 See the documentation at [SliverChildListDelegate.children] for more details.

 It is usually more efficient to create children on demand using
 [ListView.builder] because it will create the widget children lazily as necessary.

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildListDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildListDelegate.addRepaintBoundaries] property. The
 `addSemanticIndexes` argument corresponds to the
 [SliverChildListDelegate.addSemanticIndexes] property. None
 may be null.

### builder
Creates a scrollable, linear array of widgets that are created on demand.

 This constructor is appropriate for list views with a large (or infinite)
 number of children because the builder is called only for those children
 that are actually visible.

 Providing a non-null `itemCount` improves the ability of the [ListView] to
 estimate the maximum scroll extent.

 The `itemBuilder` callback will be called only with indices greater than
 or equal to zero and less than `itemCount`.

 
 It is legal for `itemBuilder` to return `null`. If it does, the scroll view
 will stop calling `itemBuilder`, even if it has yet to reach `itemCount`.
 By returning `null`, the [ScrollPosition.maxScrollExtent] will not be accurate
 unless the user has reached the end of the [ScrollView]. This can also cause the
 [Scrollbar] to grow as the user scrolls.

 For more accurate [ScrollMetrics], consider specifying `itemCount`.
 

 The `itemBuilder` should always create the widget instances when called.
 Avoid using a builder that returns a previously-constructed widget; if the
 list view's children are created in advance, or all at once when the
 [ListView] itself is created, it is more efficient to use the [ListView]
 constructor. Even more efficient, however, is to create the instances on
 demand using this constructor's `itemBuilder` callback.

 

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildBuilderDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildBuilderDelegate.addRepaintBoundaries] property. The
 `addSemanticIndexes` argument corresponds to the
 [SliverChildBuilderDelegate.addSemanticIndexes] property. None may be
 null.

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
- ``: `dynamic`
### separated
Creates a fixed-length scrollable linear array of list "items" separated
 by list item "separators".

 This constructor is appropriate for list views with a large number of
 item and separator children because the builders are only called for
 the children that are actually visible.

 The `itemBuilder` callback will be called with indices greater than
 or equal to zero and less than `itemCount`.

 Separators only appear between list items: separator 0 appears after item
 0 and the last separator appears before the last item.

 The `separatorBuilder` callback will be called with indices greater than
 or equal to zero and less than `itemCount - 1`.

 The `itemBuilder` and `separatorBuilder` callbacks should always
 actually create widget instances when called. Avoid using a builder that
 returns a previously-constructed widget; if the list view's children are
 created in advance, or all at once when the [ListView] itself is created,
 it is more efficient to use the [ListView] constructor.

 

 

 

 This example shows how to create [ListView] whose [ListTile] list items
 are separated by [Divider]s.

 ```dart
 ListView.separated(
   itemCount: 25,
   separatorBuilder: (BuildContext context, int index) => const ,
   itemBuilder: (BuildContext context, int index) ,
 )
 ```
 

 The `addAutomaticKeepAlives` argument corresponds to the
 [SliverChildBuilderDelegate.addAutomaticKeepAlives] property. The
 `addRepaintBoundaries` argument corresponds to the
 [SliverChildBuilderDelegate.addRepaintBoundaries] property. The
 `addSemanticIndexes` argument corresponds to the
 [SliverChildBuilderDelegate.addSemanticIndexes] property. None may be
 null.

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
### custom
Creates a scrollable, linear array of widgets with a custom child model.

 For example, a custom child model can control the algorithm used to
 estimate the size of children that are not actually visible.

 
 This example shows a [ListView] that uses a custom [SliverChildBuilderDelegate] to support child
 reordering.

 ** See code in examples/api/lib/widgets/scroll_view/list_view.1.dart **
 

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
