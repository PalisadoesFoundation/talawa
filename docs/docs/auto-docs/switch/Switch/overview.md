# Overview for `Switch`

## Description

A Material Design switch.

 Used to toggle the on/off state of a single setting.

 The switch itself does not maintain any state. Instead, when the state of
 the switch changes, the widget calls the [onChanged] callback. Most widgets
 that use a switch will listen for the [onChanged] callback and rebuild the
 switch with a new [value] to update the visual appearance of the switch.

 If the [onChanged] callback is null, then the switch will be disabled (it
 will not respond to input). A disabled switch's thumb and track are rendered
 in shades of grey by default. The default appearance of a disabled switch
 can be overridden with [inactiveThumbColor] and [inactiveTrackColor].

 Requires one of its ancestors to be a [Material] widget.

 Material Design 3 provides the option to add icons on the thumb of the [Switch].
 If [ThemeData.useMaterial3] is set to true, users can use [Switch.thumbIcon]
 to add optional Icons based on the different [WidgetState]s of the [Switch].

 
 This example shows a toggleable [Switch]. When the thumb slides to the other
 side of the track, the switch is toggled between on/off.

 ** See code in examples/api/lib/material/switch/switch.0.dart **
 

 
 This example shows how to customize [Switch] using [WidgetStateProperty]
 switch properties.

 ** See code in examples/api/lib/material/switch/switch.1.dart **
 

 
 This example shows how to add icons on the thumb of the [Switch] using the
 [Switch.thumbIcon] property.

 ** See code in examples/api/lib/material/switch/switch.2.dart **
 

 
 This example shows how to use the ambient [CupertinoThemeData] to style all
 widgets which would otherwise use iOS defaults.

 ** See code in examples/api/lib/material/switch/switch.3.dart **
 

 See also:

  * [SwitchListTile], which combines this widget with a [ListTile] so that
    you can give the switch a label.
  * [Checkbox], another widget with similar semantics.
  * [Radio], for selecting among a set of explicit values.
  * [Slider], for selecting a value in a range.
  * [WidgetStateProperty], an interface for objects that "resolve" to
    different values depending on a widget's material state.
  * <https://material.io/design/components/selection-controls.html#switches>

## Dependencies

- StatelessWidget

## Members

- **value**: `bool`
  Whether this switch is on or off.

- **onChanged**: `ValueChanged&lt;bool&gt;?`
  Called when the user toggles the switch on or off.

 The switch passes the new value to the callback but does not actually
 change state until the parent widget rebuilds the switch with the new
 value.

 If null, the switch will be displayed as disabled.

 The callback provided to [onChanged] should update the state of the parent
 [StatefulWidget] using the [State.setState] method, so that the parent
 gets rebuilt; for example:

 ```dart
 Switch(
   value: _giveVerse,
   onChanged: (bool newValue) ,
 )
 ```

- **activeColor**: `Color?`
  
 The color to use when this switch is on.
 

 Defaults to [ColorScheme.secondary].

 If [thumbColor] returns a non-null color in the [WidgetState.selected]
 state, it will be used instead of this color.

- **activeTrackColor**: `Color?`
  
 The color to use on the track when this switch is on.
 

 Defaults to [ColorScheme.secondary] with the opacity set at 50%.

 If [trackColor] returns a non-null color in the [WidgetState.selected]
 state, it will be used instead of this color.

- **inactiveThumbColor**: `Color?`
  
 The color to use on the thumb when this switch is off.
 

 Defaults to the colors described in the Material design specification.

 If [thumbColor] returns a non-null color in the default state, it will be
 used instead of this color.

- **inactiveTrackColor**: `Color?`
  
 The color to use on the track when this switch is off.
 

 Defaults to the colors described in the Material design specification.

 If [trackColor] returns a non-null color in the default state, it will be
 used instead of this color.

- **activeThumbImage**: `ImageProvider?`
  
 An image to use on the thumb of this switch when the switch is on.
 

- **onActiveThumbImageError**: `ImageErrorListener?`
  
 An optional error callback for errors emitted when loading
 [activeThumbImage].
 

- **inactiveThumbImage**: `ImageProvider?`
  
 An image to use on the thumb of this switch when the switch is off.
 

