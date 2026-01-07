# Overview for `Checkbox`

## Description

A Material Design checkbox.

 The checkbox itself does not maintain any state. Instead, when the state of
 the checkbox changes, the widget calls the [onChanged] callback. Most
 widgets that use a checkbox will listen for the [onChanged] callback and
 rebuild the checkbox with a new [value] to update the visual appearance of
 the checkbox.

 The checkbox can optionally display three values - true, false, and null -
 if [tristate] is true. When [value] is null a dash is displayed. By default
 [tristate] is false and the checkbox's [value] must be true or false.

 Requires one of its ancestors to be a [Material] widget.

 
 This example shows how you can override the default theme of
 a [Checkbox] with a [WidgetStateProperty].
 In this example, the checkbox's color will be `Colors.blue` when the [Checkbox]
 is being pressed, hovered, or focused. Otherwise, the checkbox's color will
 be `Colors.red`.

 ** See code in examples/api/lib/material/checkbox/checkbox.0.dart **
 

 
 This example shows what the checkbox error state looks like.

 ** See code in examples/api/lib/material/checkbox/checkbox.1.dart **
 

 See also:

  * [CheckboxListTile], which combines this widget with a [ListTile] so that
    you can give the checkbox a label.
  * [Switch], a widget with semantics similar to [Checkbox].
  * [Radio], for selecting among a set of explicit values.
  * [Slider], for selecting a value in a range.
  * <https://material.io/design/components/selection-controls.html#checkboxes>
  * <https://material.io/design/components/lists.html#types>

## Dependencies

- StatefulWidget

## Members

- **value**: `bool?`
  Whether this checkbox is checked.

 When [tristate] is true, a value of null corresponds to the mixed state.
 When [tristate] is false, this value must not be null.

- **onChanged**: `ValueChanged<bool?>?`
  Called when the value of the checkbox should change.

 The checkbox passes the new value to the callback but does not actually
 change state until the parent widget rebuilds the checkbox with the new
 value.

 If this callback is null, the checkbox will be displayed as disabled
 and will not respond to input gestures.

 When the checkbox is tapped, if [tristate] is false (the default) then
 the [onChanged] callback will be applied to `!value`. If [tristate] is
 true this callback cycle from false to true to null.

 The callback provided to [onChanged] should update the state of the parent
 [StatefulWidget] using the [State.setState] method, so that the parent
 gets rebuilt; for example:

 ```dart
 Checkbox(
   value: _throwShotAway,
   onChanged: (bool? newValue) ,
 )
 ```

- **mouseCursor**: `MouseCursor?`
  
 The cursor for a mouse pointer when it enters or is hovering over the
 widget.

 If [mouseCursor] is a [WidgetStateMouseCursor],
 [WidgetStateProperty.resolve] is used for the following [WidgetState]s:

  * [WidgetState.selected].
  * [WidgetState.focused].
  * [WidgetState.disabled].
 

 When [value] is null and [tristate] is true, [WidgetState.selected] is
 included as a state.

 If null, then the value of [CheckboxThemeData.mouseCursor] is used. If
 that is also null, then [WidgetStateMouseCursor.clickable] is used.

- **activeColor**: `Color?`
  The color to use when this checkbox is checked.

 Defaults to [ColorScheme.secondary].

 If [fillColor] returns a non-null color in the [WidgetState.selected]
 state, it will be used instead of this color.

- **fillColor**: `MaterialStateProperty<Color?>?`
  
 The color that fills the checkbox, in all [WidgetState]s.

 Resolves in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [fillColor] based on the current [WidgetState]
 of the [Checkbox], providing a different [Color] when it is
 [WidgetState.disabled].

 ```dart
 Checkbox(
   value: true,
   onChanged: (_),
   fillColor: MaterialStateProperty.resolveWith&lt;Color&gt;((Set&lt;WidgetState&gt; states) )
 )
 ```
 
 

 If null, then the value of [activeColor] is used in the selected
 state. If that is also null, the value of [CheckboxThemeData.fillColor]
 is used. If that is also null, then [ThemeData.disabledColor] is used in
 the disabled state, [ColorScheme.secondary] is used in the
 selected state, and [ThemeData.unselectedWidgetColor] is used in the
 default state.

- **checkColor**: `Color?`
  
 The color to use for the check icon when this checkbox is checked.
 

 If null, then the value of [CheckboxThemeData.checkColor] is used. If
 that is also null, then Color(0xFFFFFFFF) is used.

- **tristate**: `bool`
  If true the checkbox's [value] can be true, false, or null.

 [Checkbox] displays a dash when its value is null.

 When a tri-state checkbox ([tristate] is true) is tapped, its [onChanged]
 callback will be applied to true if the current value is false, to null if
 value is true, and to false if value is null (i.e. it cycles through false
 => true => null => false when tapped).

 If tristate is false (the default), [value] must not be null.

- **materialTapTargetSize**: `MaterialTapTargetSize?`
  
 Configures the minimum size of the tap target.
 

 If null, then the value of [CheckboxThemeData.materialTapTargetSize] is
 used. If that is also null, then the value of
 [ThemeData.materialTapTargetSize] is used.

 See also:

  * [MaterialTapTargetSize], for a description of how this affects tap targets.

