# Overview for `CupertinoRadio`

## Description

A macOS-style radio button.

 Used to select between a number of mutually exclusive values. When one radio
 button in a group is selected, the other radio buttons in the group are
 deselected. The values are of type `T`, the type parameter of the
 [CupertinoRadio] class. Enums are commonly used for this purpose.

 The radio button itself does not maintain any state. Instead, selecting the
 radio invokes the [onChanged] callback, passing [value] as a parameter. If
 [groupValue] and [value] match, this radio will be selected. Most widgets
 will respond to [onChanged] by calling [State.setState] to update the
 radio button's [groupValue].

 
 Here is an example of CupertinoRadio widgets wrapped in CupertinoListTiles.

 The currently selected character is passed into `groupValue`, which is
 maintained by the example's `State`. In this case, the first [CupertinoRadio]
 will start off selected because `_character` is initialized to
 `SingingCharacter.lafayette`.

 If the second radio button is pressed, the example's state is updated
 with `setState`, updating `_character` to `SingingCharacter.jefferson`.
 This causes the buttons to rebuild with the updated `groupValue`, and
 therefore the selection of the second button.

 ** See code in examples/api/lib/cupertino/radio/cupertino_radio.0.dart **
 

 See also:

  * [CupertinoSlider], for selecting a value in a range.
  * [CupertinoCheckbox] and [CupertinoSwitch], for toggling a particular value on or off.
  * [Radio], the Material Design equivalent.
  * <https://developer.apple.com/design/human-interface-guidelines/components/selection-and-input/toggles/>

## Dependencies

- StatefulWidget

## Members

- **value**: `T`
  The value represented by this radio button.

 If this equals the [groupValue], then this radio button will appear
 selected.

- **groupValue**: `T?`
  The currently selected value for a group of radio buttons.

 This radio button is considered selected if its [value] matches the
 [groupValue].

- **onChanged**: `ValueChanged<T?>?`
  Called when the user selects this [CupertinoRadio] button.

 The radio button passes [value] as a parameter to this callback. It does
 not actually change state until the parent widget rebuilds the radio
 button with a new [groupValue].

 If null, the radio button will be displayed as disabled.

 The provided callback will not be invoked if this radio button is already
 selected.

 The callback provided to [onChanged] should update the state of the parent
 [StatefulWidget] using the [State.setState] method, so that the parent
 gets rebuilt; for example:

 ```dart
 CupertinoRadio&lt;SingingCharacter&gt;(
   value: SingingCharacter.lafayette,
   groupValue: _character,
   onChanged: (SingingCharacter? newValue) ,
 )
 ```

- **mouseCursor**: `MouseCursor?`
  The cursor for a mouse pointer when it enters or is hovering over the
 widget.

 If [mouseCursor] is a [WidgetStateMouseCursor],
 [WidgetStateMouseCursor.resolve] is used for the following [WidgetState]s:

  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 If null, then [SystemMouseCursors.basic] is used when this radio button is disabled.
 When this radio button is enabled, [SystemMouseCursors.click] is used on Web, and
 [SystemMouseCursors.basic] is used on other platforms.

 See also:

  * [WidgetStateMouseCursor], a [MouseCursor] that implements
    `WidgetStateProperty` which is used in APIs that need to accept
    either a [MouseCursor] or a [WidgetStateProperty&lt;MouseCursor&gt;].

- **toggleable**: `bool`
  Set to true if this radio button is allowed to be returned to an
 indeterminate state by selecting it again when selected.

 To indicate returning to an indeterminate state, [onChanged] will be
 called with null.

 If true, [onChanged] can be called with [value] when selected while
 [groupValue] != [value], or with null when selected again while
 [groupValue] == [value].

 If false, [onChanged] will be called with [value] when it is selected
 while [groupValue] != [value], and only by selecting another radio button
 in the group (i.e. changing the value of [groupValue]) can this radio
 button be unselected.

 The default is false.

 
 This example shows how to enable deselecting a radio button by setting the
 [toggleable] attribute.

 ** See code in examples/api/lib/cupertino/radio/cupertino_radio.toggleable.0.dart **
 

- **useCheckmarkStyle**: `bool`
  Controls whether the radio displays in a checkbox style or the default iOS
 radio style.

 Defaults to false.

- **activeColor**: `Color?`
  The color to use when this radio button is selected.

 Defaults to [CupertinoColors.activeBlue].

- **inactiveColor**: `Color?`
  The color to use when this radio button is not selected.

 Defaults to [CupertinoColors.white].

- **fillColor**: `Color?`
  The color that fills the inner circle of the radio button when selected.

 Defaults to [CupertinoColors.white].

- **focusColor**: `Color?`
  The color for the radio's border when it has the input focus.

 If null, then a paler form of the [activeColor] will be used.

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

## Constructors

### Unnamed Constructor
Creates a macOS-styled radio button.

 The following arguments are required:

 * [value] and [groupValue] together determine whether the radio button is
   selected.
 * [onChanged] is called when the user selects this radio button.

