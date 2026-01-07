# Overview for `ChangeNotifier`

## Description

A class that can be extended or mixed in that provides a change notification
 API using [VoidCallback] for notifications.

 It is O(1) for adding listeners and O(N) for removing listeners and dispatching
 notifications (where N is the number of listeners).

 ## Using ChangeNotifier subclasses for data models

 A data structure can extend or mix in [ChangeNotifier] to implement the
 [Listenable] interface and thus become usable with widgets that listen for
 changes to [Listenable]s, such as [ListenableBuilder].

 
 The following example implements a simple counter that utilizes a
 [ListenableBuilder] to limit rebuilds to only the [Text] widget containing
 the count. The current count is stored in a [ChangeNotifier] subclass, which
 rebuilds the [ListenableBuilder]'s contents when its value is changed.

 ** See code in examples/api/lib/widgets/transitions/listenable_builder.2.dart **
 

 
 In this case, the [ChangeNotifier] subclass encapsulates a list, and notifies
 the clients any time an item is added to the list. This example only supports
 adding items; as an exercise, consider adding buttons to remove items from
 the list as well.

 ** See code in examples/api/lib/widgets/transitions/listenable_builder.3.dart **
 

 See also:

  * [ValueNotifier], which is a [ChangeNotifier] that wraps a single value.

## Dependencies

- Listenable

## Members

- **_count**: `int`
- **_emptyListeners**: `List<VoidCallback?>`
- **_listeners**: `List<VoidCallback?>`
- **_notificationCallStackDepth**: `int`
- **_reentrantlyRemovedListeners**: `int`
- **_debugDisposed**: `bool`
- **_debugCreationDispatched**: `bool`
  If true, the event [ObjectCreated] for this instance was dispatched to
 [FlutterMemoryAllocations].

 As [ChangeNotifier] is used as mixin, it does not have constructor,
 so we use [addListener] to dispatch the event.

