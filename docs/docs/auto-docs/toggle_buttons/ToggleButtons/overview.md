# Overview for `ToggleButtons`

## Description

A set of toggle buttons.

 The list of [children] are laid out along [direction]. The state of each button
 is controlled by [isSelected], which is a list of bools that determine
 if a button is in an unselected or selected state. They are both
 correlated by their index in the list. The length of [isSelected] has to
 match the length of the [children] list.

 There is a Material 3 version of this component, [SegmentedButton],
 that's preferred for applications that are configured for Material 3
 (see [ThemeData.useMaterial3]).

 

 ## Updating to [SegmentedButton]

 There is a Material 3 version of this component, [SegmentedButton],
 that's preferred for applications that are configured for Material 3
 (see [ThemeData.useMaterial3]). The [SegmentedButton] widget's visuals
 are a little bit different, see the Material 3 spec at
 <https://m3.material.io/components/segmented-buttons/overview> for
 more details. The [SegmentedButton] widget's API is also slightly different.
 While the [ToggleButtons] widget can have list of widgets, the
 [SegmentedButton] widget has a list of [ButtonSegment]s with
 a type value. While the [ToggleButtons] uses a list of boolean values
 to determine the selection state of each button, the [SegmentedButton]
 uses a set of type values to determine the selection state of each segment.
 The [SegmentedButton.style] is a [ButtonStyle] style field, which can be
 used to customize the entire segmented button and the individual segments.

 
 This sample shows how to migrate [ToggleButtons] that allows multiple
 or no selection to [SegmentedButton] that allows multiple or no selection.

 ** See code in examples/api/lib/material/toggle_buttons/toggle_buttons.1.dart **
 

 
 This example showcase [ToggleButtons] in various configurations.

 ** See code in examples/api/lib/material/toggle_buttons/toggle_buttons.0.dart **
 

 ## Customizing toggle buttons
 Each toggle's behavior can be configured by the [onPressed] callback, which
 can update the [isSelected] list however it wants to.

 

 Here is an implementation that allows for multiple buttons to be
 simultaneously selected, while requiring none of the buttons to be
 selected.

 ```dart
 ToggleButtons(
   isSelected: isSelected,
   onPressed: (int index) ,
   children: const <Widget>[
     Icon(Icons.ac_unit),
     Icon(Icons.call),
     Icon(Icons.cake),
   ],
 ),
 ```

 

 Here is an implementation that requires mutually exclusive selection while
 requiring at least one selection. This assumes that [isSelected] was
 properly initialized with one selection.

 ```dart
 ToggleButtons(
   isSelected: isSelected,
   onPressed: (int index) ,
   children: const <Widget>[
     Icon(Icons.ac_unit),
     Icon(Icons.call),
     Icon(Icons.cake),
   ],
 ),
 ```

 

 Here is an implementation that requires mutually exclusive selection,
 but allows for none of the buttons to be selected.

 ```dart
 ToggleButtons(
   isSelected: isSelected,
   onPressed: (int index) ,
   children: const <Widget>[
     Icon(Icons.ac_unit),
     Icon(Icons.call),
     Icon(Icons.cake),
   ],
 ),
 ```

 

 Here is an implementation that allows for multiple buttons to be
 simultaneously selected, while requiring at least one selection. This
 assumes that [isSelected] was properly initialized with one selection.

 ```dart
 ToggleButtons(
   isSelected: isSelected,
   onPressed: (int index) ,
   children: const <Widget>[
     Icon(Icons.ac_unit),
     Icon(Icons.call),
     Icon(Icons.cake),
   ],
 ),
 ```

 ## ToggleButton Borders
 The toggle buttons, by default, have a solid, 1 logical pixel border
 surrounding itself and separating each button. The toggle button borders'
 color, width, and corner radii are configurable.

 The [selectedBorderColor] determines the border's color when the button is
 selected, while [disabledBorderColor] determines the border's color when
 the button is disabled. [borderColor] is used when the button is enabled.

 To remove the border, set [renderBorder] to false. Setting [borderWidth] to
 0.0 results in a hairline border. For more information on hairline borders,
 see [BorderSide.width].

 See also:

  * <https://material.io/design/components/buttons.html#toggle-button>

