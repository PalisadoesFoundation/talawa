# Overview for `Radio`

## Description

A Material Design radio button.

 Used to select between a number of mutually exclusive values. When one radio
 button in a group is selected, the other radio buttons in the group cease to
 be selected. The values are of type `T`, the type parameter of the [Radio]
 class. Enums are commonly used for this purpose.

 The radio button itself does not maintain any state. Instead, selecting the
 radio invokes the [onChanged] callback, passing [value] as a parameter. If
 [groupValue] and [value] match, this radio will be selected. Most widgets
 will respond to [onChanged] by calling [State.setState] to update the
 radio button's [groupValue].

 
 Here is an example of Radio widgets wrapped in ListTiles, which is similar
 to what you could get with the RadioListTile widget.

 The currently selected character is passed into `groupValue`, which is
 maintained by the example's `State`. In this case, the first [Radio]
 will start off selected because `_character` is initialized to
 `SingingCharacter.lafayette`.

 If the second radio button is pressed, the example's state is updated
 with `setState`, updating `_character` to `SingingCharacter.jefferson`.
 This causes the buttons to rebuild with the updated `groupValue`, and
 therefore the selection of the second button.

 Requires one of its ancestors to be a [Material] widget.

 ** See code in examples/api/lib/material/radio/radio.0.dart **
 

 See also:

  * [RadioListTile], which combines this widget with a [ListTile] so that
    you can give the radio button a label.
  * [Slider], for selecting a value in a range.
  * [Checkbox] and [Switch], for toggling a particular value on or off.
  * <https://material.io/design/components/selection-controls.html#radio-buttons>

## Dependencies

- StatefulWidget

## Members

- **value**: `T`
  The value represented by this radio button.

- **groupValue**: `T?`
  The currently selected value for a group of radio buttons.

 This radio button is considered selected if its [value] matches the
 [groupValue].

- **onChanged**: `ValueChanged<T?>?`
  Called when the user selects this radio button.

 The radio button passes [value] as a parameter to this callback. The radio
 button does not actually change state until the parent widget rebuilds the
 radio button with the new [groupValue].

 If null, the radio button will be displayed as disabled.

 The provided callback will not be invoked if this radio button is already
 selected.

 The callback provided to [onChanged] should update the state of the parent
 [StatefulWidget] using the [State.setState] method, so that the parent
 gets rebuilt; for example:

 ```dart
 Radio&lt;SingingCharacter&gt;(
   value: SingingCharacter.lafayette,
   groupValue: _character,
   onChanged: (SingingCharacter? newValue) ,
 )
 ```

- **mouseCursor**: `MouseCursor?`
  
 The cursor for a mouse pointer when it enters or is hovering over the
 widget.

 If [mouseCursor] is a [WidgetStateMouseCursor],
 [WidgetStateProperty.resolve] is used for the following [WidgetState]s:

  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].
 

 If null, then the value of [RadioThemeData.mouseCursor] is used.
 If that is also null, then [WidgetStateMouseCursor.clickable] is used.

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

 ** See code in examples/api/lib/material/radio/radio.toggleable.0.dart **
 

- **activeColor**: `Color?`
  The color to use when this radio button is selected.

 Defaults to [ColorScheme.secondary].

 If [fillColor] returns a non-null color in the [WidgetState.selected]
 state, it will be used instead of this color.

- **fillColor**: `MaterialStateProperty<Color?>?`
  
 The color that fills the radio button, in all [WidgetState]s.

 Resolves in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [fillColor] based on the current [WidgetState]
 of the [Radio], providing a different [Color] when it is
 [WidgetState.disabled].

 ```dart
 Radio&lt;int&gt;(
   value: 1,
   groupValue: 1,
   onChanged: (_),
   fillColor: WidgetStateProperty.resolveWith&lt;Color&gt;((Set&lt;WidgetState&gt; states) )
 )
 ```
 
 

 If null, then the value of [activeColor] is used in the selected state. If
 that is also null, then the value of [RadioThemeData.fillColor] is used.
 If that is also null and [ThemeData.useMaterial3] is false, then
 [ThemeData.disabledColor] is used in the disabled state, [ColorScheme.secondary]
 is used in the selected state, and [ThemeData.unselectedWidgetColor] is used in the
 default state; if [ThemeData.useMaterial3] is true, then [ColorScheme.onSurface]
 is used in the disabled state, [ColorScheme.primary] is used in the
 selected state and [ColorScheme.onSurfaceVariant] is used in the default state.

