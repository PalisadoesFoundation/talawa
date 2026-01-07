# Overview for `PageView`

## Description

A scrollable list that works page by page.

 Each child of a page view is forced to be the same size as the viewport.

 You can use a [PageController] to control which page is visible in the view.
 In addition to being able to control the pixel offset of the content inside
 the [PageView], a [PageController] also lets you control the offset in terms
 of pages, which are increments of the viewport size.

 The [PageController] can also be used to control the
 [PageController.initialPage], which determines which page is shown when the
 [PageView] is first constructed, and the [PageController.viewportFraction],
 which determines the size of the pages as a fraction of the viewport size.

 

 
 Here is an example of [PageView]. It creates a centered [Text] in each of the three pages
 which scroll horizontally.

 ** See code in examples/api/lib/widgets/page_view/page_view.0.dart **
 

 ## Persisting the scroll position during a session

 Scroll views attempt to persist their scroll position using [PageStorage].
 For a [PageView], this can be disabled by setting [PageController.keepPage]
 to false on the [controller]. If it is enabled, using a [PageStorageKey] for
 the [key] of this widget is recommended to help disambiguate different
 scroll views from each other.

 See also:

  * [PageController], which controls which page is visible in the view.
  * [SingleChildScrollView], when you need to make a single child scrollable.
  * [ListView], for a scrollable list of boxes.
  * [GridView], for a scrollable grid of boxes.
  * [ScrollNotification] and [NotificationListener], which can be used to watch
    the scroll position without using a [ScrollController].

## Dependencies

- StatefulWidget

## Members

- **allowImplicitScrolling**: `bool`
  Controls whether the widget's pages will respond to
 [RenderObject.showOnScreen], which will allow for implicit accessibility
 scrolling.

 With this flag set to false, when accessibility focus reaches the end of
 the current page and the user attempts to move it to the next element, the
 focus will traverse to the next widget outside of the page view.

 With this flag set to true, when accessibility focus reaches the end of
 the current page and user attempts to move it to the next element, focus
 will traverse to the next page in the page view.

- **restorationId**: `String?`
  

- **scrollDirection**: `Axis`
  The [Axis] along which the scroll view's offset increases with each page.

 For the direction in which active scrolling may be occurring, see
 [ScrollDirection].

 Defaults to [Axis.horizontal].

- **reverse**: `bool`
  Whether the page view scrolls in the reading direction.

 For example, if the reading direction is left-to-right and
 [scrollDirection] is [Axis.horizontal], then the page view scrolls from
 left to right when [reverse] is false and from right to left when
 [reverse] is true.

 Similarly, if [scrollDirection] is [Axis.vertical], then the page view
 scrolls from top to bottom when [reverse] is false and from bottom to top
 when [reverse] is true.

 Defaults to false.

- **controller**: `PageController?`
  An object that can be used to control the position to which this page
 view is scrolled.

- **physics**: `ScrollPhysics?`
  How the page view should respond to user input.

 For example, determines how the page view continues to animate after the
 user stops dragging the page view.

 The physics are modified to snap to page boundaries using
 [PageScrollPhysics] prior to being used.

 If an explicit [ScrollBehavior] is provided to [scrollBehavior], the
 [ScrollPhysics] provided by that behavior will take precedence after
 [physics].

 Defaults to matching platform conventions.

- **pageSnapping**: `bool`
  Set to false to disable page snapping, useful for custom scroll behavior.

 If the [padEnds] is false and [PageController.viewportFraction] < 1.0,
 the page will snap to the beginning of the viewport; otherwise, the page
 will snap to the center of the viewport.

- **onPageChanged**: `ValueChanged&lt;int&gt;?`
  Called whenever the page in the center of the viewport changes.

- **childrenDelegate**: `SliverChildDelegate`
  A delegate that provides the children for the [PageView].

 The [PageView.custom] constructor lets you specify this delegate
 explicitly. The [PageView] and [PageView.builder] constructors create a
 [childrenDelegate] that wraps the given [List] and [IndexedWidgetBuilder],
 respectively.

- **dragStartBehavior**: `DragStartBehavior`
  

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

- **hitTestBehavior**: `HitTestBehavior`
  

 Defaults to [HitTestBehavior.opaque].

- **scrollBehavior**: `ScrollBehavior?`
  

 The [ScrollBehavior] of the inherited [ScrollConfiguration] will be
 modified by default to not apply a [Scrollbar].

- **padEnds**: `bool`
  Whether to add padding to both ends of the list.

 If this is set to true and [PageController.viewportFraction] < 1.0, padding will be added
 such that the first and last child slivers will be in the center of
 the viewport when scrolled all the way to the start or end, respectively.

 If [PageController.viewportFraction] >= 1.0, this property has no effect.

 This property defaults to true.

## Constructors

### Unnamed Constructor
Creates a scrollable list that works page by page from an explicit [List]
 of widgets.

 This constructor is appropriate for page views with a small number of
 children because constructing the [List] requires doing work for every
 child that could possibly be displayed in the page view, instead of just
 those children that are actually visible.

 Like other widgets in the framework, this widget expects that
 the [children] list will not be mutated after it has been passed in here.
 See the documentation at [SliverChildListDelegate.children] for more details.

 
 If [allowImplicitScrolling] is true, the [PageView] will participate in
 accessibility scrolling more like a [ListView], where implicit scroll
 actions will move to the next page rather than into the contents of the
 [PageView].
 

### builder
Creates a scrollable list that works page by page using widgets that are
 created on demand.

 This constructor is appropriate for page views with a large (or infinite)
 number of children because the builder is called only for those children
 that are actually visible.

 Providing a non-null [itemCount] lets the [PageView] compute the maximum
 scroll extent.

 [itemBuilder] will be called only with indices greater than or equal to
 zero and less than [itemCount].

 

 
 The [findChildIndexCallback] corresponds to the
 [SliverChildBuilderDelegate.findChildIndexCallback] property. If null,
 a child widget may not map to its existing [RenderObject] when the order
 of children returned from the children builder changes.
 This may result in state-loss. This callback needs to be implemented if
 the order of the children may change at a later time.
 

 

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
### custom
Creates a scrollable list that works page by page with a custom child
 model.

 
 This example shows a [PageView] that uses a custom [SliverChildBuilderDelegate] to support child
 reordering.

 ** See code in examples/api/lib/widgets/page_view/page_view.1.dart **
 

 

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