## Dependencies

- StatelessWidget

## Members

- **_defaultBorderWidth**: `double`
- **children**: `List&lt;Widget&gt;`
  The toggle button widgets.

 These are typically [Icon] or [Text] widgets. The boolean selection
 state of each widget is defined by the corresponding [isSelected]
 list item.

 The length of children has to match the length of [isSelected]. If
 [focusNodes] is not null, the length of children has to also match
 the length of [focusNodes].

- **isSelected**: `List&lt;bool&gt;`
  The corresponding selection state of each toggle button.

 Each value in this list represents the selection state of the [children]
 widget at the same index.

 The length of [isSelected] has to match the length of [children].

- **onPressed**: `void Function(int index)?`
  The callback that is called when a button is tapped.

 The index parameter of the callback is the index of the button that is
 tapped or otherwise activated.

 When the callback is null, all toggle buttons will be disabled.

- **mouseCursor**: `MouseCursor?`
  

 If this property is null, [WidgetStateMouseCursor.clickable] will be used.

- **tapTargetSize**: `MaterialTapTargetSize?`
  Configures the minimum size of the area within which the buttons may
 be pressed.

 If the [tapTargetSize] is larger than [constraints], the buttons will
 include a transparent margin that responds to taps.

 Defaults to [ThemeData.materialTapTargetSize].

- **textStyle**: `TextStyle?`
  The [TextStyle] to apply to any text in these toggle buttons.

 [TextStyle.color] will be ignored and substituted by [color],
 [selectedColor] or [disabledColor] depending on whether the buttons
 are active, selected, or disabled.

- **constraints**: `BoxConstraints?`
  Defines the button's size.

 Typically used to constrain the button's minimum size.

 If this property is null, then
 BoxConstraints(minWidth: 48.0, minHeight: 48.0) is be used.

- **color**: `Color?`
  The color for descendant [Text] and [Icon] widgets if the button is
 enabled and not selected.

 If [onPressed] is not null, this color will be used for values in
 [isSelected] that are false.

 If this property is null, then ToggleButtonTheme.of(context).color
 is used. If [ToggleButtonsThemeData.color] is also null, then
 Theme.of(context).colorScheme.onSurface is used.

- **selectedColor**: `Color?`
  The color for descendant [Text] and [Icon] widgets if the button is
 selected.

 If [onPressed] is not null, this color will be used for values in
 [isSelected] that are true.

 If this property is null, then
 ToggleButtonTheme.of(context).selectedColor is used. If
 [ToggleButtonsThemeData.selectedColor] is also null, then
 Theme.of(context).colorScheme.primary is used.

- **disabledColor**: `Color?`
  The color for descendant [Text] and [Icon] widgets if the button is
 disabled.

 If [onPressed] is null, this color will be used.

 If this property is null, then
 ToggleButtonTheme.of(context).disabledColor is used. If
 [ToggleButtonsThemeData.disabledColor] is also null, then
 Theme.of(context).colorScheme.onSurface.withOpacity(0.38) is used.

- **fillColor**: `Color?`
  The fill color for selected toggle buttons.

 If this property is null, then
 ToggleButtonTheme.of(context).fillColor is used. If
 [ToggleButtonsThemeData.fillColor] is also null, then
 the fill color is null.

 If fillColor is a [WidgetStateProperty&lt;Color&gt;], then [WidgetStateProperty.resolve]
 is used for the following [WidgetState]s:

  * [WidgetState.disabled]
  * [WidgetState.selected]

- **focusColor**: `Color?`
  The color to use for filling the button when the button has input focus.

 If this property is null, then
 ToggleButtonTheme.of(context).focusColor is used. If
 [ToggleButtonsThemeData.focusColor] is also null, then
 Theme.of(context).focusColor is used.

