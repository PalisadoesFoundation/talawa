# Overview for `Notification`

## Description

A notification that can bubble up the widget tree.

 You can determine the type of a notification using the `is` operator to
 check the [runtimeType] of the notification.

 To listen for notifications in a subtree, use a [NotificationListener].

 To send a notification, call [dispatch] on the notification you wish to
 send. The notification will be delivered to any [NotificationListener]
 widgets with the appropriate type parameters that are ancestors of the given
 [BuildContext].

 
 This example shows a [NotificationListener] widget
 that listens for [ScrollNotification] notifications. When a scroll
 event occurs in the [NestedScrollView],
 this widget is notified. The events could be either a
 [ScrollStartNotification]or[ScrollEndNotification].

 ** See code in examples/api/lib/widgets/notification_listener/notification.0.dart **
 

 See also:

  * [ScrollNotification] which describes the notification lifecycle.
  * [ScrollStartNotification] which returns the start position of scrolling.
  * [ScrollEndNotification] which returns the end position of scrolling.
  * [NestedScrollView] which creates a nested scroll view.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

