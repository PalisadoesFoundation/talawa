# Overview for `ButtonTheme`

## Description

Used with [ButtonThemeData] to configure the color and geometry of buttons.

 This class is planned to be deprecated in a future release.
 Please use one or more of these buttons and associated themes instead:

  * [ElevatedButton], [ElevatedButtonTheme], [ElevatedButtonThemeData],
  * [FilledButton], [FilledButtonTheme], [FilledButtonThemeData],
  * [OutlinedButton], [OutlinedButtonTheme], [OutlinedButtonThemeData]
  * [TextButton], [TextButtonTheme], [TextButtonThemeData],

 A button theme can be specified as part of the overall Material theme
 using [ThemeData.buttonTheme]. The Material theme's button theme data
 can be overridden with [ButtonTheme].

 The actual appearance of buttons depends on the button theme, the
 button's enabled state, its elevation (if any), and the overall [Theme].

 See also:

  * [RawMaterialButton], which can be used to configure a button that doesn't
    depend on any inherited themes.

## Dependencies

- InheritedTheme

## Members

- **data**: `ButtonThemeData`
  Specifies the color and geometry of buttons.

## Constructors

### Unnamed Constructor
Creates a button theme.

### fromButtonThemeData
Creates a button theme from [data].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
