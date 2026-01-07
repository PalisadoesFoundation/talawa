# Overview for `RestorableValue`

## Description

A [RestorableProperty] that makes the wrapped value accessible to the owning
 [State] object via the [value] getter and setter.

 Whenever a new [value] is set, [didUpdateValue] is called. Subclasses should
 call [notifyListeners] from this method if the new value changes what
 [toPrimitives] returns.

 ## Using a RestorableValue

 
 A [StatefulWidget] that has a restorable [int] property.

 ** See code in examples/api/lib/widgets/restoration_properties/restorable_value.0.dart **
 

 ## Creating a subclass

 
 This example shows how to create a new [RestorableValue] subclass,
 in this case for the [Duration] class.

 ```dart
 class RestorableDuration extends RestorableValue&lt;Duration&gt; 
 ```
 

 See also:

  * [RestorableProperty], which is the super class of this class.
  * [RestorationMixin], to which a [RestorableValue] needs to be registered
    in order to work.
  * [RestorationManager], which provides an overview of how state restoration
    works in Flutter.

## Dependencies

- RestorableProperty

## Members

- **_value**: `T?`
