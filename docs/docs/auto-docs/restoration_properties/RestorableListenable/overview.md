# Overview for `RestorableListenable`

## Description

A base class for creating a [RestorableProperty] that stores and restores a
 [Listenable].

 This class may be used to implement a [RestorableProperty] for a
 [Listenable], whose information it needs to store in the restoration data
 change whenever the [Listenable] notifies its listeners.

 The [RestorationMixin] this property is registered with will call
 [toPrimitives] whenever the wrapped [Listenable] notifies its listeners to
 update the information that this property has stored in the restoration
 data.

## Dependencies

- RestorableProperty

## Members

- **_value**: `T?`