- **onInactiveThumbImageError**: `ImageErrorListener?`
  
 An optional error callback for errors emitted when loading
 [inactiveThumbImage].
 

- **thumbColor**: `MaterialStateProperty<Color?>?`
  
 The color of this [Switch]'s thumb.

 Resolved in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [thumbColor] based on the current
 [WidgetState] of the [Switch], providing a different [Color] when it is
 [WidgetState.disabled].

 ```dart
 Switch(
   value: true,
   onChanged: (bool value) ,
   thumbColor: WidgetStateProperty.resolveWith&lt;Color&gt;((Set&lt;WidgetState&gt; states) ),
 )
 ```
 
 

 If null, then the value of [activeColor] is used in the selected
 state and [inactiveThumbColor] in the default state. If that is also null,
 then the value of [SwitchThemeData.thumbColor] is used. If that is also
 null, then the following colors are used:

 | State    | Light theme                       | Dark theme                        |
 |----------|-----------------------------------|-----------------------------------|
 | Default  | `Colors.grey.shade50`             | `Colors.grey.shade400`            |
 | Selected | [ColorScheme.secondary] | [ColorScheme.secondary] |
 | Disabled | `Colors.grey.shade400`            | `Colors.grey.shade800`            |

- **trackColor**: `MaterialStateProperty<Color?>?`
  
 The color of this [Switch]'s track.

 Resolved in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [trackColor] based on the current
 [WidgetState] of the [Switch], providing a different [Color] when it is
 [WidgetState.disabled].

 ```dart
 Switch(
   value: true,
   onChanged: (bool value) ,
   thumbColor: WidgetStateProperty.resolveWith&lt;Color&gt;((Set&lt;WidgetState&gt; states) ),
 )
 ```
 
 

 If null, then the value of [activeTrackColor] is used in the selected
 state and [inactiveTrackColor] in the default state. If that is also null,
 then the value of [SwitchThemeData.trackColor] is used. If that is also
 null, then the following colors are used:

 | State    | Light theme                     | Dark theme                      |
 |----------|---------------------------------|---------------------------------|
 | Default  | `Color(0x52000000)`             | `Colors.white30`                |
 | Selected | [activeColor] with alpha `0x80` | [activeColor] with alpha `0x80` |
 | Disabled | `Colors.black12`                | `Colors.white10`                |

- **trackOutlineColor**: `MaterialStateProperty<Color?>?`
  
 The outline color of this [Switch]'s track.

 Resolved in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [trackOutlineColor] based on the current
 [WidgetState] of the [Switch], providing a different [Color] when it is
 [WidgetState.disabled].

 ```dart
 Switch(
   value: true,
   onChanged: (bool value) ,
   trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set&lt;WidgetState&gt; states) ),
 )
 ```
 
 

 In Material 3, the outline color defaults to transparent in the selected
 state and [ColorScheme.outline] in the unselected state. In Material 2,
 the [Switch] track has no outline by default.

- **trackOutlineWidth**: `MaterialStateProperty<double?>?`
  
 The outline width of this [Switch]'s track.

 Resolved in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [trackOutlineWidth] based on the current
 [WidgetState] of the [Switch], providing a different outline width when it is
 [WidgetState.disabled].

 ```dart
 Switch(
   value: true,
   onChanged: (bool value) ,
   trackOutlineWidth: WidgetStateProperty.resolveWith<double?>((Set&lt;WidgetState&gt; states) ),
 )
 ```
 
 

 Defaults to 2.0.

- **thumbIcon**: `MaterialStateProperty<Icon?>?`
  
 The icon to use on the thumb of this switch

 Resolved in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [thumbIcon] based on the current
 [WidgetState] of the [Switch], providing a different [Icon] when it is
 [WidgetState.disabled].

 ```dart
 Switch(
   value: true,
   onChanged: (bool value) ,
   thumbIcon: WidgetStateProperty.resolveWith<Icon?>((Set&lt;WidgetState&gt; states) ),
 )
 ```
 
 

 If null, then the value of [SwitchThemeData.thumbIcon] is used. If this is also null,
 then the [Switch] does not have any icons on the thumb.

