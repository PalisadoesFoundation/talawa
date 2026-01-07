# Overview for `ScrollView`

## Description

A widget that combines a [Scrollable] and a [Viewport] to create an
 interactive scrolling pane of content in one dimension.

 Scrollable widgets consist of three pieces:

  1. A [Scrollable] widget, which listens for various user gestures and
     implements the interaction design for scrolling.
  2. A viewport widget, such as [Viewport] or [ShrinkWrappingViewport], which
     implements the visual design for scrolling by displaying only a portion
     of the widgets inside the scroll view.
  3. One or more slivers, which are widgets that can be composed to created
     various scrolling effects, such as lists, grids, and expanding headers.

 [ScrollView] helps orchestrate these pieces by creating the [Scrollable] and
 the viewport and deferring to its subclass to create the slivers.

 To learn more about slivers, see [CustomScrollView.slivers].

 To control the initial scroll offset of the scroll view, provide a
 [controller] with its [ScrollController.initialScrollOffset] property set.

 
 ## Persisting the scroll position during a session

 Scroll views attempt to persist their scroll position using [PageStorage].
 This can be disabled by setting [ScrollController.keepScrollOffset] to false
 on the [controller]. If it is enabled, using a [PageStorageKey] for the
 [key] of this widget is recommended to help disambiguate different scroll
 views from each other.
 

 See also:

  * [ListView], which is a commonly used [ScrollView] that displays a
    scrolling, linear list of child widgets.
  * [PageView], which is a scrolling list of child widgets that are each the
    size of the viewport.
  * [GridView], which is a [ScrollView] that displays a scrolling, 2D array
    of child widgets.
  * [CustomScrollView], which is a [ScrollView] that creates custom scroll
    effects using slivers.
  * [ScrollNotification] and [NotificationListener], which can be used to watch
    the scroll position without using a [ScrollController].
  * [TwoDimensionalScrollView], which is a similar widget [ScrollView] that
    scrolls in two dimensions.

## Dependencies

- StatelessWidget

## Members

- **scrollDirection**: `Axis`
  
 The [Axis] along which the scroll view's offset increases.

 For the direction in which active scrolling may be occurring, see
 [ScrollDirection].

 Defaults to [Axis.vertical].
 

- **reverse**: `bool`
  
 Whether the scroll view scrolls in the reading direction.

 For example, if the reading direction is left-to-right and
 [scrollDirection] is [Axis.horizontal], then the scroll view scrolls from
 left to right when [reverse] is false and from right to left when
 [reverse] is true.

 Similarly, if [scrollDirection] is [Axis.vertical], then the scroll view
 scrolls from top to bottom when [reverse] is false and from bottom to top
 when [reverse] is true.

 Defaults to false.
 

- **controller**: `ScrollController?`
  
 An object that can be used to control the position to which this scroll
 view is scrolled.

 Must be null if [primary] is true.

 A [ScrollController] serves several purposes. It can be used to control
 the initial scroll position (see [ScrollController.initialScrollOffset]).
 It can be used to control whether the scroll view should automatically
 save and restore its scroll position in the [PageStorage] (see
 [ScrollController.keepScrollOffset]). It can be used to read the current
 scroll position (see [ScrollController.offset]), or change it (see
 [ScrollController.animateTo]).
 

- **primary**: `bool?`
  
 Whether this is the primary scroll view associated with the parent
 [PrimaryScrollController].

 When this is true, the scroll view is scrollable even if it does not have
 sufficient content to actually scroll. Otherwise, by default the user can
 only scroll the view if it has sufficient content. See [physics].

 Also when true, the scroll view is used for default [ScrollAction]s. If a
 ScrollAction is not handled by an otherwise focused part of the application,
 the ScrollAction will be evaluated using this scroll view, for example,
 when executing [Shortcuts] key events like page up and down.

 On iOS, this also identifies the scroll view that will scroll to top in
 response to a tap in the status bar.

 Cannot be true while a [ScrollController] is provided to `controller`,
 only one ScrollController can be associated with a ScrollView.

 Setting to false will explicitly prevent inheriting any
 [PrimaryScrollController].

 Defaults to null. When null, and a controller is not provided,
 [PrimaryScrollController.shouldInherit] is used to decide automatic
 inheritance.

 By default, the [PrimaryScrollController] that is injected by each
 [ModalRoute] is configured to automatically be inherited on
 [TargetPlatformVariant.mobile] for ScrollViews in the [Axis.vertical]
 scroll direction. Adding another to your app will override the
 PrimaryScrollController above it.

 The following video contains more information about scroll controllers,
 the PrimaryScrollController widget, and their impact on your apps:

 

 

- **physics**: `ScrollPhysics?`
  
 How the scroll view should respond to user input.

 For example, determines how the scroll view continues to animate after the
 user stops dragging the scroll view.

 Defaults to matching platform conventions. Furthermore, if [primary] is
 false, then the user cannot scroll if there is insufficient content to
 scroll, while if [primary] is true, they can always attempt to scroll.

 To force the scroll view to always be scrollable even if there is
 insufficient content, as if [primary] was true but without necessarily
 setting it to true, provide an [AlwaysScrollableScrollPhysics] physics
 object, as in:

 ```dart
   physics: const ,
 ```

 To force the scroll view to use the default platform conventions and not
 be scrollable if there is insufficient content, regardless of the value of
 [primary], provide an explicit [ScrollPhysics] object, as in:

 ```dart
   physics: const ,
 ```

 The physics can be changed dynamically (by providing a new object in a
 subsequent build), but new physics will only take effect if the _class_ of
 the provided object changes. Merely constructing a new instance with a
 different configuration is insufficient to cause the physics to be
 reapplied. (This is because the final object used is generated
 dynamically, which can be relatively expensive, and it would be
 inefficient to speculatively create this object each frame to see if the
 physics should be updated.)
 

 If an explicit [ScrollBehavior] is provided to [scrollBehavior], the
 [ScrollPhysics] provided by that behavior will take precedence after
 [physics].

