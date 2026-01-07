# Overview for `NoDefaultCupertinoThemeData`

## Description

Styling specifications for a cupertino theme without default values for
 unspecified properties.

 Unlike [CupertinoThemeData] instances of this class do not return default
 values for properties that have been left unspecified in the constructor.
 Instead, unspecified properties will return null. This is used by
 Material's [ThemeData.cupertinoOverrideTheme].

 See also:

  * [CupertinoThemeData], which uses reasonable default values for
    unspecified theme properties.

## Members

- **brightness**: `Brightness?`
  The brightness override for Cupertino descendants.

 Defaults to null. If a non-null [Brightness] is specified, the value will
 take precedence over the ambient [MediaQueryData.platformBrightness], when
 determining the brightness of descendant Cupertino widgets.

 If coming from a Material [Theme] and unspecified, [brightness] will be
 derived from the Material [ThemeData]'s [brightness].

 See also:

  * [MaterialBasedCupertinoThemeData], a [CupertinoThemeData] that defers
    [brightness] to its Material [Theme] parent if it's unspecified.

  * [CupertinoTheme.brightnessOf], a method used to retrieve the overall
    [Brightness] from a [BuildContext], for Cupertino widgets.

- **primaryColor**: `Color?`
  A color used on interactive elements of the theme.

 This color is generally used on text and icons in buttons and tappable
 elements. Defaults to [CupertinoColors.activeBlue].

 If coming from a Material [Theme] and unspecified, [primaryColor] will be
 derived from the Material [ThemeData]'s `colorScheme.primary`. However, in
 iOS styling, the [primaryColor] is more sparsely used than in Material
 Design where the [primaryColor] can appear on non-interactive surfaces like
 the [AppBar] background, [TextField] borders etc.

 See also:

  * [MaterialBasedCupertinoThemeData], a [CupertinoThemeData] that defers
    [primaryColor] to its Material [Theme] parent if it's unspecified.

- **primaryContrastingColor**: `Color?`
  A color that must be easy to see when rendered on a [primaryColor] background.

 For example, this color is used for a [CupertinoButton]'s text and icons
 when the button's background is [primaryColor].

 If coming from a Material [Theme] and unspecified, [primaryContrastingColor]
 will be derived from the Material [ThemeData]'s `colorScheme.onPrimary`.

 See also:

  * [MaterialBasedCupertinoThemeData], a [CupertinoThemeData] that defers
    [primaryContrastingColor] to its Material [Theme] parent if it's unspecified.

- **textTheme**: `CupertinoTextThemeData?`
  Text styles used by Cupertino widgets.

 Derived from [primaryColor] if unspecified.

- **barBackgroundColor**: `Color?`
  Background color of the top nav bar and bottom tab bar.

 Defaults to a light gray in light mode, or a dark translucent gray color in
 dark mode.

- **scaffoldBackgroundColor**: `Color?`
  Background color of the scaffold.

 Defaults to [CupertinoColors.systemBackground].

- **applyThemeToAll**: `bool?`
  Flag to apply this theme to all descendant Cupertino widgets.

 Certain Cupertino widgets previously didn't use theming, matching past
 versions of iOS. For example, [CupertinoSwitch]s always used
 [CupertinoColors.systemGreen] when active.

 Today, however, these widgets can indeed be themed on iOS. Moreover on
 macOS, the accent color is reflected in these widgets. Turning this flag
 on ensures that descendant Cupertino widgets will be themed accordingly.

 This flag currently applies to the following widgets:
 - [CupertinoSwitch] & [Switch.adaptive]

 Defaults to false.

## Constructors

### Unnamed Constructor
Creates a [NoDefaultCupertinoThemeData] styling specification.

 Unspecified properties default to null.

