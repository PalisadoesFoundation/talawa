# Overview for `RestorableNum`

## Description

A [RestorableProperty] that knows how to store and restore a [num].

 
 The current [value] of this property is stored in the restoration data.
 During state restoration the property is restored to the value it had when
 the restoration data it is getting restored from was collected.

 If no restoration data is available, [value] is initialized to the
 `defaultValue` given in the constructor.
 

 Instead of using the more generic [RestorableNum] directly, consider using
 one of the more specific subclasses (e.g. [RestorableDouble] to store a
 [double] and [RestorableInt] to store an [int]).

 See also:

  * [RestorableNumN] for the nullable version of this class.

## Dependencies

- _RestorablePrimitiveValue

## Constructors

### Unnamed Constructor
Creates a [RestorableNum].

 
 If no restoration data is available to restore the value in this property
 from, the property will be initialized with the provided `defaultValue`.
 