- **materialTapTargetSize**: `MaterialTapTargetSize?`
  
 Configures the minimum size of the tap target.
 

 If null, then the value of [SwitchThemeData.materialTapTargetSize] is
 used. If that is also null, then the value of
 [ThemeData.materialTapTargetSize] is used.

 See also:

  * [MaterialTapTargetSize], for a description of how this affects tap targets.

- **_switchType**: `_SwitchType`
- **applyCupertinoTheme**: `bool?`
  

- **dragStartBehavior**: `DragStartBehavior`
  

- **mouseCursor**: `MouseCursor?`
  
 The cursor for a mouse pointer when it enters or is hovering over the
 widget.

 If [mouseCursor] is a [WidgetStateMouseCursor],
 [WidgetStateProperty.resolve] is used for the following [WidgetState]s:

  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].
 

 If null, then the value of [SwitchThemeData.mouseCursor] is used. If that
 is also null, then [WidgetStateMouseCursor.clickable] is used.

- **focusColor**: `Color?`
  The color for the button's [Material] when it has the input focus.

 If [overlayColor] returns a non-null color in the [WidgetState.focused]
 state, it will be used instead.

 If null, then the value of [SwitchThemeData.overlayColor] is used in the
 focused state. If that is also null, then the value of
 [ThemeData.focusColor] is used.

- **hoverColor**: `Color?`
  The color for the button's [Material] when a pointer is hovering over it.

 If [overlayColor] returns a non-null color in the [WidgetState.hovered]
 state, it will be used instead.

 If null, then the value of [SwitchThemeData.overlayColor] is used in the
 hovered state. If that is also null, then the value of
 [ThemeData.hoverColor] is used.

- **overlayColor**: `MaterialStateProperty<Color?>?`
  
 The color for the switch's [Material].

 Resolves in the following states:
  * [WidgetState.pressed].
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
 

 If null, then the value of [activeColor] with alpha
 [kRadialReactionAlpha], [focusColor] and [hoverColor] is used in the
 pressed, focused and hovered state. If that is also null,
 the value of [SwitchThemeData.overlayColor] is used. If that is
 also null, then the value of [ColorScheme.secondary] with alpha
 [kRadialReactionAlpha], [ThemeData.focusColor] and [ThemeData.hoverColor]
 is used in the pressed, focused and hovered state.

- **splashRadius**: `double?`
  
 The splash radius of the circular [Material] ink response.
 

 If null, then the value of [SwitchThemeData.splashRadius] is used. If that
 is also null, then [kRadialReactionRadius] is used.

- **focusNode**: `FocusNode?`
  

- **onFocusChange**: `ValueChanged&lt;bool&gt;?`
  

- **autofocus**: `bool`
  

- **padding**: `EdgeInsetsGeometry?`
  The amount of space to surround the child inside the bounds of the [Switch].

 Defaults to horizontal padding of 4 pixels. If [ThemeData.useMaterial3] is false,
 then there is no padding by default.

## Constructors

### Unnamed Constructor
Creates a Material Design switch.

 The switch itself does not maintain any state. Instead, when the state of
 the switch changes, the widget calls the [onChanged] callback. Most widgets
 that use a switch will listen for the [onChanged] callback and rebuild the
 switch with a new [value] to update the visual appearance of the switch.

 The following arguments are required:

 * [value] determines whether this switch is on or off.
 * [onChanged] is called when the user toggles the switch on or off.

### adaptive
Creates an adaptive [Switch] based on whether the target platform is iOS
 or macOS, following Material design's
 [Cross-platform guidelines](https://material.io/design/platform-guidance/cross-platform-adaptation.html).

 Creates a switch that looks and feels native when the [ThemeData.platform]
 is iOS or macOS, otherwise a Material Design switch is created.

 To provide a custom switch theme that's only used by this factory
 constructor, pass a custom `Adaptation&lt;SwitchThemeData&gt;` class to the
 `adaptations` parameter of [ThemeData]. This can be useful in situations
 where you don't want the overall [ThemeData.switchTheme] to apply when
 this adaptive constructor is used.

 
 This sample shows how to create and use subclasses of [Adaptation] that
 define adaptive [SwitchThemeData]s.

 ** See code in examples/api/lib/material/switch/switch.4.dart **
 

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
