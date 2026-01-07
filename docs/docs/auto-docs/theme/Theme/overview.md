# Overview for `Theme`

## Description

Applies a theme to descendant widgets.

 A theme describes the colors and typographic choices of an application.

 

 Descendant widgets obtain the current theme's [ThemeData] object using
 [Theme.of]. When a widget uses [Theme.of], it is automatically rebuilt if
 the theme later changes, so that the changes can be applied.

 The [Theme] widget implies an [IconTheme] widget, set to the value of the
 [ThemeData.iconTheme] of the [data] for the [Theme].

 To interact seamlessly with descendant Cupertino widgets, the [Theme] widget
 provides a [CupertinoTheme] for its descendants with a [CupertinoThemeData] inherited
 from the nearest ancestor [CupertinoTheme] or if none exists, derived from the
 Material [data] for the [Theme]. The values in the Material derived [CupertinoThemeData]
 are overridable through [ThemeData.cupertinoOverrideTheme]. The values from an
 inherited [CupertinoThemeData] can be overriden by wrapping the desired subtree
 with a [CupertinoTheme].

 See also:

  * [ThemeData], which describes the actual configuration of a theme.
  * [AnimatedTheme], which animates the [ThemeData] when it changes rather
    than changing the theme all at once.
  * [MaterialApp], which includes an [AnimatedTheme] widget configured via
    the [MaterialApp.theme] argument.

## Dependencies

- StatelessWidget

## Members

- **data**: `ThemeData`
  Specifies the color and typography values for descendant widgets.

- **child**: `Widget`
  The widget below this widget in the tree.

 

- **_kFallbackTheme**: `ThemeData`
## Constructors

### Unnamed Constructor
Applies the given theme [data] to [child].

