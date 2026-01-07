# Overview for `DraggableScrollableNotification`

## Description

A [Notification] related to the extent, which is the size, and scroll
 offset, which is the position of the child list, of the
 [DraggableScrollableSheet].

 [DraggableScrollableSheet] widgets notify their ancestors when the size of
 the sheet changes. When the extent of the sheet changes via a drag,
 this notification bubbles up through the tree, which means a given
 [NotificationListener] will receive notifications for all descendant
 [DraggableScrollableSheet] widgets. To focus on notifications from the
 nearest [DraggableScrollableSheet] descendant, check that the [depth]
 property of the notification is zero.

 When an extent notification is received by a [NotificationListener], the
 listener will already have completed build and layout, and it is therefore
 too late for that widget to call [State.setState]. Any attempt to adjust the
 build or layout based on an extent notification would result in a layout
 that lagged one frame behind, which is a poor user experience. Extent
 notifications are used primarily to drive animations. The [Scaffold] widget
 listens for extent notifications and responds by driving animations for the
 [FloatingActionButton] as the bottom sheet scrolls up.

## Dependencies

- Notification, ViewportNotificationMixin

## Members

- **extent**: `double`
  The current value of the extent, between [minExtent] and [maxExtent].

- **minExtent**: `double`
  The minimum value of [extent], which is >= 0.

- **maxExtent**: `double`
  The maximum value of [extent].

- **initialExtent**: `double`
  The initially requested value for [extent].

- **context**: `BuildContext`
  The build context of the widget that fired this notification.

 This can be used to find the sheet's render objects to determine the size
 of the viewport, for instance. A listener can only assume this context
 is live when it first gets the notification.

- **shouldCloseOnMinExtent**: `bool`
  Whether the widget that fired this notification, when dragged (or flung)
 to minExtent, should cause its parent sheet to close.

 It is up to parent classes to properly read and handle this value.

## Constructors

### Unnamed Constructor
Creates a notification that the extent of a [DraggableScrollableSheet] has
 changed.

 All parameters are required. The [minExtent] must be >= 0. The [maxExtent]
 must be <= 1.0. The [extent] must be between [minExtent] and [maxExtent].

