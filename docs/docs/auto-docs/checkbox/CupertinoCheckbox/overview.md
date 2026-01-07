# Overview for `CupertinoCheckbox`

## Description

A macOS style checkbox.

 

 The checkbox itself does not maintain any state. Instead, when the state of
 the checkbox changes, the widget calls the [onChanged] callback. Most
 widgets that use a checkbox will listen for the [onChanged] callback and
 rebuild the checkbox with a new [value] to update the visual appearance of
 the checkbox.

 The checkbox can optionally display three values - true, false, and null -
 if [tristate] is true. When [value] is null a dash is displayed. By default
 [tristate] is false and the checkbox's [value] must be true or false.

 In the Apple Human Interface Guidelines (HIG), checkboxes are encouraged for
 use on macOS, but is silent about their use on iOS. If a multi-selection
 component is needed on iOS, the HIG encourages the developer to use switches
 ([CupertinoSwitch] in Flutter) instead, or to find a creative custom
 solution.

 
 This example shows a toggleable [CupertinoCheckbox].

 ** See code in examples/api/lib/cupertino/checkbox/cupertino_checkbox.0.dart **
 

 See also:

  * [Checkbox], the Material Design equivalent.
  * [CupertinoSwitch], a widget with semantics similar to [CupertinoCheckbox].
  * [CupertinoSlider], for selecting a value in a range.
  * <https://developer.apple.com/design/human-interface-guidelines/components/selection-and-input/toggles/>

## Dependencies

- StatefulWidget

## Members

- **value**: `bool?`
  Whether this checkbox is checked.

 When [tristate] is true, a value of null corresponds to the mixed state.
 When [tristate] is false, this value must not be null. This is asserted in
 debug mode.

- **onChanged**: `ValueChanged<bool?>?`
  Called when the value of the checkbox should change.

 The checkbox passes the new value to the callback but does not actually
 change state until the parent widget rebuilds the checkbox with the new
 value.

 If this callback is null, the checkbox will be displayed as disabled
 and will not respond to input gestures.

 When the checkbox is tapped, if [tristate] is false (the default) then
 the [onChanged] callback will be applied to `!value`. If [tristate] is
 true this callback cycle from false to true to null and back to false
 again.

 The callback provided to [onChanged] should update the state of the parent
 [StatefulWidget] using the [State.setState] method, so that the parent
 gets rebuilt; for example:

 ```dart
 CupertinoCheckbox(
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

 If null, then [SystemMouseCursors.basic] is used when this checkbox is
 disabled. When the checkbox is enabled, [SystemMouseCursors.click] is used
 on Web, and [SystemMouseCursors.basic] is used on other platforms.

 See also:

  * [WidgetStateMouseCursor], a [MouseCursor] that implements
    [WidgetStateProperty] which is used in APIs that need to accept
    either a [MouseCursor] or a [WidgetStateProperty].

- **activeColor**: `Color?`
  The color to use when this checkbox is checked.

 If [fillColor] returns a non-null color in the [WidgetState.selected]
 state, [fillColor] will be used instead of [activeColor].

 Defaults to [CupertinoColors.activeBlue].

- **fillColor**: `WidgetStateProperty<Color?>?`
  
 The color used to fill this checkbox.

 Resolves in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [fillColor] based on the current [WidgetState]
 of the [CupertinoCheckbox], providing a different [Color] when it is
 [WidgetState.disabled].

 ```dart
 CupertinoCheckbox(
   value: true,
   onChanged: (_),
   fillColor: WidgetStateProperty.resolveWith&lt;Color&gt;((Set&lt;WidgetState&gt; states) )
 )
 ```
 
 

 If [fillColor] resolves to null for the requested state, then the fill color
 falls back to [activeColor] if the state includes [WidgetState.selected],
 [CupertinoColors.white] at 50% opacity if checkbox is disabled,
 and [CupertinoColors.white] otherwise.

- **inactiveColor**: `Color?`
  The color used if the checkbox is inactive.

 Currently [inactiveColor] is not used. Instead, [fillColor] controls the
 color of the background in all states, including when unselected.

- **checkColor**: `Color?`
  The color to use for the check icon when this checkbox is checked.

 If null, then the value of [CupertinoColors.white] is used if the checkbox
 is enabled. If the checkbox is disabled, a grey-black color is used.

- **tristate**: `bool`
  If true, the checkbox's [value] can be true, false, or null.

 [CupertinoCheckbox] displays a dash when its value is null.

 When a tri-state checkbox ([tristate] is true) is tapped, its [onChanged]
 callback will be applied to true if the current value is false, to null if
 value is true, and to false if value is null (i.e. it cycles through false
 => true => null => false when tapped).

 If tristate is false (the default), [value] must not be null, and
 [onChanged] will only toggle between true and false.

- **focusColor**: `Color?`
  The color for the checkbox's border shadow when it has the input focus.

 If null, then a paler form of the [activeColor] will be used.

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

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

 If this property is null and the checkbox's value is false, then the side
 defaults to a one pixel wide grey-black border.

- **shape**: `OutlinedBorder?`
  The shape of the checkbox.

 If this property is null then the shape defaults to a
 [RoundedRectangleBorder] with a circular corner radius of 4.0.

- **semanticLabel**: `String?`
  The semantic label for the checkbox that will be announced by screen readers.

 This is announced by assistive technologies (e.g TalkBack/VoiceOver).

 This label does not show in the UI.

- **width**: `double`
  The width of a checkbox widget.

## Constructors

### Unnamed Constructor
Creates a macOS-styled checkbox.

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

