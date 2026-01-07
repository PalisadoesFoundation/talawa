# Overview for `NestedScrollView`

## Description

A scrolling view inside of which can be nested other scrolling views, with
 their scroll positions being intrinsically linked.

 The most common use case for this widget is a scrollable view with a
 flexible [SliverAppBar] containing a [TabBar] in the header (built by
 [headerSliverBuilder]), and with a [TabBarView] in the [body], such that the
 scrollable view's contents vary based on which tab is visible.

 ## Motivation

 In a normal [ScrollView], there is one set of slivers (the components of the
 scrolling view). If one of those slivers hosted a [TabBarView] which scrolls
 in the opposite direction (e.g. allowing the user to swipe horizontally
 between the pages represented by the tabs, while the list scrolls
 vertically), then any list inside that [TabBarView] would not interact with
 the outer [ScrollView]. For example, flinging the inner list to scroll to
 the top would not cause a collapsed [SliverAppBar] in the outer [ScrollView]
 to expand.

 [NestedScrollView] solves this problem by providing custom
 [ScrollController]s for the outer [ScrollView] and the inner [ScrollView]s
 (those inside the [TabBarView], hooking them together so that they appear,
 to the user, as one coherent scroll view.

 
 This example shows a [NestedScrollView] whose header is the combination of a
 [TabBar] in a [SliverAppBar] and whose body is a [TabBarView]. It uses a
 [SliverOverlapAbsorber]/[SliverOverlapInjector] pair to make the inner lists
 align correctly, and it uses [SafeArea] to avoid any horizontal disturbances
 (e.g. the "notch" on iOS when the phone is horizontal). In addition,
 [PageStorageKey]s are used to remember the scroll position of each tab's
 list.

 ** See code in examples/api/lib/widgets/nested_scroll_view/nested_scroll_view.0.dart **
 

 ## [SliverAppBar]s with [NestedScrollView]s

 Using a [SliverAppBar] in the outer scroll view, or [headerSliverBuilder],
 of a [NestedScrollView] may require special configurations in order to work
 as it would if the outer and inner were one single scroll view, like a
 [CustomScrollView].

 ### Pinned [SliverAppBar]s

 A pinned [SliverAppBar] works in a [NestedScrollView] exactly as it would in
 another scroll view, like [CustomScrollView]. When using
 [SliverAppBar.pinned], the app bar remains visible at the top of the scroll
 view. The app bar can still expand and contract as the user scrolls, but it
 will remain visible rather than being scrolled out of view.

 This works naturally in a [NestedScrollView], as the pinned [SliverAppBar]
 is not expected to move in or out of the visible portion of the viewport.
 As the inner or outer [Scrollable]s are moved, the app bar persists as
 expected.

 If the app bar is floating, pinned, and using an expanded height, follow the
 floating convention laid out below.

 ### Floating [SliverAppBar]s

 When placed in the outer scrollable, or the [headerSliverBuilder],
 a [SliverAppBar] that floats, using [SliverAppBar.floating] will not be
 triggered to float over the inner scroll view, or [body], automatically.

 This is because a floating app bar uses the scroll offset of its own
 [Scrollable] to dictate the floating action. Being two separate inner and
 outer [Scrollable]s, a [SliverAppBar] in the outer header is not aware of
 changes in the scroll offset of the inner body.

 In order to float the outer, use [NestedScrollView.floatHeaderSlivers]. When
 set to true, the nested scrolling coordinator will prioritize floating in
 the header slivers before applying the remaining drag to the body.

 Furthermore, the `floatHeaderSlivers` flag should also be used when using an
 app bar that is floating, pinned, and has an expanded height. In this
 configuration, the flexible space of the app bar will open and collapse,
 while the primary portion of the app bar remains pinned.

 
 This simple example shows a [NestedScrollView] whose header contains a
 floating [SliverAppBar]. By using the [floatHeaderSlivers] property, the
 floating behavior is coordinated between the outer and inner [Scrollable]s,
 so it behaves as it would in a single scrollable.

 ** See code in examples/api/lib/widgets/nested_scroll_view/nested_scroll_view.1.dart **
 

 ### Snapping [SliverAppBar]s

 Floating [SliverAppBar]s also have the option to perform a snapping animation.
 If [SliverAppBar.snap] is true, then a scroll that exposes the floating app
 bar will trigger an animation that slides the entire app bar into view.
 Similarly if a scroll dismisses the app bar, the animation will slide the
 app bar completely out of view.

 It is possible with a [NestedScrollView] to perform just the snapping
 animation without floating the app bar in and out. By not using the
 [NestedScrollView.floatHeaderSlivers], the app bar will snap in and out
 without floating.

 The [SliverAppBar.snap] animation should be used in conjunction with the
 [SliverOverlapAbsorber] and  [SliverOverlapInjector] widgets when
 implemented in a [NestedScrollView]. These widgets take any overlapping
 behavior of the [SliverAppBar] in the header and redirect it to the
 [SliverOverlapInjector] in the body. If it is missing, then it is possible
 for the nested "inner" scroll view below to end up under the [SliverAppBar]
 even when the inner scroll view thinks it has not been scrolled.

 
 This simple example shows a [NestedScrollView] whose header contains a
 snapping, floating [SliverAppBar]. _Without_ setting any additional flags,
 e.g [NestedScrollView.floatHeaderSlivers], the [SliverAppBar] will animate
 in and out without floating. The [SliverOverlapAbsorber] and
 [SliverOverlapInjector] maintain the proper alignment between the two
 separate scroll views.

 ** See code in examples/api/lib/widgets/nested_scroll_view/nested_scroll_view.2.dart **
 

 ### Snapping and Floating [SliverAppBar]s

 Currently, [NestedScrollView] does not support simultaneously floating and
 snapping the outer scrollable, e.g. when using [SliverAppBar.floating] &
 [SliverAppBar.snap] at the same time.

 ### Stretching [SliverAppBar]s

 Currently, [NestedScrollView] does not support stretching the outer
 scrollable, e.g. when using [SliverAppBar.stretch].

 See also:

  * [SliverAppBar], for examples on different configurations like floating,
    pinned and snap behaviors.
  * [SliverOverlapAbsorber], a sliver that wraps another, forcing its layout
    extent to be treated as overlap.
  * [SliverOverlapInjector], a sliver that has a sliver geometry based on
    the values stored in a [SliverOverlapAbsorberHandle].

## Dependencies

- StatefulWidget

## Members

- **controller**: `ScrollController?`
  An object that can be used to control the position to which the outer
 scroll view is scrolled.

- **scrollDirection**: `Axis`
  

 This property only applies to the [Axis] of the outer scroll view,
 composed of the slivers returned from [headerSliverBuilder]. Since the
 inner scroll view is not directly configured by the [NestedScrollView],
 for the axes to match, configure the scroll view of the [body] the same
 way if they are expected to scroll in the same orientation. This allows
 for flexible configurations of the NestedScrollView.

- **reverse**: `bool`
  Whether the scroll view scrolls in the reading direction.

 For example, if the reading direction is left-to-right and
 [scrollDirection] is [Axis.horizontal], then the scroll view scrolls from
 left to right when [reverse] is false and from right to left when
 [reverse] is true.

 Similarly, if [scrollDirection] is [Axis.vertical], then the scroll view
 scrolls from top to bottom when [reverse] is false and from bottom to top
 when [reverse] is true.

 This property only applies to the outer scroll view, composed of the
 slivers returned from [headerSliverBuilder]. Since the inner scroll view
 is not directly configured by the [NestedScrollView]. For both to scroll
 in reverse, configure the scroll view of the [body] the same way if they
 are expected to match. This allows for flexible configurations of the
 NestedScrollView.

 Defaults to false.

- **physics**: `ScrollPhysics?`
  How the scroll view should respond to user input.

 For example, determines how the scroll view continues to animate after the
 user stops dragging the scroll view (providing a custom implementation of
 [ScrollPhysics.createBallisticSimulation] allows this particular aspect of
 the physics to be overridden).

 If an explicit [ScrollBehavior] is provided to [scrollBehavior], the
 [ScrollPhysics] provided by that behavior will take precedence after
 [physics].

 Defaults to matching platform conventions.

 The [ScrollPhysics.applyBoundaryConditions] implementation of the provided
 object should not allow scrolling outside the scroll extent range
 described by the [ScrollMetrics.minScrollExtent] and
 [ScrollMetrics.maxScrollExtent] properties passed to that method. If that
 invariant is not maintained, the nested scroll view may respond to user
 scrolling erratically.

 This property only applies to the outer scroll view, composed of the
 slivers returned from [headerSliverBuilder]. Since the inner scroll view
 is not directly configured by the [NestedScrollView]. For both to scroll
 with the same [ScrollPhysics], configure the scroll view of the [body]
 the same way if they are expected to match, or use a [ScrollBehavior] as
 an ancestor so both the inner and outer scroll views inherit the same
 [ScrollPhysics]. This allows for flexible configurations of the
 NestedScrollView.

 The [ScrollPhysics] also determine whether or not the [NestedScrollView]
 can accept input from the user to change the scroll offset. For example,
 [NeverScrollableScrollPhysics] typically will not allow the user to drag a
 scroll view, but in this case, if one of the two scroll views can be
 dragged, then dragging will be allowed. Configuring both scroll views with
 [NeverScrollableScrollPhysics] will disallow dragging in this case.

- **headerSliverBuilder**: `NestedScrollViewHeaderSliversBuilder`
  A builder for any widgets that are to precede the inner scroll views (as
 given by [body]).

 Typically this is used to create a [SliverAppBar] with a [TabBar].

- **body**: `Widget`
  The widget to show inside the [NestedScrollView].

 Typically this will be [TabBarView].

 The [body] is built in a context that provides a [PrimaryScrollController]
 that interacts with the [NestedScrollView]'s scroll controller. Any
 [ListView] or other [Scrollable]-based widget inside the [body] that is
 intended to scroll with the [NestedScrollView] should therefore not be
 given an explicit [ScrollController], instead allowing it to default to
 the [PrimaryScrollController] provided by the [NestedScrollView].

- **dragStartBehavior**: `DragStartBehavior`
  

- **floatHeaderSlivers**: `bool`
  Whether or not the [NestedScrollView]'s coordinator should prioritize the
 outer scrollable over the inner when scrolling back.

 This is useful for an outer scrollable containing a [SliverAppBar] that
 is expected to float.

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

- **hitTestBehavior**: `HitTestBehavior`
  

 Defaults to [HitTestBehavior.opaque].

- **restorationId**: `String?`
  

- **scrollBehavior**: `ScrollBehavior?`
  

 The [ScrollBehavior] of the inherited [ScrollConfiguration] will be
 modified by default to not apply a [Scrollbar]. This is because the
 NestedScrollView cannot assume the configuration of the outer and inner
 [Scrollable] widgets, particularly whether to treat them as one scrollable,
 or separate and desirous of unique behaviors.

## Constructors

### Unnamed Constructor
Creates a nested scroll view.

 The [reverse], [headerSliverBuilder], and [body] arguments must not be
 null.

