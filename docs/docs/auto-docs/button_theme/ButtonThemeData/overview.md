# Overview for `ButtonThemeData`

## Description

Used with [ButtonTheme] to configure the color and geometry of buttons.

 This class is planned to be deprecated in a future release.
 Please use one or more of these buttons and associated themes instead:

  * [TextButton], [TextButtonTheme], [TextButtonThemeData],
  * [ElevatedButton], [ElevatedButtonTheme], [ElevatedButtonThemeData],
  * [OutlinedButton], [OutlinedButtonTheme], [OutlinedButtonThemeData]

 A button theme can be specified as part of the overall Material theme
 using [ThemeData.buttonTheme]. The Material theme's button theme data
 can be overridden with [ButtonTheme].

## Dependencies

- Diagnosticable

## Members

- **minWidth**: `double`
  The minimum width for buttons.

 The actual horizontal space allocated for a button's child is
 at least this value less the theme's horizontal [padding].

 Defaults to 88.0 logical pixels.

- **height**: `double`
  The minimum height for buttons.

 Defaults to 36.0 logical pixels.

- **textTheme**: `ButtonTextTheme`
  Defines a button's base colors, and the defaults for the button's minimum
 size, internal padding, and shape.

 Despite the name, this property is not a [TextTheme], its value is not a
 collection of [TextStyle]s.

- **layoutBehavior**: `ButtonBarLayoutBehavior`
  Defines whether a [ButtonBar] should size itself with a minimum size
 constraint or with padding.

 Defaults to [ButtonBarLayoutBehavior.padded].

- **_padding**: `EdgeInsetsGeometry?`
- **_shape**: `ShapeBorder?`
- **alignedDropdown**: `bool`
  If true, then a [DropdownButton] menu's width will match the button's
 width.

 If false (the default), then the dropdown's menu will be wider than
 its button. In either case the dropdown button will line up the leading
 edge of the menu's value with the leading edge of the values
 displayed by the menu items.

 This property only affects [DropdownButton] and its menu.

- **_buttonColor**: `Color?`
  The background fill color.

 This property is null by default.

 If the button is in the focused, hovering, or highlighted state, then the
 `focusColor`, `hoverColor`, or `highlightColor` will take precedence over
 the `buttonColor`.

 See also:

  * [getFillColor], which is used to compute the background fill color.

- **_disabledColor**: `Color?`
  The background fill color when disabled.

 This property is null by default.

 See also:

  * [getDisabledFillColor], which is to compute background fill color for
    disabled state.

- **_focusColor**: `Color?`
  The fill color of the button when it has the input focus.

 This property is null by default.

 If the button is in the hovering or highlighted state, then the `hoverColor`
 or `highlightColor` will take precedence over the `focusColor`.

 See also:

  * [getFocusColor], which is used to compute the fill color of the button
    when it has input focus.

- **_hoverColor**: `Color?`
  The fill color of the button when a pointer is hovering over it.

 This property is null by default.

 If the button is in the highlighted state, then the `highlightColor` will
 take precedence over the `hoverColor`.

 See also:

  * [getHoverColor], which is used to compute the fill color of the button
    when it has input focus.

- **_highlightColor**: `Color?`
  The color of the overlay that appears when a button is pressed.

 This property is null by default.

 See also:

  * [getHighlightColor], which is used to compute the color of the overlay
    that appears when the `button` is pressed.

- **_splashColor**: `Color?`
  The color of the ink "splash" overlay that appears when a button is tapped.

 This property is null by default.

 See also:

  * [getSplashColor], which is used to compute the color of the ink
    "splash" overlay that appears when the (enabled) `button` is tapped.

- **colorScheme**: `ColorScheme?`
  A set of thirteen colors that can be used to derive the button theme's
 colors.

 This property was added much later than the theme's set of highly specific
 colors, like [ThemeData.highlightColor] and [ThemeData.splashColor] etc.

 The colors for new button classes can be defined exclusively in terms of
 [colorScheme]. When it's possible, the existing buttons will (continue to)
 gradually migrate to it.

- **_materialTapTargetSize**: `MaterialTapTargetSize?`
## Constructors

### Unnamed Constructor
Create a button theme object that can be used with [ButtonTheme]
 or [ThemeData].

 The [minWidth] and [height] parameters must greater than or equal to zero.

 The ButtonTheme's methods that have a [MaterialButton] parameter and
 have a name with a `get` prefix are used to configure a
 [RawMaterialButton].

