# Overview for `KeepAliveNotification`

## Description

Indicates that the subtree through which this notification bubbles must be
 kept alive even if it would normally be discarded as an optimization.

 For example, a focused text field might fire this notification to indicate
 that it should not be disposed even if the user scrolls the field off
 screen.

 Each [KeepAliveNotification] is configured with a [handle] that consists of
 a [Listenable] that is triggered when the subtree no longer needs to be kept
 alive.

 The [handle] should be triggered any time the sending widget is removed from
 the tree (in [State.deactivate]). If the widget is then rebuilt and still
 needs to be kept alive, it should immediately send a new notification
 (possible with the very same [Listenable]) during build.

 This notification is listened to by the [AutomaticKeepAlive] widget, which
 is added to the tree automatically by [SliverList] (and [ListView]) and
 [SliverGrid] (and [GridView]) widgets.

 Failure to trigger the [handle] in the manner described above will likely
 cause the [AutomaticKeepAlive] to lose track of whether the widget should be
 kept alive or not, leading to memory leaks or lost data. For example, if the
 widget that requested keepalive is removed from the subtree but doesn't
 trigger its [Listenable] on the way out, then the subtree will continue to
 be kept alive until the list itself is disposed. Similarly, if the
 [Listenable] is triggered while the widget needs to be kept alive, but a new
 [KeepAliveNotification] is not immediately sent, then the widget risks being
 garbage collected while it wants to be kept alive.

 It is an error to use the same [handle] in two [KeepAliveNotification]s
 within the same [AutomaticKeepAlive] without triggering that [handle] before
 the second notification is sent.

 For a more convenient way to interact with [AutomaticKeepAlive] widgets,
 consider using [AutomaticKeepAliveClientMixin], which uses
 [KeepAliveNotification] internally.

## Dependencies

- Notification

## Members

- **handle**: `Listenable`
  A [Listenable] that will inform its clients when the widget that fired the
 notification no longer needs to be kept alive.

 The [Listenable] should be triggered any time the sending widget is
 removed from the tree (in [State.deactivate]). If the widget is then
 rebuilt and still needs to be kept alive, it should immediately send a new
 notification (possible with the very same [Listenable]) during build.

 See also:

  * [KeepAliveHandle], a convenience class for use with this property.

## Constructors

### Unnamed Constructor
Creates a notification to indicate that a subtree must be kept alive.

