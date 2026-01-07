# Overview for `WidgetStateProperty`

## Description

Interface for classes that [resolve] to a value of type `T` based
 on a widget's interactive "state", which is defined as a set
 of [WidgetState]s.

 Widget state properties represent values that depend on a widget's "state".
 The state is encoded as a set of [WidgetState] values, like
 [WidgetState.focused], [WidgetState.hovered], [WidgetState.pressed]. For
 example the [InkWell.overlayColor] defines the color that fills the ink well
 when it's pressed (the "splash color"), focused, or hovered. The [InkWell]
 uses the overlay color's [resolve] method to compute the color for the
 ink well's current state.

 [ButtonStyle], which is used to configure the appearance of
 buttons like [TextButton], [ElevatedButton], and [OutlinedButton],
 has many material state properties. The button widgets keep track
 of their current material state and [resolve] the button style's
 material state properties when their value is needed.

 
 This example shows how the default text and icon color
 (the "foreground color") of a [TextButton] can be overridden with a
 [WidgetStateProperty]. In this example, the button's text color will be
 colored differently depending on whether the button is pressed, hovered,
 or focused.

 ** See code in examples/api/lib/widgets/widget_state/widget_state_property.0.dart **
 

 ## Performance Consideration

 In order for constructed [WidgetStateProperty] objects to be recognized as
 equivalent, they need to either be `const` objects, or have overrides for
 [operator==] and [hashCode].

 This comes into play when, for instance, two [ThemeData] objects are being
 compared for equality.

 For a concrete `WidgetStateProperty` object that supports stable
 equality checks, consider using [WidgetStateMapper].

 See also:

  * [MaterialStateProperty], the Material specific version of
    `WidgetStateProperty`.
 

## Constructors

### Unnamed Constructor
This abstract constructor allows extending the class.

 [WidgetStateProperty] is designed as an interface, so this constructor
 is only needed for backward compatibility.

### fromMap
Creates a property that resolves using a [WidgetStateMap].

 
 This constructor's [resolve] method finds the first [MapEntry] whose
 key is satisfied by the set of states, and returns its associated value.
 

 Resolves to `null` if no keys match, or if [T] is non-nullable,
 the method throws an [ArgumentError].
 

 

#### Parameters

- `map`: `WidgetStateMap&lt;T&gt;`
