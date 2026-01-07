# Overview for `ScrollNotificationObserver`

## Description

Notifies its listeners when a descendant scrolls.

 To add a listener to a [ScrollNotificationObserver] ancestor:

 ```dart
 ScrollNotificationObserver.of(context).addListener(_listener);
 ```

 To remove the listener from a [ScrollNotificationObserver] ancestor:

 ```dart
 ScrollNotificationObserver.of(context).removeListener(_listener);
 ```

 Stateful widgets that share an ancestor [ScrollNotificationObserver] typically
 add a listener in [State.didChangeDependencies] (removing the old one
 if necessary) and remove the listener in their [State.dispose] method.

 Any function with the [ScrollNotificationCallback] signature can act as a
 listener:

 ```dart
 // (e.g. in a stateful widget)
 void _listener(ScrollNotification notification) 
 ```

 This widget is similar to [NotificationListener]. It supports a listener
 list instead of just a single listener and its listeners run
 unconditionally, they do not require a gating boolean return value.

 
 This sample shows a "Scroll to top" button that uses [ScrollNotificationObserver]
 to listen for scroll notifications from [ListView]. The button is only visible
 when the user has scrolled down. When pressed, the button animates the scroll
 position of the [ListView] back to the top.

 ** See code in examples/api/lib/widgets/scroll_notification_observer/scroll_notification_observer.0.dart **
 

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The subtree below this widget.

## Constructors

### Unnamed Constructor
Create a [ScrollNotificationObserver].