- **highlightColor**: `Color?`
  The highlight color for the button's [InkWell].

 If this property is null, then
 ToggleButtonTheme.of(context).highlightColor is used. If
 [ToggleButtonsThemeData.highlightColor] is also null, then
 Theme.of(context).highlightColor is used.

- **splashColor**: `Color?`
  The splash color for the button's [InkWell].

 If this property is null, then
 ToggleButtonTheme.of(context).splashColor is used. If
 [ToggleButtonsThemeData.splashColor] is also null, then
 Theme.of(context).splashColor is used.

- **hoverColor**: `Color?`
  The color to use for filling the button when the button has a pointer
 hovering over it.

 If this property is null, then
 ToggleButtonTheme.of(context).hoverColor is used. If
 [ToggleButtonsThemeData.hoverColor] is also null, then
 Theme.of(context).hoverColor is used.

- **focusNodes**: `List&lt;FocusNode&gt;?`
  The list of [FocusNode]s, corresponding to each toggle button.

 Focus is used to determine which widget should be affected by keyboard
 events. The focus tree keeps track of which widget is currently focused
 on by the user.

 If not null, the length of focusNodes has to match the length of
 [children].

 See [FocusNode] for more information about how focus nodes are used.

- **renderBorder**: `bool`
  Whether or not to render a border around each toggle button.

 When true, a border with [borderWidth], [borderRadius] and the
 appropriate border color will render. Otherwise, no border will be
 rendered.

- **borderColor**: `Color?`
  The border color to display when the toggle button is enabled and not
 selected.

 If this property is null, then
 ToggleButtonTheme.of(context).borderColor is used. If
 [ToggleButtonsThemeData.borderColor] is also null, then
 Theme.of(context).colorScheme.onSurface is used.

- **selectedBorderColor**: `Color?`
  The border color to display when the toggle button is selected.

 If this property is null, then
 ToggleButtonTheme.of(context).selectedBorderColor is used. If
 [ToggleButtonsThemeData.selectedBorderColor] is also null, then
 Theme.of(context).colorScheme.primary is used.

- **disabledBorderColor**: `Color?`
  The border color to display when the toggle button is disabled.

 If this property is null, then
 ToggleButtonTheme.of(context).disabledBorderColor is used. If
 [ToggleButtonsThemeData.disabledBorderColor] is also null, then
 Theme.of(context).disabledBorderColor is used.

- **borderWidth**: `double?`
  The width of the border surrounding each toggle button.

 This applies to both the greater surrounding border, as well as the
 borders rendered between toggle buttons.

 To render a hairline border (one physical pixel), set borderWidth to 0.0.
 See [BorderSide.width] for more details on hairline borders.

 To omit the border entirely, set [renderBorder] to false.

 If this property is null, then
 ToggleButtonTheme.of(context).borderWidth is used. If
 [ToggleButtonsThemeData.borderWidth] is also null, then
 a width of 1.0 is used.

- **borderRadius**: `BorderRadius?`
  The radii of the border's corners.

 If this property is null, then
 ToggleButtonTheme.of(context).borderRadius is used. If
 [ToggleButtonsThemeData.borderRadius] is also null, then
 the buttons default to non-rounded borders.

- **direction**: `Axis`
  The direction along which the buttons are rendered.

 Defaults to [Axis.horizontal].

- **verticalDirection**: `VerticalDirection`
  If [direction] is [Axis.vertical], this parameter determines whether to lay out
 the buttons starting from the first or last child from top to bottom.

## Constructors

### Unnamed Constructor
Creates a set of toggle buttons.

 It displays its widgets provided in a [List] of [children] along [direction].
 The state of each button is controlled by [isSelected], which is a list
 of bools that determine if a button is in an active, disabled, or
 selected state. They are both correlated by their index in the list.
 The length of [isSelected] has to match the length of the [children]
 list.

 Both [children] and [isSelected] properties arguments are required.

 The [focusNodes] argument must be null or a list of nodes. If [direction]
 is [Axis.vertical], [verticalDirection] must not be null.