- **scrollBehavior**: `ScrollBehavior?`
  

- **shrinkWrap**: `bool`
  
 Whether the extent of the scroll view in the [scrollDirection] should be
 determined by the contents being viewed.

 If the scroll view does not shrink wrap, then the scroll view will expand
 to the maximum allowed size in the [scrollDirection]. If the scroll view
 has unbounded constraints in the [scrollDirection], then [shrinkWrap] must
 be true.

 Shrink wrapping the content of the scroll view is significantly more
 expensive than expanding to the maximum allowed size because the content
 can expand and contract during scrolling, which means the size of the
 scroll view needs to be recomputed whenever the scroll position changes.

 Defaults to false.

 
 

- **center**: `Key?`
  The first child in the [GrowthDirection.forward] growth direction.

 Children after [center] will be placed in the [AxisDirection] determined
 by [scrollDirection] and [reverse] relative to the [center]. Children
 before [center] will be placed in the opposite of the axis direction
 relative to the [center]. This makes the [center] the inflection point of
 the growth direction.

 The [center] must be the key of one of the slivers built by [buildSlivers].

 Of the built-in subclasses of [ScrollView], only [CustomScrollView]
 supports [center]; for that class, the given key must be the key of one of
 the slivers in the [CustomScrollView.slivers] list.

 Most scroll views by default are ordered [GrowthDirection.forward].
 Changing the default values of [ScrollView.anchor],
 [ScrollView.center], or both, can configure a scroll view for
 [GrowthDirection.reverse].

 
 This sample shows a [CustomScrollView], with [Radio] buttons in the
 [AppBar.bottom] that change the [AxisDirection] to illustrate different
 configurations. The [CustomScrollView.anchor] and [CustomScrollView.center]
 properties are also set to have the 0 scroll offset positioned in the middle
 of the viewport, with [GrowthDirection.forward] and [GrowthDirection.reverse]
 illustrated on either side. The sliver that shares the
 [CustomScrollView.center] key is positioned at the [CustomScrollView.anchor].

 ** See code in examples/api/lib/rendering/growth_direction/growth_direction.0.dart **
 

 See also:

  * [anchor], which controls where the [center] as aligned in the viewport.

- **anchor**: `double`
  
 The relative position of the zero scroll offset.

 For example, if [anchor] is 0.5 and the [AxisDirection] determined by
 [scrollDirection] and [reverse] is [AxisDirection.down] or
 [AxisDirection.up], then the zero scroll offset is vertically centered
 within the viewport. If the [anchor] is 1.0, and the axis direction is
 [AxisDirection.right], then the zero scroll offset is on the left edge of
 the viewport.

 Most scroll views by default are ordered [GrowthDirection.forward].
 Changing the default values of [ScrollView.anchor],
 [ScrollView.center], or both, can configure a scroll view for
 [GrowthDirection.reverse].

 
 This sample shows a [CustomScrollView], with [Radio] buttons in the
 [AppBar.bottom] that change the [AxisDirection] to illustrate different
 configurations. The [CustomScrollView.anchor] and [CustomScrollView.center]
 properties are also set to have the 0 scroll offset positioned in the middle
 of the viewport, with [GrowthDirection.forward] and [GrowthDirection.reverse]
 illustrated on either side. The sliver that shares the
 [CustomScrollView.center] key is positioned at the [CustomScrollView.anchor].

 ** See code in examples/api/lib/rendering/growth_direction/growth_direction.0.dart **
 
 

- **cacheExtent**: `double?`
  

- **semanticChildCount**: `int?`
  The number of children that will contribute semantic information.

 Some subtypes of [ScrollView] can infer this value automatically. For
 example [ListView] will use the number of widgets in the child list,
 while the [ListView.separated] constructor will use half that amount.

 For [CustomScrollView] and other types which do not receive a builder
 or list of widgets, the child count must be explicitly provided. If the
 number is unknown or unbounded this should be left unset or set to null.

 See also:

  * [SemanticsConfiguration.scrollChildCount], the corresponding semantics property.

- **dragStartBehavior**: `DragStartBehavior`
  

- **keyboardDismissBehavior**: `ScrollViewKeyboardDismissBehavior?`
  
 The [ScrollViewKeyboardDismissBehavior] defines how this [ScrollView] will
 dismiss the keyboard automatically.
 

 If [keyboardDismissBehavior] is null then it will fallback to
 [scrollBehavior]. If that is also null, the inherited
 [ScrollBehavior.getKeyboardDismissBehavior] will be used.

- **restorationId**: `String?`
  

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

- **hitTestBehavior**: `HitTestBehavior`
  

 Defaults to [HitTestBehavior.opaque].

## Constructors

### Unnamed Constructor
Creates a widget that scrolls.

 The [ScrollView.primary] argument defaults to true for vertical
 scroll views if no [controller] has been provided. The [controller] argument
 must be null if [primary] is explicitly set to true. If [primary] is true,
 the nearest [PrimaryScrollController] surrounding the widget is attached
 to this scroll view.

 If the [shrinkWrap] argument is true, the [center] argument must be null.

 The [anchor] argument must be in the range zero to one, inclusive.

