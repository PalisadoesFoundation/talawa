# Overview for `ToggleButtonsThemeData`

## Description

Defines the color and border properties of [ToggleButtons] widgets.

 Used by [ToggleButtonsTheme] to control the color and border properties
 of toggle buttons in a widget subtree.

 To obtain the current [ToggleButtonsTheme], use [ToggleButtonsTheme.of].

 Values specified here are used for [ToggleButtons] properties that are not
 given an explicit non-null value.

 See also:

  * [ToggleButtonsTheme], which describes the actual configuration of a
    toggle buttons theme.

## Dependencies

- Diagnosticable

## Members

- **textStyle**: `TextStyle?`
  The default text style for [ToggleButtons.children].

 [TextStyle.color] will be ignored and substituted by [color],
 [selectedColor] or [disabledColor] depending on whether the buttons
 are active, selected, or disabled.

- **constraints**: `BoxConstraints?`
  Defines the button's size.

 Typically used to constrain the button's minimum size.

- **color**: `Color?`
  The color for descendant [Text] and [Icon] widgets if the toggle button
 is enabled.

- **selectedColor**: `Color?`
  The color for descendant [Text] and [Icon] widgets if the toggle button
 is selected.

- **disabledColor**: `Color?`
  The color for descendant [Text] and [Icon] widgets if the toggle button
 is disabled.

- **fillColor**: `Color?`
  The fill color for selected toggle buttons.

- **focusColor**: `Color?`
  The color to use for filling the button when the button has input focus.

- **highlightColor**: `Color?`
  The highlight color for the toggle button's [InkWell].

- **splashColor**: `Color?`
  The splash color for the toggle button's [InkWell].

- **hoverColor**: `Color?`
  The color to use for filling the toggle button when the button has a
 pointer hovering over it.

- **borderColor**: `Color?`
  The border color to display when the toggle button is enabled.

- **selectedBorderColor**: `Color?`
  The border color to display when the toggle button is selected.

- **disabledBorderColor**: `Color?`
  The border color to display when the toggle button is disabled.

- **borderWidth**: `double?`
  The width of the border surrounding each toggle button.

 This applies to both the greater surrounding border, as well as the
 borders dividing each toggle button.

 To render a hairline border (one physical pixel), set borderWidth to 0.0.
 See [BorderSide.width] for more details on hairline borders.

- **borderRadius**: `BorderRadius?`
  The radii of the border's corners.

## Constructors

### Unnamed Constructor
Creates the set of color and border properties used to configure
 [ToggleButtons].

