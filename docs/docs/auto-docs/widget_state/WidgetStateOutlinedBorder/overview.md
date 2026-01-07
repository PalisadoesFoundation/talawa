# Overview for `WidgetStateOutlinedBorder`

## Description

Defines an [OutlinedBorder] whose value depends on a set of [WidgetState]s
 which represent the interactive state of a component.

 A [WidgetStateOutlinedBorder] can be created in one of the following ways:
   1. Create a subclass of [WidgetStateOutlinedBorder] and implement the abstract `resolve` method.
   2. Use [WidgetStateOutlinedBorder.resolveWith] and pass in a callback that
      will be used to resolve the color in the given states.
   3. Use [WidgetStateOutlinedBorder.fromMap] to assign a value using a [WidgetStateMap].

 
 This example defines a subclass of [RoundedRectangleBorder] and an
 implementation of [WidgetStateOutlinedBorder], that resolves to
 [RoundedRectangleBorder] when its widget is selected.

 ** See code in examples/api/lib/material/material_state/material_state_outlined_border.0.dart **
 

 This class should only be used for parameters which are documented to take
 [WidgetStateOutlinedBorder], otherwise only the default state will be used.

 See also:

  * [ShapeBorder] the base class for shape outlines.
  * [MaterialStateOutlinedBorder], the Material specific version of
    `WidgetStateOutlinedBorder`.

## Dependencies

- OutlinedBorder, WidgetStateProperty

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### resolveWith
Creates a [WidgetStateOutlinedBorder] using a [WidgetPropertyResolver]
 callback.

 This constructor should only be used with widgets that support
 [WidgetStateOutlinedBorder], such as [ChipThemeData.shape]
 (if used as a regular [OutlinedBorder], it acts the same as
 an empty `` constructor).

#### Parameters

- `callback`: `WidgetPropertyResolver<OutlinedBorder?>`
### fromMap
Creates a [WidgetStateOutlinedBorder] from a [WidgetStateMap].

 
 It should only be used with widgets that support
 [WidgetStateOutlinedBorder], such as [ChipThemeData.shape]
 (throws an error if used as a regular [OutlinedBorder]).

 Resolves to `null` if no keys match, deferring to the default value
 of the widget or theme.

#### Parameters

- `map`: `WidgetStateMap<OutlinedBorder?>`
