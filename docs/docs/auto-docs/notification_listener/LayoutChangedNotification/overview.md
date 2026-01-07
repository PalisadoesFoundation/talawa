# Overview for `LayoutChangedNotification`

## Description

Indicates that the layout of one of the descendants of the object receiving
 this notification has changed in some way, and that therefore any
 assumptions about that layout are no longer valid.

 Useful if, for instance, you're trying to align multiple descendants.

 To listen for notifications in a subtree, use a
 [NotificationListener&lt;LayoutChangedNotification&gt;].

 To send a notification, call [dispatch] on the notification you wish to
 send. The notification will be delivered to any [NotificationListener]
 widgets with the appropriate type parameters that are ancestors of the given
 [BuildContext].

 In the widgets library, only the [SizeChangedLayoutNotifier] class and
 [Scrollable] classes dispatch this notification (specifically, they dispatch
 [SizeChangedLayoutNotification]s and [ScrollNotification]s respectively).
 Transitions, in particular, do not. Changing one's layout in one's build
 function does not cause this notification to be dispatched automatically. If
 an ancestor expects to be notified for any layout change, make sure you
 either only use widgets that never change layout, or that notify their
 ancestors when appropriate, or alternatively, dispatch the notifications
 yourself when appropriate.

 Also, since this notification is sent when the layout is changed, it is only
 useful for paint effects that depend on the layout. If you were to use this
 notification to change the build, for instance, you would always be one
 frame behind, which would look really ugly and laggy.

## Dependencies

- Notification

## Constructors

### Unnamed Constructor
Create a new [LayoutChangedNotification].

