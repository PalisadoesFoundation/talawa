# Overview for `AnimatedTheme`

## Description

Animated version of [Theme] which automatically transitions the colors,
 etc, over a given duration whenever the given theme changes.

 Here's an illustration of what using this widget looks like, using a [curve]
 of [Curves.elasticInOut].
 

 See also:

  * [Theme], which [AnimatedTheme] uses to actually apply the interpolated
    theme.
  * [ThemeData], which describes the actual configuration of a theme.
  * [MaterialApp], which includes an [AnimatedTheme] widget configured via
    the [MaterialApp.theme] argument.

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **data**: `ThemeData`
  Specifies the color and typography values for descendant widgets.

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates an animated theme.

 By default, the theme transition uses a linear curve.