- **materialTapTargetSize**: `MaterialTapTargetSize?`
  
 Configures the minimum size of the tap target.
 

 If null, then the value of [RadioThemeData.materialTapTargetSize] is used.
 If that is also null, then the value of [ThemeData.materialTapTargetSize]
 is used.

 See also:

  * [MaterialTapTargetSize], for a description of how this affects tap targets.

- **visualDensity**: `VisualDensity?`
  
 Defines how compact the radio's layout will be.
 

 

 If null, then the value of [RadioThemeData.visualDensity] is used. If that
 is also null, then the value of [ThemeData.visualDensity] is used.

 See also:

  * [ThemeData.visualDensity], which specifies the [visualDensity] for all
    widgets within a [Theme].

- **focusColor**: `Color?`
  The color for the radio's [Material] when it has the input focus.

 If [overlayColor] returns a non-null color in the [WidgetState.focused]
 state, it will be used instead.

 If null, then the value of [RadioThemeData.overlayColor] is used in the
 focused state. If that is also null, then the value of
 [ThemeData.focusColor] is used.

- **hoverColor**: `Color?`
  
 The color for the radio's [Material] when a pointer is hovering over it.

 If [overlayColor] returns a non-null color in the [WidgetState.hovered]
 state, it will be used instead.
 

 If null, then the value of [RadioThemeData.overlayColor] is used in the
 hovered state. If that is also null, then the value of
 [ThemeData.hoverColor] is used.

- **overlayColor**: `MaterialStateProperty<Color?>?`
  
 The color for the radio's [Material].

 Resolves in the following states:
  * [WidgetState.pressed].
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
 

 If null, then the value of [activeColor] with alpha
 [kRadialReactionAlpha], [focusColor] and [hoverColor] is used in the
 pressed, focused and hovered state. If that is also null,
 the value of [RadioThemeData.overlayColor] is used. If that is also null,
 then in Material 2, the value of [ColorScheme.secondary] with alpha
 [kRadialReactionAlpha], [ThemeData.focusColor] and [ThemeData.hoverColor]
 is used in the pressed, focused and hovered state. In Material3, the default
 values are:
   * selected
     * pressed - Theme.colorScheme.onSurface(0.1)
     * hovered - Theme.colorScheme.primary(0.08)
     * focused - Theme.colorScheme.primary(0.1)
   * pressed - Theme.colorScheme.primary(0.1)
   * hovered - Theme.colorScheme.onSurface(0.08)
   * focused - Theme.colorScheme.onSurface(0.1)

- **splashRadius**: `double?`
  
 The splash radius of the circular [Material] ink response.
 

 If null, then the value of [RadioThemeData.splashRadius] is used. If that
 is also null, then [kRadialReactionRadius] is used.

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

- **useCupertinoCheckmarkStyle**: `bool`
  Controls whether the checkmark style is used in an iOS-style radio.

 Only usable under the [Radio.adaptive] constructor. If set to true, on
 Apple platforms the radio button will appear as an iOS styled checkmark.
 Controls the [CupertinoRadio] through [CupertinoRadio.useCheckmarkStyle].

 Defaults to false.

- **_radioType**: `_RadioType`
## Constructors

### Unnamed Constructor
Creates a Material Design radio button.

 The radio button itself does not maintain any state. Instead, when the
 radio button is selected, the widget calls the [onChanged] callback. Most
 widgets that use a radio button will listen for the [onChanged] callback
 and rebuild the radio button with a new [groupValue] to update the visual
 appearance of the radio button.

 The following arguments are required:

 * [value] and [groupValue] together determine whether the radio button is
   selected.
 * [onChanged] is called when the user selects this radio button.

### adaptive
Creates an adaptive [Radio] based on whether the target platform is iOS
 or macOS, following Material design's
 [Cross-platform guidelines](https://material.io/design/platform-guidance/cross-platform-adaptation.html).

 On iOS and macOS, this constructor creates a [CupertinoRadio], which has
 matching functionality and presentation as Material checkboxes, and are the
 graphics expected on iOS. On other platforms, this creates a Material
 design [Radio].

 If a [CupertinoRadio] is created, the following parameters are ignored:
 [mouseCursor], [fillColor], [hoverColor], [overlayColor], [splashRadius],
 [materialTapTargetSize], [visualDensity].

 [useCupertinoCheckmarkStyle] is used only if a [CupertinoRadio] is created.

 The target platform is based on the current [Theme]: [ThemeData.platform].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
