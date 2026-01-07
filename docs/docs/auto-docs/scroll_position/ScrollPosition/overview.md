# Overview for `ScrollPosition`

## Description

Determines which portion of the content is visible in a scroll view.

 The [pixels] value determines the scroll offset that the scroll view uses to
 select which part of its content to display. As the user scrolls the
 viewport, this value changes, which changes the content that is displayed.

 The [ScrollPosition] applies [physics] to scrolling, and stores the
 [minScrollExtent] and [maxScrollExtent].

 Scrolling is controlled by the current [activity], which is set by
 [beginActivity]. [ScrollPosition] itself does not start any activities.
 Instead, concrete subclasses, such as [ScrollPositionWithSingleContext],
 typically start activities in response to user input or instructions from a
 [ScrollController].

 This object is a [Listenable] that notifies its listeners when [pixels]
 changes.

 
 ### Accessing Scrolling Information

 There are several ways to acquire information about scrolling and
 scrollable widgets, but each provides different types of information about
 the scrolling activity, the position, and the dimensions of the [Viewport].

 A [ScrollController] is a [Listenable]. It notifies its listeners whenever
 any of the attached [ScrollPosition]s notify _their_ listeners, such as when
 scrolling occurs. This is very similar to using a [NotificationListener] of
 type [ScrollNotification] to listen to changes in the scroll position, with
 the difference being that a notification listener will provide information
 about the scrolling activity. A notification listener can further listen to
 specific subclasses of [ScrollNotification], like [UserScrollNotification].

 
 This sample shows the difference between using a [ScrollController] or a
 [NotificationListener] of type [ScrollNotification] to listen to scrolling
 activities. Toggling the [Radio] button switches between the two.
 Using a [ScrollNotification] will provide details about the scrolling
 activity, along with the metrics of the [ScrollPosition], but not the scroll
 position object itself. By listening with a [ScrollController], the position
 object is directly accessible.
 Both of these types of notifications are only triggered by scrolling.

 ** See code in examples/api/lib/widgets/scroll_position/scroll_controller_notification.0.dart **
 

 [ScrollController] does not notify its listeners when the list of
 [ScrollPosition]s attached to the scroll controller changes. To listen to
 the attaching and detaching of scroll positions to the controller, use the
 [ScrollController.onAttach] and [ScrollController.onDetach] methods. This is
 also useful for adding a listener to the
 [ScrollPosition.isScrollingNotifier] when the position is created during the
 build method of the [Scrollable].

 At the time that a scroll position is attached, the [ScrollMetrics], such as
 the [ScrollMetrics.maxScrollExtent], are not yet available. These are not
 determined until the [Scrollable] has finished laying out its contents and
 computing things like the full extent of that content.
 [ScrollPosition.hasContentDimensions] can be used to know when the
 metrics are available, or a [ScrollMetricsNotification] can be used,
 discussed further below.

 
 This sample shows how to apply a listener to the
 [ScrollPosition.isScrollingNotifier] using [ScrollController.onAttach].
 This is used to change the [AppBar]'s color when scrolling is occurring.

 ** See code in examples/api/lib/widgets/scroll_position/scroll_controller_on_attach.0.dart **
 

 #### From a different context

 When needing to access scrolling information from a context that is within
 the scrolling widget itself, use [Scrollable.of] to access the
 [ScrollableState] and the [ScrollableState.position]. This would be the same
 [ScrollPosition] attached to a [ScrollController].

 When needing to access scrolling information from a context that is not an
 ancestor of the scrolling widget, use [ScrollNotificationObserver]. This is
 used by [AppBar] to create the scrolled under effect. Since [Scaffold.appBar]
 is a separate subtree from the [Scaffold.body], scroll notifications would
 not bubble up to the app bar. Use
 [ScrollNotificationObserverState.addListener] to listen to scroll
 notifications happening outside of the current context.

 #### Dimension changes

 Lastly, listening to a [ScrollController] or a [ScrollPosition] will
 _not_ notify when the [ScrollMetrics] of a given scroll position changes,
 such as when the window is resized, changing the dimensions of the
 [Viewport] and the previously mentioned extents of the scrollable. In order
 to listen to changes in scroll metrics, use a [NotificationListener] of type
 [ScrollMetricsNotification]. This type of notification differs from
 [ScrollNotification], as it is not associated with the activity of
 scrolling, but rather the dimensions of the scrollable area, such as the
 window size.

 
 This sample shows how a [ScrollMetricsNotification] is dispatched when
 the `windowSize` is changed. Press the floating action button to increase
 the scrollable window's size.

 ** See code in examples/api/lib/widgets/scroll_position/scroll_metrics_notification.0.dart **
 
 

 ## Subclassing ScrollPosition

 Over time, a [Scrollable] might have many different [ScrollPosition]
 objects. For example, if [Scrollable.physics] changes type, [Scrollable]
 creates a new [ScrollPosition] with the new physics. To transfer state from
 the old instance to the new instance, subclasses implement [absorb]. See
 [absorb] for more details.

 Subclasses also need to call [didUpdateScrollDirection] whenever
 [userScrollDirection] changes values.

 See also:

  * [Scrollable], which uses a [ScrollPosition] to determine which portion of
    its content to display.
  * [ScrollController], which can be used with [ListView], [GridView] and
    other scrollable widgets to control a [ScrollPosition].
  * [ScrollPositionWithSingleContext], which is the most commonly used
    concrete subclass of [ScrollPosition].
  * [ScrollNotification] and [NotificationListener], which can be used to watch
    the scroll position without using a [ScrollController].

