# Overview for `CustomScrollView`

## Description

A [ScrollView] that creates custom scroll effects using [slivers].

 A [CustomScrollView] lets you supply [slivers] directly to create various
 scrolling effects, such as lists, grids, and expanding headers. For example,
 to create a scroll view that contains an expanding app bar followed by a
 list and a grid, use a list of three slivers: [SliverAppBar], [SliverList],
 and [SliverGrid].

 [Widget]s in these [slivers] must produce [RenderSliver] objects.

 To control the initial scroll offset of the scroll view, provide a
 [controller] with its [ScrollController.initialScrollOffset] property set.

 

 

 This sample code shows a scroll view that contains a flexible pinned app
 bar, a grid, and an infinite list.

 ```dart
 CustomScrollView(
   slivers: <Widget>[
     const SliverAppBar(
       pinned: true,
       expandedHeight: 250.0,
       flexibleSpace: FlexibleSpaceBar(
         title: Text('Demo'),
       ),
     ),
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
     ),
     SliverFixedExtentList(
       itemExtent: 50.0,
       delegate: SliverChildBuilderDelegate(
         (BuildContext context, int index) ,
       ),
     ),
   ],
 )
 ```
 

 
 By default, if items are inserted at the "top" of a scrolling container like
 [ListView] or [CustomScrollView], the top item and all of the items below it
 are scrolled downwards. In some applications, it's preferable to have the
 top of the list just grow upwards, without changing the scroll position.
 This example demonstrates how to do that with a [CustomScrollView] with
 two [SliverList] children, and the [CustomScrollView.center] set to the key
 of the bottom SliverList. The top one SliverList will grow upwards, and the
 bottom SliverList will grow downwards.

 ** See code in examples/api/lib/widgets/scroll_view/custom_scroll_view.1.dart **
 

 ## Accessibility

 A [CustomScrollView] can allow Talkback/VoiceOver to make announcements
 to the user when the scroll state changes. For example, on Android an
 announcement might be read as "showing items 1 to 10 of 23". To produce
 this announcement, the scroll view needs three pieces of information:

   * The first visible child index.
   * The total number of children.
   * The total number of visible children.

 The last value can be computed exactly by the framework, however the first
 two must be provided. Most of the higher-level scrollable widgets provide
 this information automatically. For example, [ListView] provides each child
 widget with a semantic index automatically and sets the semantic child
 count to the length of the list.

 To determine visible indexes, the scroll view needs a way to associate the
 generated semantics of each scrollable item with a semantic index. This can
 be done by wrapping the child widgets in an [IndexedSemantics].

 This semantic index is not necessarily the same as the index of the widget in
 the scrollable, because some widgets may not contribute semantic
 information. Consider a [ListView.separated]: every other widget is a
 divider with no semantic information. In this case, only odd numbered
 widgets have a semantic index (equal to the index ~/ 2). Furthermore, the
 total number of children in this example would be half the number of
 widgets. (The [ListView.separated] constructor handles this
 automatically; this is only used here as an example.)

 The total number of visible children can be provided by the constructor
 parameter `semanticChildCount`. This should always be the same as the
 number of widgets wrapped in [IndexedSemantics].

 

 See also:

  * [SliverList], which is a sliver that displays linear list of children.
  * [SliverFixedExtentList], which is a more efficient sliver that displays
    linear list of children that have the same extent along the scroll axis.
  * [SliverGrid], which is a sliver that displays a 2D array of children.
  * [SliverPadding], which is a sliver that adds blank space around another
    sliver.
  * [SliverAppBar], which is a sliver that displays a header that can expand
    and float as the scroll view scrolls.
  * [ScrollNotification] and [NotificationListener], which can be used to watch
    the scroll position without using a [ScrollController].
  * [IndexedSemantics], which allows annotating child lists with an index
    for scroll announcements.

## Dependencies

- ScrollView

## Members

