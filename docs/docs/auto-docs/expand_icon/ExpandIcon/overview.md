# Overview for `ExpandIcon`

## Description

A widget representing a rotating expand/collapse button. The icon rotates
 180 degrees when pressed, then reverts the animation on a second press.
 The underlying icon is [Icons.expand_more].

 The expand icon does not include a semantic label for accessibility. In
 order to be accessible it should be combined with a label using
 [MergeSemantics]. This is done automatically by the [ExpansionPanel] widget.

 See [IconButton] for a more general implementation of a pressable button
 with an icon.

 See also:

  * https://material.io/design/iconography/system-icons.html

## Dependencies

- StatefulWidget

## Members

- **isExpanded**: `bool`
  Whether the icon is in an expanded state.

 Rebuilding the widget with a different [isExpanded] value will trigger
 the animation, but will not trigger the [onPressed] callback.

- **size**: `double`
  The size of the icon.

 Defaults to 24.

- **onPressed**: `ValueChanged&lt;bool&gt;?`
  The callback triggered when the icon is pressed and the state changes
 between expanded and collapsed. The value passed to the current state.

 If this is set to null, the button will be disabled.

- **padding**: `EdgeInsetsGeometry`
  The padding around the icon. The entire padded icon will react to input
 gestures.

 Defaults to a padding of 8 on all sides.

- **color**: `Color?`
  
 The color of the icon.

 Defaults to [Colors.black54] when the theme's
 [ThemeData.brightness] is [Brightness.light] and to
 [Colors.white60] when it is [Brightness.dark]. This adheres to the
 Material Design specifications for [icons](https://material.io/design/iconography/system-icons.html#color)
 and for [dark theme](https://material.io/design/color/dark-theme.html#ui-application)
 

- **disabledColor**: `Color?`
  The color of the icon when it is disabled,
 i.e. if [onPressed] is null.

 Defaults to [Colors.black38] when the theme's
 [ThemeData.brightness] is [Brightness.light] and to
 [Colors.white38] when it is [Brightness.dark]. This adheres to the
 Material Design specifications for [icons](https://material.io/design/iconography/system-icons.html#color)
 and for [dark theme](https://material.io/design/color/dark-theme.html#ui-application)

- **expandedColor**: `Color?`
  The color of the icon when the icon is expanded.

 Defaults to [Colors.black54] when the theme's
 [ThemeData.brightness] is [Brightness.light] and to
 [Colors.white] when it is [Brightness.dark]. This adheres to the
 Material Design specifications for [icons](https://material.io/design/iconography/system-icons.html#color)
 and for [dark theme](https://material.io/design/color/dark-theme.html#ui-application)

- **splashColor**: `Color?`
  Defines the splash color of the IconButton.

 If [ThemeData.useMaterial3] is true, this field will be ignored,
 as [IconButton.splashColor] will be ignored, and you should use
 [highlightColor] instead.

 Defaults to [ThemeData.splashColor].

- **highlightColor**: `Color?`
  Defines the highlight color of the IconButton.

 Defaults to [ThemeData.highlightColor].

## Constructors

### Unnamed Constructor
Creates an [ExpandIcon] with the given padding, and a callback that is
 triggered when the icon is pressed.

