# Overview for `RestorableChangeNotifier`

## Description

A base class for creating a [RestorableProperty] that stores and restores a
 [ChangeNotifier].

 This class may be used to implement a [RestorableProperty] for a
 [ChangeNotifier], whose information it needs to store in the restoration
 data change whenever the [ChangeNotifier] notifies its listeners.

 The [RestorationMixin] this property is registered with will call
 [toPrimitives] whenever the wrapped [ChangeNotifier] notifies its listeners
 to update the information that this property has stored in the restoration
 data.

 Furthermore, the property will dispose the wrapped [ChangeNotifier] when
 either the property itself is disposed or its value is replaced with another
 [ChangeNotifier] instance.

## Dependencies

- RestorableListenable

