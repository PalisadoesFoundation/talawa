# Overview for `FloatingActionButtonThemeData`

## Description

Defines default property values for descendant [FloatingActionButton]
 widgets.

 Descendant widgets obtain the current [FloatingActionButtonThemeData] object
 using `Theme.of(context).floatingActionButtonTheme`. Instances of
 [FloatingActionButtonThemeData] can be customized with
 [FloatingActionButtonThemeData.copyWith].

 Typically a [FloatingActionButtonThemeData] is specified as part of the
 overall [Theme] with [ThemeData.floatingActionButtonTheme].

 All [FloatingActionButtonThemeData] properties are `null` by default.
 When null, the [FloatingActionButton] will use the values from [ThemeData]
 if they exist, otherwise it will provide its own defaults.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.

## Dependencies

- Diagnosticable

## Members

- **foregroundColor**: `Color?`
  Color to be used for the unselected, enabled [FloatingActionButton]'s
 foreground.

- **backgroundColor**: `Color?`
  Color to be used for the unselected, enabled [FloatingActionButton]'s
 background.

- **focusColor**: `Color?`
  The color to use for filling the button when the button has input focus.

- **hoverColor**: `Color?`
  The color to use for filling the button when the button has a pointer
 hovering over it.

- **splashColor**: `Color?`
  The splash color for this [FloatingActionButton]'s [InkWell].

- **elevation**: `double?`
  The z-coordinate to be used for the unselected, enabled
 [FloatingActionButton]'s elevation foreground.

- **focusElevation**: `double?`
  The z-coordinate at which to place this button relative to its parent when
 the button has the input focus.

 This controls the size of the shadow below the floating action button.

- **hoverElevation**: `double?`
  The z-coordinate at which to place this button relative to its parent when
 the button is enabled and has a pointer hovering over it.

 This controls the size of the shadow below the floating action button.

- **disabledElevation**: `double?`
  The z-coordinate to be used for the disabled [FloatingActionButton]'s
 elevation foreground.

- **highlightElevation**: `double?`
  The z-coordinate to be used for the selected, enabled
 [FloatingActionButton]'s elevation foreground.

- **shape**: `ShapeBorder?`
  The shape to be used for the floating action button's [Material].

- **enableFeedback**: `bool?`
  If specified, defines the feedback property for [FloatingActionButton].

 If [FloatingActionButton.enableFeedback] is provided, [enableFeedback] is
 ignored.

- **iconSize**: `double?`
  Overrides the default icon size for the [FloatingActionButton];

- **sizeConstraints**: `BoxConstraints?`
  Overrides the default size constraints for the [FloatingActionButton].

- **smallSizeConstraints**: `BoxConstraints?`
  Overrides the default size constraints for [FloatingActionButton.small].

- **largeSizeConstraints**: `BoxConstraints?`
  Overrides the default size constraints for [FloatingActionButton.large].

- **extendedSizeConstraints**: `BoxConstraints?`
  Overrides the default size constraints for [FloatingActionButton.extended].

- **extendedIconLabelSpacing**: `double?`
  The spacing between the icon and the label for an extended
 [FloatingActionButton].

- **extendedPadding**: `EdgeInsetsGeometry?`
  The padding for an extended [FloatingActionButton]'s content.

- **extendedTextStyle**: `TextStyle?`
  The text style for an extended [FloatingActionButton]'s label.

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  

 If specified, overrides the default value of [FloatingActionButton.mouseCursor].

## Constructors

### Unnamed Constructor
Creates a theme that can be used for
 [ThemeData.floatingActionButtonTheme].

