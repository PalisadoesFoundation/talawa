# Overview for `Listenable`

## Description

An object that maintains a list of listeners.

 The listeners are typically used to notify clients that the object has been
 updated.

 There are two variants of this interface:

  * [ValueListenable], an interface that augments the [Listenable] interface
    with the concept of a _current value_.

  * [Animation], an interface that augments the [ValueListenable] interface
    to add the concept of direction (forward or reverse).

 Many classes in the Flutter API use or implement these interfaces. The
 following subclasses are especially relevant:

  * [ChangeNotifier], which can be subclassed or mixed in to create objects
    that implement the [Listenable] interface.

  * [ValueNotifier], which implements the [ValueListenable] interface with
    a mutable value that triggers the notifications when modified.

 The terms "notify clients", "send notifications", "trigger notifications",
 and "fire notifications" are used interchangeably.

 See also:

  * [AnimatedBuilder], a widget that uses a builder callback to rebuild
    whenever a given [Listenable] triggers its notifications. This widget is
    commonly used with [Animation] subclasses, hence its name, but is by no
    means limited to animations, as it can be used with any [Listenable]. It
    is a subclass of [AnimatedWidget], which can be used to create widgets
    that are driven from a [Listenable].
  * [ValueListenableBuilder], a widget that uses a builder callback to
    rebuild whenever a [ValueListenable] object triggers its notifications,
    providing the builder with the value of the object.
  * [InheritedNotifier], an abstract superclass for widgets that use a
    [Listenable]'s notifications to trigger rebuilds in descendant widgets
    that declare a dependency on them, using the [InheritedWidget] mechanism.
  * [Listenable.merge], which creates a [Listenable] that triggers
    notifications whenever any of a list of other [Listenable]s trigger their
    notifications.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### merge
Return a [Listenable] that triggers when any of the given [Listenable]s
 themselves trigger.

 Once the factory is called, items must not be added or removed from the iterable.
 Doing so will lead to memory leaks or exceptions.

 The iterable may contain nulls; they are ignored.

#### Parameters

- `listenables`: `Iterable<Listenable?>`