- **slivers**: `List&lt;Widget&gt;`
  The slivers to place inside the viewport.

 ## What is a sliver?

 > _**sliver** (noun): a small, thin piece of something._

 A _sliver_ is a widget backed by a [RenderSliver] subclass, i.e. one that
 implements the constraint/geometry protocol that uses [SliverConstraints]
 and [SliverGeometry].

 This is as distinct from those widgets that are backed by [RenderBox]
 subclasses, which use [BoxConstraints] and [Size] respectively, and are
 known as box widgets. (Widgets like [Container], [Row], and [SizedBox] are
 box widgets.)

 While boxes are much more straightforward (implementing a simple
 two-dimensional Cartesian layout system), slivers are much more powerful,
 and are optimized for one-axis scrolling environments.

 Slivers are hosted in viewports, also known as scroll views, most notably
 [CustomScrollView].

 ## Examples of slivers

 The Flutter framework has many built-in sliver widgets, and custom widgets
 can be created in the same manner. By convention, sliver widgets always
 start with the prefix `Sliver` and are always used in properties called
 `sliver` or `slivers` (as opposed to `child` and `children` which are used
 for box widgets).

 Examples of widgets unique to the sliver world include:

 * [SliverList], a lazily-loading list of variably-sized box widgets.
 * [SliverFixedExtentList], a lazily-loading list of box widgets that are
   all forced to the same height.
 * [SliverPrototypeExtentList], a lazily-loading list of box widgets that
   are all forced to the same height as a given prototype widget.
 * [SliverGrid], a lazily-loading grid of box widgets.
 * [SliverAnimatedList] and [SliverAnimatedGrid], animated variants of
   [SliverList] and [SliverGrid].
 * [SliverFillRemaining], a widget that fills all remaining space in a
   scroll view, and lays a box widget out inside that space.
 * [SliverFillViewport], a widget that lays a list of boxes out, each
   being sized to fit the whole viewport.
 * [SliverPersistentHeader], a sliver that implements pinned and floating
   headers, e.g. used to implement [SliverAppBar].
 * [SliverToBoxAdapter], a sliver that wraps a box widget.

 Examples of sliver variants of common box widgets include:

 * [SliverOpacity], [SliverAnimatedOpacity], and [SliverFadeTransition],
   sliver versions of [Opacity], [AnimatedOpacity], and [FadeTransition].
 * [SliverIgnorePointer], a sliver version of [IgnorePointer].
 * [SliverLayoutBuilder], a sliver version of [LayoutBuilder].
 * [SliverOffstage], a sliver version of [Offstage].
 * [SliverPadding], a sliver version of [Padding].
 * [SliverReorderableList], a sliver version of [ReorderableList]
 * [SliverSafeArea], a sliver version of [SafeArea].
 * [SliverVisibility], a sliver version of [Visibility].

 ## Benefits of slivers over boxes

 The sliver protocol ([SliverConstraints] and [SliverGeometry]) enables
 _scroll effects_, such as floating app bars, widgets that expand and
 shrink during scroll, section headers that are pinned only while the
 section's children are visible, etc.

 

 ## Mixing slivers and boxes

 In general, slivers always wrap box widgets to actually render anything
 (for example, there is no sliver equivalent of [Text] or [Container]);
 the sliver part of the equation is mostly about how these boxes should
 be laid out in a viewport (i.e. when scrolling).

 Typically, the simplest way to combine boxes into a sliver environment is
 to use a [SliverList] (maybe using a [ListView], which is a convenient
 combination of a [CustomScrollView] and a [SliverList]). In rare cases,
 e.g. if a single [Divider] widget is needed between two [SliverGrid]s,
 a [SliverToBoxAdapter] can be used to wrap the box widgets.

 ## Performance considerations

 Because the purpose of scroll views is to, well, scroll, it is common
 for scroll views to contain more contents than are rendered on the screen
 at any particular time.

 To improve the performance of scroll views, the content can be rendered in
 _lazy_ widgets, notably [SliverList] and [SliverGrid] (and their variants,
 such as [SliverFixedExtentList] and [SliverAnimatedGrid]). These widgets
 ensure that only the portion of their child lists that are actually
 visible get built, laid out, and painted.

 The [ListView] and [GridView] widgets provide a convenient way to combine
 a [CustomScrollView] and a [SliverList] or [SliverGrid] (respectively).

## Constructors

### Unnamed Constructor
Creates a [ScrollView] that creates custom scroll effects using slivers.

 See the [ScrollView] constructor for more details on these arguments.

