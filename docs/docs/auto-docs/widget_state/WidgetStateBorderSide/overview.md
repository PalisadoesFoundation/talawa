# Overview for `WidgetStateBorderSide`

## Description

Defines a [BorderSide] whose value depends on a set of [WidgetState]s
 which represent the interactive state of a component.

 This class enables existing widget implementations with [BorderSide]
 properties to be extended to also effectively support `WidgetStateProperty&lt;BorderSide&gt;`
 property values. It should only be used for parameters that document support
 for [WidgetStateBorderSide] objects.

 A [WidgetStateBorderSide] can be created in one of the following ways:
   1. Create a subclass of [WidgetStateBorderSide] and implement the abstract `resolve` method.
   2. Use [WidgetStateBorderSide.resolveWith] and pass in a callback that
      will be used to resolve the color in the given states.
   3. Use [WidgetStateBorderSide.fromMap] to assign a value using a [WidgetStateMap].

 
 This example defines a [WidgetStateBorderSide] which resolves to different
 border colors depending on how the user interacts with it.

 ** See code in examples/api/lib/widgets/widget_state/widget_state_border_side.0.dart **
 

 See also:

  * [MaterialStateBorderSide], the Material specific version of
    `WidgetStateBorderSide`.

## Dependencies

- BorderSide, WidgetStateProperty

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### resolveWith
Creates a [WidgetStateBorderSide] from a
 [WidgetPropertyResolver<BorderSide?>] callback function.

 If used as a regular [BorderSide], its behavior matches an empty
 `` constructor.

 Usage:

 ```dart
 ChipTheme(
   data: Theme.of(context).chipTheme.copyWith(
     side: WidgetStateBorderSide.resolveWith((Set&lt;WidgetState&gt; states) ),
   ),
   child: const Chip(
     label: Text('Transceiver'),
   ),
 ),
 ```

 Alternatively:

 ```dart
 Chip(
   label: const Text('Transceiver'),
   side: WidgetStateBorderSide.resolveWith((Set&lt;WidgetState&gt; states) ),
 ),
 ```

#### Parameters

- `callback`: `WidgetPropertyResolver<BorderSide?>`
### fromMap
Creates a [WidgetStateBorderSide] from a [WidgetStateMap].

 
 It should only be used with widgets that document support for
 [WidgetStateBorderSide] objects (throws an error if used as a
 regular [BorderSide].)

 Example:

 ```dart
 const Chip(
   label: Text('Transceiver'),
   side: WidgetStateBorderSide.fromMap(<WidgetStatesConstraint, BorderSide?>),
 ),
 ```

 

#### Parameters

- `map`: `WidgetStateMap<BorderSide?>`
