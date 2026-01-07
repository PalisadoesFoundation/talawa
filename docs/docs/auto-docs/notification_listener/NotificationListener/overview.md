# Overview for `NotificationListener`

## Description

A widget that listens for [Notification]s bubbling up the tree.

 

 Notifications will trigger the [onNotification] callback only if their
 [runtimeType] is a subtype of `T`.

 To dispatch notifications, use the [Notification.dispatch] method.

## Dependencies

- ProxyWidget

## Members

- **onNotification**: `NotificationListenerCallback&lt;T&gt;?`
  Called when a notification of the appropriate type arrives at this
 location in the tree.

 Return true to cancel the notification bubbling. Return false to
 allow the notification to continue to be dispatched to further ancestors.

 Notifications vary in terms of when they are dispatched. There are two
 main possibilities: dispatch between frames, and dispatch during layout.

 For notifications that dispatch during layout, such as those that inherit
 from [LayoutChangedNotification], it is too late to call [State.setState]
 in response to the notification (as layout is currently happening in a
 descendant, by definition, since notifications bubble up the tree). For
 widgets that depend on layout, consider a [LayoutBuilder] instead.

## Constructors

### Unnamed Constructor
Creates a widget that listens for notifications.

