# Overview for `WidgetStateMapper`

## Description

Uses a [WidgetStateMap] to resolve to a single value of type `T` based on
 the current set of Widget states.

 

 Classes that extend [WidgetStateMapper] can implement any other interface,
 but should only be used for fields that document their support for
 [WidgetStateProperty] objects.

 The only exceptions are classes such as [double] that are marked as
 `base` or `final`, since they can't be implemented—a [double] property
 can't be set up to also accept [WidgetStateProperty] objects
 and would need to pick one or the other.

 For example, a [WidgetStateColor.fromMap] object can be passed anywhere that
 accepts either a [Color] or a [WidgetStateProperty] object, but attempting
 to access a [Color] field (such as [Color.value]) on the mapper object
 throws a [FlutterError].

## Dependencies

- Diagnosticable, WidgetStateProperty

## Members

- **_map**: `WidgetStateMap&lt;T&gt;`
## Constructors

### Unnamed Constructor
Creates a [WidgetStateProperty] object that can resolve
 to a value of type [T] using the provided [map].

