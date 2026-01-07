# Overview for `RefreshIndicator`

## Description

A widget that supports the Material "swipe to refresh" idiom.

 

 When the child's [Scrollable] descendant overscrolls, an animated circular
 progress indicator is faded into view. When the scroll ends, if the
 indicator has been dragged far enough for it to become completely opaque,
 the [onRefresh] callback is called. The callback is expected to update the
 scrollable's contents and then complete the [Future] it returns. The refresh
 indicator disappears after the callback's [Future] has completed.

 The trigger mode is configured by [RefreshIndicator.triggerMode].

 
 This example shows how [RefreshIndicator] can be triggered in different ways.

 ** See code in examples/api/lib/material/refresh_indicator/refresh_indicator.0.dart **
 

 
 This example shows how to trigger [RefreshIndicator] in a nested scroll view using
 the [notificationPredicate] property.

 ** See code in examples/api/lib/material/refresh_indicator/refresh_indicator.1.dart **
 

 
 This example shows how to use [RefreshIndicator] without the spinner.

 ** See code in examples/api/lib/material/refresh_indicator/refresh_indicator.2.dart **
 

 ## Troubleshooting

 ### Refresh indicator does not show up

 The [RefreshIndicator] will appear if its scrollable descendant can be
 overscrolled, i.e. if the scrollable's content is bigger than its viewport.
 To ensure that the [RefreshIndicator] will always appear, even if the
 scrollable's content fits within its viewport, set the scrollable's
 [Scrollable.physics] property to [AlwaysScrollableScrollPhysics]:

 ```dart
 ListView(
   physics: const ,
   // ...
 )
 ```

 A [RefreshIndicator] can only be used with a vertical scroll view.

 See also:

  * <https://material.io/design/platform-guidance/android-swipe-to-refresh.html>
  * [RefreshIndicatorState], can be used to programmatically show the refresh indicator.
  * [RefreshProgressIndicator], widget used by [RefreshIndicator] to show
    the inner circular progress spinner during refreshes.
  * [CupertinoSliverRefreshControl], an iOS equivalent of the pull-to-refresh pattern.
    Must be used as a sliver inside a [CustomScrollView] instead of wrapping
    around a [ScrollView] because it's a part of the scrollable instead of
    being overlaid on top of it.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 The refresh indicator will be stacked on top of this child. The indicator
 will appear when child's Scrollable descendant is over-scrolled.

 Typically a [ListView] or [CustomScrollView].

- **displacement**: `double`
  The distance from the child's top or bottom [edgeOffset] where
 the refresh indicator will settle. During the drag that exposes the refresh
 indicator, its actual displacement may significantly exceed this value.

 In most cases, [displacement] distance starts counting from the parent's
 edges. However, if [edgeOffset] is larger than zero then the [displacement]
 value is calculated from that offset instead of the parent's edge.

- **edgeOffset**: `double`
  The offset where [RefreshProgressIndicator] starts to appear on drag start.

 Depending whether the indicator is showing on the top or bottom, the value
 of this variable controls how far from the parent's edge the progress
 indicator starts to appear. This may come in handy when, for example, the
 UI contains a top [Widget] which covers the parent's edge where the progress
 indicator would otherwise appear.

 By default, the edge offset is set to 0.

 See also:

  * [displacement], can be used to change the distance from the edge that
    the indicator settles.

- **onRefresh**: `RefreshCallback`
  A function that's called when the user has dragged the refresh indicator
 far enough to demonstrate that they want the app to refresh. The returned
 [Future] must complete when the refresh operation is finished.

- **onStatusChange**: `ValueChanged<RefreshIndicatorStatus?>?`
  Called to get the current status of the [RefreshIndicator] to update the UI as needed.
 This is an optional parameter, used to fine tune app cases.

- **color**: `Color?`
  The progress indicator's foreground color. The current theme's
 [ColorScheme.primary] by default.

- **backgroundColor**: `Color?`
  The progress indicator's background color. The current theme's
 [ThemeData.canvasColor] by default.

- **notificationPredicate**: `ScrollNotificationPredicate`
  A check that specifies whether a [ScrollNotification] should be
 handled by this widget.

 By default, checks whether `notification.depth == 0`. Set it to something
 else for more complicated layouts.

- **semanticsLabel**: `String?`
  

 This will be defaulted to [MaterialLocalizations.refreshIndicatorSemanticLabel]
 if it is null.

- **semanticsValue**: `String?`
  

- **strokeWidth**: `double`
  Defines [strokeWidth] for `RefreshIndicator`.

 By default, the value of [strokeWidth] is 2.0 pixels.

- **_indicatorType**: `_IndicatorType`
- **triggerMode**: `RefreshIndicatorTriggerMode`
  Defines how this [RefreshIndicator] can be triggered when users overscroll.

 The [RefreshIndicator] can be pulled out in two cases,
 1, Keep dragging if the scrollable widget at the edge with zero scroll position
    when the drag starts.
 2, Keep dragging after overscroll occurs if the scrollable widget has
    a non-zero scroll position when the drag starts.

 If this is [RefreshIndicatorTriggerMode.anywhere], both of the cases above can be triggered.

 If this is [RefreshIndicatorTriggerMode.onEdge], only case 1 can be triggered.

 Defaults to [RefreshIndicatorTriggerMode.onEdge].

- **elevation**: `double`
  Defines the elevation of the underlying [RefreshIndicator].

 Defaults to 2.0.

## Constructors

### Unnamed Constructor
Creates a refresh indicator.

 The [onRefresh], [child], and [notificationPredicate] arguments must be
 non-null. The default
 [displacement] is 40.0 logical pixels.

 The [semanticsLabel] is used to specify an accessibility label for this widget.
 If it is null, it will be defaulted to [MaterialLocalizations.refreshIndicatorSemanticLabel].
 An empty string may be passed to avoid having anything read by screen reading software.
 The [semanticsValue] may be used to specify progress on the widget.

### adaptive
Creates an adaptive [RefreshIndicator] based on whether the target
 platform is iOS or macOS, following Material design's
 [Cross-platform guidelines](https://material.io/design/platform-guidance/cross-platform-adaptation.html).

 When the descendant overscrolls, a different spinning progress indicator
 is shown depending on platform. On iOS and macOS,
 [CupertinoActivityIndicator] is shown, but on all other platforms,
 [CircularProgressIndicator] appears.

 If a [CupertinoActivityIndicator] is shown, the following parameters are ignored:
 [backgroundColor], [semanticsLabel], [semanticsValue], [strokeWidth].

 The target platform is based on the current [Theme]: [ThemeData.platform].

 Notably the scrollable widget itself will have slightly different behavior
 from [CupertinoSliverRefreshControl], due to a difference in structure.

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
### noSpinner
Creates a [RefreshIndicator] with no spinner and calls `onRefresh` when
 successfully armed by a drag event.

 Events can be optionally listened by using the `onStatusChange` callback.

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
