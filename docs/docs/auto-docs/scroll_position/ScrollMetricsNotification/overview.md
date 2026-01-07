# Overview for `ScrollMetricsNotification`

## Description

A notification that a scrollable widget's [ScrollMetrics] have changed.

 For example, when the content of a scrollable is altered, making it larger
 or smaller, this notification will be dispatched. Similarly, if the size
 of the window or parent changes, the scrollable can notify of these
 changes in dimensions.

 The above behaviors usually do not trigger [ScrollNotification] events,
 so this is useful for listening to [ScrollMetrics] changes that are not
 caused by the user scrolling.

 
 This sample shows how a [ScrollMetricsNotification] is dispatched when
 the `windowSize` is changed. Press the floating action button to increase
 the scrollable window's size.

 ** See code in examples/api/lib/widgets/scroll_position/scroll_metrics_notification.0.dart **
 

## Dependencies

- Notification, ViewportNotificationMixin

## Members

- **metrics**: `ScrollMetrics`
  Description of a scrollable widget's [ScrollMetrics].

- **context**: `BuildContext`
  The build context of the widget that fired this notification.

 This can be used to find the scrollable widget's render objects to
 determine the size of the viewport, for instance.

## Constructors

### Unnamed Constructor
Creates a notification that the scrollable widget's [ScrollMetrics] have
 changed.