## Dependencies

- ViewportOffset, ScrollMetrics

## Members

- **physics**: `ScrollPhysics`
  How the scroll position should respond to user input.

 For example, determines how the widget continues to animate after the
 user stops dragging the scroll view.

- **context**: `ScrollContext`
  Where the scrolling is taking place.

 Typically implemented by [ScrollableState].

- **keepScrollOffset**: `bool`
  Save the current scroll offset with [PageStorage] and restore it if
 this scroll position's scrollable is recreated.

 See also:

  * [ScrollController.keepScrollOffset] and [PageController.keepPage], which
    create scroll positions and initialize this property.

- **debugLabel**: `String?`
  A label that is used in the [toString] output.

 Intended to aid with identifying animation controller instances in debug
 output.

- **_minScrollExtent**: `double?`
- **_maxScrollExtent**: `double?`
- **_impliedVelocity**: `double`
  The additional velocity added for a [forcePixels] change in a single
 frame.

 This value is used by [recommendDeferredLoading] in addition to the
 [activity]'s [ScrollActivity.velocity] to ask the [physics] whether or
 not to defer loading. It accounts for the fact that a [forcePixels] call
 may involve a [ScrollActivity] with 0 velocity, but the scrollable is
 still instantaneously moving from its current position to a potentially
 very far position, and which is of interest to callers of
 [recommendDeferredLoading].

 For example, if a scrollable is currently at 5000 pixels, and we [jumpTo]
 0 to get back to the top of the list, we would have an implied velocity of
 -5000 and an `activity.velocity` of 0. The jump may be going past a
 number of resource intensive widgets which should avoid doing work if the
 position jumps past them.

- **_pixels**: `double?`
- **_viewportDimension**: `double?`
- **_haveDimensions**: `bool`
- **_didChangeViewportDimensionOrReceiveCorrection**: `bool`
- **_pendingDimensions**: `bool`
- **_lastMetrics**: `ScrollMetrics?`
- **_haveScheduledUpdateNotification**: `bool`
- **_lastAxis**: `Axis?`
- **_semanticActions**: `Set&lt;SemanticsAction&gt;?`
- **isScrollingNotifier**: `ValueNotifier&lt;bool&gt;`
  This notifier's value is true if a scroll is underway and false if the scroll
 position is idle.

 Listeners added by stateful widgets should be removed in the widget's
 [State.dispose] method.

 
 This sample shows how you can trigger an auto-scroll, which aligns the last
 partially visible fixed-height list item, by listening to this
 notifier's value. This sort of thing can also be done by listening for
 [ScrollEndNotification]s with a [NotificationListener]. An alternative
 example is provided with [ScrollEndNotification].

 ** See code in examples/api/lib/widgets/scroll_position/is_scrolling_listener.0.dart **
 

- **_activity**: `ScrollActivity?`
## Constructors

### Unnamed Constructor
Creates an object that determines which portion of the content is visible
 in a scroll view.

