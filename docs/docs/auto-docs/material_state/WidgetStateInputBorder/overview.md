# Overview for `WidgetStateInputBorder`

## Description

Defines an [InputBorder] that is also a [WidgetStateProperty].

 This class exists to enable widgets with [InputBorder] valued properties
 to also accept [WidgetStateProperty] objects.

 [WidgetStateInputBorder] should only be used with widgets that document
 their support, like [InputDecoration.border].

 A [WidgetStateInputBorder] can be created by:
  1. Creating a class that extends [OutlineInputBorder] or [UnderlineInputBorder]
     and implements [WidgetStateInputBorder]. The class would also need to
     override the [resolve] method.
  2. Using [WidgetStateInputBorder.resolveWith] with a callback that
     resolves the input border in the given states.
  3. Using [WidgetStateInputBorder.fromMap] to assign a border with a [WidgetStateMap].

 
 This example shows how to use [WidgetStateInputBorder] to create
 a [TextField] with an appearance that responds to user interaction.

 ** See code in examples/api/lib/material/widget_state_input_border/widget_state_input_border.0.dart **
 

## Dependencies

- InputBorder, WidgetStateProperty

## Constructors

### resolveWith
Creates a [WidgetStateInputBorder] using a [WidgetPropertyResolver]
 callback.

 This constructor should only be used for fields that support
 [WidgetStateInputBorder], such as [InputDecoration.border]
 (if used as a regular [InputBorder], it acts the same as
 an empty `` constructor).

#### Parameters

- `callback`: `WidgetPropertyResolver&lt;InputBorder&gt;`
### fromMap
Creates a [WidgetStateOutlinedBorder] from a [WidgetStateMap].

 
 It should only be used for fields that support [WidgetStateOutlinedBorder]
 objects, such as [InputDecoration.border]
 (throws an error if used as a regular [OutlinedBorder]).

 

#### Parameters

- `map`: `WidgetStateMap&lt;InputBorder&gt;`
