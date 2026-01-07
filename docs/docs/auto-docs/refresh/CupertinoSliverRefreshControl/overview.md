# Overview for `CupertinoSliverRefreshControl`

## Description

A sliver widget implementing the iOS-style pull to refresh content control.

 When inserted as the first sliver in a scroll view or behind other slivers
 that still lets the scrollable overscroll in front of this sliver (such as
 the [CupertinoSliverNavigationBar], this widget will:

  * Let the user draw inside the overscrolled area via the passed in [builder].
  * Trigger the provided [onRefresh] function when overscrolled far enough to
    pass [refreshTriggerPullDistance].
  * Continue to hold [refreshIndicatorExtent] amount of space for the [builder]
    to keep drawing inside of as the [Future] returned by [onRefresh] processes.
  * Scroll away once the [onRefresh] [Future] completes.

 The [builder] function will be informed of the current [RefreshIndicatorMode]
 when invoking it, except in the [RefreshIndicatorMode.inactive] state when
 no space is available and nothing needs to be built. The [builder] function
 will otherwise be continuously invoked as the amount of space available
 changes from overscroll, as the sliver scrolls away after the [onRefresh]
 task is done, etc.

 Only one refresh can be triggered until the previous refresh has completed
 and the indicator sliver has retracted at least 90% of the way back.

 Can only be used in downward-scrolling vertical lists that overscrolls. In
 other words, refreshes can't be triggered with [Scrollable]s using
 [ClampingScrollPhysics] which is the default on Android. To allow overscroll
 on Android, use an overscrolling physics such as [BouncingScrollPhysics].
 This can be done via:

  * Providing a [BouncingScrollPhysics] (possibly in combination with a
    [AlwaysScrollableScrollPhysics]) while constructing the scrollable.
  * By inserting a [ScrollConfiguration] with [BouncingScrollPhysics] above
    the scrollable.
  * By using [CupertinoApp], which always uses a [ScrollConfiguration]
    with [BouncingScrollPhysics] regardless of platform.

 In a typical application, this sliver should be inserted between the app bar
 sliver such as [CupertinoSliverNavigationBar] and your main scrollable
 content's sliver.

 
 When the user scrolls past [refreshTriggerPullDistance],
 this sample shows the default iOS pull to refresh indicator for 1 second and
 adds a new item to the top of the list view.

 ** See code in examples/api/lib/cupertino/refresh/cupertino_sliver_refresh_control.0.dart **
 

 See also:

  * [CustomScrollView], a typical sliver holding scroll view this control
    should go into.
  * <https://developer.apple.com/ios/human-interface-guidelines/controls/refresh-content-controls/>
  * [RefreshIndicator], a Material Design version of the pull-to-refresh
    paradigm. This widget works differently than [RefreshIndicator] because
    instead of being an overlay on top of the scrollable, the
    [CupertinoSliverRefreshControl] is part of the scrollable and actively occupies
    scrollable space.

## Dependencies

- StatefulWidget

## Members

- **refreshTriggerPullDistance**: `double`
  The amount of overscroll the scrollable must be dragged to trigger a reload.

 Must be larger than zero and larger than [refreshIndicatorExtent].
 Defaults to 100 pixels when not specified.

 When overscrolled past this distance, [onRefresh] will be called if not
 null and the [builder] will build in the [RefreshIndicatorMode.armed] state.

- **refreshIndicatorExtent**: `double`
  The amount of space the refresh indicator sliver will keep holding while
 [onRefresh]'s [Future] is still running.

 Must be a positive number, but can be zero, in which case the sliver will
 start retracting back to zero as soon as the refresh is started. Defaults
 to 60 pixels when not specified.

 Must be smaller than [refreshTriggerPullDistance], since the sliver
 shouldn't grow further after triggering the refresh.

- **builder**: `RefreshControlIndicatorBuilder?`
  A builder that's called as this sliver's size changes, and as the state
 changes.

 Can be set to null, in which case nothing will be drawn in the overscrolled
 space.

 Will not be called when the available space is zero such as before any
 overscroll.

- **onRefresh**: `RefreshCallback?`
  Callback invoked when pulled by [refreshTriggerPullDistance].

 If provided, must return a [Future] which will keep the indicator in the
 [RefreshIndicatorMode.refresh] state until the [Future] completes.

 Can be null, in which case a single frame of [RefreshIndicatorMode.armed]
 state will be drawn before going immediately to the [RefreshIndicatorMode.done]
 where the sliver will start retracting.

- **_defaultRefreshTriggerPullDistance**: `double`
- **_defaultRefreshIndicatorExtent**: `double`
## Constructors

### Unnamed Constructor
Create a new refresh control for inserting into a list of slivers.

 The [refreshTriggerPullDistance] and [refreshIndicatorExtent] arguments
 must be greater than or equal to 0.

 The [builder] argument may be null, in which case no indicator UI will be
 shown but the [onRefresh] will still be invoked. By default, [builder]
 shows a [CupertinoActivityIndicator].

 The [onRefresh] argument will be called when pulled far enough to trigger
 a refresh.