- **visualDensity**: `VisualDensity?`
  
 Defines how compact the checkbox's layout will be.
 

 

 If null, then the value of [CheckboxThemeData.visualDensity] is used. If
 that is also null and if [ThemeData.useMaterial3] is false, then the
 value of [ThemeData.visualDensity] is used. Otherwise, the default value
 is [VisualDensity.standard].

 See also:

  * [ThemeData.visualDensity], which specifies the [visualDensity] for all
    widgets within a [Theme].

- **focusColor**: `Color?`
  The color for the checkbox's [Material] when it has the input focus.

 If [overlayColor] returns a non-null color in the [WidgetState.focused]
 state, it will be used instead.

 If null, then the value of [CheckboxThemeData.overlayColor] is used in the
 focused state. If that is also null, then the value of
 [ThemeData.focusColor] is used.

- **hoverColor**: `Color?`
  
 The color for the checkbox's [Material] when a pointer is hovering over it.

 If [overlayColor] returns a non-null color in the [WidgetState.hovered]
 state, it will be used instead.
 

 If null, then the value of [CheckboxThemeData.overlayColor] is used in the
 hovered state. If that is also null, then the value of
 [ThemeData.hoverColor] is used.

- **overlayColor**: `MaterialStateProperty<Color?>?`
  
 The color for the checkbox's [Material].

 Resolves in the following states:
  * [WidgetState.pressed].
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
 

 If null, then the value of [activeColor] with alpha
 [kRadialReactionAlpha], [focusColor] and [hoverColor] is used in the
 pressed, focused and hovered state. If that is also null,
 the value of [CheckboxThemeData.overlayColor] is used. If that is
 also null, then the value of [ColorScheme.secondary] with alpha
 [kRadialReactionAlpha], [ThemeData.focusColor] and [ThemeData.hoverColor]
 is used in the pressed, focused and hovered state.

- **splashRadius**: `double?`
  
 The splash radius of the circular [Material] ink response.
 

 If null, then the value of [CheckboxThemeData.splashRadius] is used. If
 that is also null, then [kRadialReactionRadius] is used.

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

- **shape**: `OutlinedBorder?`
  
 The shape of the checkbox's [Material].
 

 If this property is null then [CheckboxThemeData.shape] of [ThemeData.checkboxTheme]
 is used. If that's null then the shape will be a [RoundedRectangleBorder]
 with a circular corner radius of 1.0 in Material 2, and 2.0 in Material 3.

- **side**: `BorderSide?`
  
 The color and width of the checkbox's border.

 This property can be a [WidgetStateBorderSide] that can
 specify different border color and widths depending on the
 checkbox's state.

 Resolves in the following states:
  * [WidgetState.pressed].
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].
  * [WidgetState.error].

 If this property is not a [WidgetStateBorderSide] and it is
 non-null, then it is only rendered when the checkbox's value is
 false. The difference in interpretation is for backwards
 compatibility.
 

 If this property is null, then [CheckboxThemeData.side] of
 [ThemeData.checkboxTheme] is used. If that is also null, then the side
 will be width 2.

- **isError**: `bool`
  
 True if this checkbox wants to show an error state.

 The checkbox will have different default container color and check color when
 this is true. This is only used when [ThemeData.useMaterial3] is set to true.
 

 Defaults to false.

- **semanticLabel**: `String?`
  
 The semantic label for the checkbox that will be announced by screen readers.

 This is announced by assistive technologies (e.g TalkBack/VoiceOver).

 This label does not show in the UI.
 

- **width**: `double`
  The width of a checkbox widget.

- **_checkboxType**: `_CheckboxType`
## Constructors

### Unnamed Constructor
Creates a Material Design checkbox.

 The checkbox itself does not maintain any state. Instead, when the state of
 the checkbox changes, the widget calls the [onChanged] callback. Most
 widgets that use a checkbox will listen for the [onChanged] callback and
 rebuild the checkbox with a new [value] to update the visual appearance of
 the checkbox.

 The following arguments are required:

 * [value], which determines whether the checkbox is checked. The [value]
   can only be null if [tristate] is true.
 * [onChanged], which is called when the value of the checkbox should
   change. It can be set to null to disable the checkbox.

### adaptive
Creates an adaptive [Checkbox] based on whether the target platform is iOS
 or macOS, following Material design's
 [Cross-platform guidelines](https://material.io/design/platform-guidance/cross-platform-adaptation.html).

 On iOS and macOS, this constructor creates a [CupertinoCheckbox], which has
 matching functionality and presentation as Material checkboxes, and are the
 graphics expected on iOS. On other platforms, this creates a Material
 design [Checkbox].

 If a [CupertinoCheckbox] is created, the following parameters are ignored:
 [fillColor], [hoverColor], [overlayColor], [splashRadius],
 [materialTapTargetSize], [visualDensity], [isError]. However, [shape] and
 [side] will still affect the [CupertinoCheckbox] and should be handled if
 native fidelity is important.

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
